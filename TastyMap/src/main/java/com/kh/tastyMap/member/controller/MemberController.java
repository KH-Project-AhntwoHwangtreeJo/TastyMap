package com.kh.tastyMap.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tastyMap.member.model.exception.MemberException;
import com.kh.tastyMap.member.model.service.MemberService;
import com.kh.tastyMap.member.model.vo.Follower;
import com.kh.tastyMap.member.model.vo.Member;
import com.kh.tastyMap.post.model.vo.PostList;

@SessionAttributes(value= {"member"})
@Controller
public class MemberController {
	
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	
   @Autowired
   BCryptPasswordEncoder bcryptPasswordEncoder;
   
   @Autowired
   MemberService memberService;
   
   // 마이 갤러리 조회
   @RequestMapping("/member/myGallery.do")
   public String selectOne(@RequestParam String memberId, @RequestParam String followerId, Model model, HttpSession session) {
	  // 변수 설명
	  // memberId = 마이갤러리 주인 아이디
	  // followerId = 세션의 아이디
	   //-------------------------------------//
	  // 1. 마이갤러리 유저 정보
	  // 2. 마이갤러리 사진 리스트
	  // 3. 포스트 개수, 팔로우 개수, 팔로워 개수
	  // 4. 특정 유저의 팔로우 여부
	  //--------------------------------------//
	  // < 변수 선언부 >
	  // 1. 마이갤러리 유저 정보
      Member u = memberService.myGallery(memberId);
      // 2. 마이갤러리 사진 리스트
      List photo = memberService.myGalleryPhoto(memberId);
      // 3. 포스트 개수, 팔로우 개수, 팔로워 개수 
      Map<String, Object> cntMap = memberService.followAndPostCnt(memberId); 
      // 4. 멤버가 유저를 팔로우한 여부 
      Map<String, Object> map = new HashMap<String, Object>();
      
   // 황하용 제작 팔로워 리스트 뽑아옴//
      List<Map<String, String>> myFollowingList = memberService.myFollowingList(memberId);
      List<Map<String, String>> myFollowerList = memberService.myFollowerList(memberId);
      
      String status; // 팔로우 했는지 결과를 받아올 변수 
      //---------------------------------------//
      // <변수 실행부>
      Follower follower = new Follower(memberId, followerId); // 팔로우 조회용
      int result = memberService.selectFollower(follower); // 팔로우 조회용
      
      // 팔로우 했는지 조회 결과에 따른 상태 선언 조건문 
      if (result == 0) { // select해서 count 결과가 없을 때
    	  status = "N"; // N : DB 에 없다.
      } else if (result == 1) { // select 해서 count 한 결과가 있을 때
    	  status = "Y"; // Y : DB 에 있다. 
      } else {
    	  status = "null";
      }
    
      map.put("status", status); // 팔로우 결과 넣어줌
      map.put("follower", follower); // 팔로우 객체에 있는 정보 맵에 넣어줌
      
      model.addAttribute("user", u)  // 마이갤러리 소유중인 user 의 정보
          .addAttribute("myGPhoto", photo) // 마이갤러리에 사진 리스트 정보
          .addAttribute("map", map) // 팔로우 정보
          .addAttribute("followerCnt", cntMap.get("followerCnt"))
          .addAttribute("followingCnt", cntMap.get("followingCnt"))
          .addAttribute("myPostCnt", cntMap.get("myPostCnt"))
          .addAttribute("myFollowingList", myFollowingList)
          .addAttribute("myFollowerList", myFollowerList);
      
        //                 jsp,              맵으로 가져온 카운트
      
      return "post/myGallery";
   }
   
   
// 팔로워 클릭시 
   @RequestMapping("member/clickFollower.do")
   // ↓ ajax 사용해서 값만 여기로 보낼때 사용한다.
   @ResponseBody  
   public Map<String, Object> clickFollower(@RequestParam String memberId, @RequestParam String followerId, Model model, HttpSession session) {
 	  Map<String, Object> map;
 	  
 	  try {
 	  Follower follower = new Follower(memberId, followerId);
 	  
 	  map = memberService.clickFollower(follower);
 	  
 	  } catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
 	  return map;
   }
   
   // 팔로워 삭제 버튼
   @RequestMapping("/member/followerCancel.do")
	@ResponseBody
	public Map<String, Object> followerCancel(@RequestParam String memberId, @RequestParam String followerId, Model model, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>(); 
		Follower follower = new Follower(memberId, followerId);
		
		try {
		boolean isUsable = memberService.followerCancel(follower) != 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		} catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
		// @ResponseBody는 결과가 viewResolver로 가지 않고, 직접 그 결과 자체를 화면으로 전달한다
		
		return map;
	}
   

   // 주소입력 api 연결
   @RequestMapping("/member/jusoPopup.do")
   public String jusoPopup() {
      
      return "member/jusoPopup";
   }
   
// 이메일인증 api 연결 
	@RequestMapping("/member/emailAuth.do")
	public String emailAuth() {
		
		return "member/email";
	}
	
	// 아이디 찾기 창 띄움
	@RequestMapping("/member/goFindId.do")
	public String goFindId() {
		return "member/findId";
	}
   
	// 이메일 보내기 눌렀을시 실제 가게 되는 이메일 제작
	@RequestMapping( value = "/member/auth.do" , method=RequestMethod.POST )
    public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
        String setfrom = "fpdlqm123@gamil.com"; //보내는사람
        
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        "<img src=\"http://localhost:8088/tastyMap/resources/images/logo.png\">"+
         
        "<br>안녕하세요 회원님 TastyMap을 찾아주셔서 감사합니다<br>"+

        "<br> 인증번호는 " +dice+ " 입니다. <br>"+
        
        "<br>받으신 인증번호를 홈페이지에 입력해 주세요 ㅇㅂㅇ/"; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content, true); // 메일 내용
            
            mailSender.send(message);
            
        } catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/email_injeung");     //뷰의이름
        mv.addObject("dice", dice);
        mv.addObject("InputEmail", tomail);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }
	
	//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
    //틀리면 다시 원래 페이지로 돌아오는 메소드
    @RequestMapping(value = "/member/join_injeung.do{dice}", method = RequestMethod.POST)
    public ModelAndView join_injeung(String email_injeung, String InputEmail, String dice, HttpServletResponse response_equals) throws IOException {

        //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
         
        ModelAndView mv = new ModelAndView();
        
        try {
        mv.setViewName("/member/join.do");
        
        mv.addObject("e_mail",email_injeung);
        mv.addObject("InputEmail",InputEmail);
        
        if (email_injeung.equals(dice)) {
            
            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
            
            
        	mv.setViewName("member/join");
            //mv.setViewName("member/insertMember");
            
            mv.addObject("e_mail",email_injeung);
            mv.addObject("InputEmail",InputEmail);
            
            //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
            //한번더 입력할 필요가 없게 한다.
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
            out_equals.flush();
            
            return mv;
            
            
        }else if (email_injeung != dice) {
            
            
            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("member/email_injeung");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
            out_equals.flush();
            
    
            return mv2;
            
        }  
        
        } catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
        return mv;
        
    }
	
    // 회원가입 페이지로 넘어감
    @RequestMapping("/member/goInsertMember.do")
    public String goInsertMember() {
    	return "member/insertMember";
    }
    
    // 회원가입
   @RequestMapping("/member/insertMember.do")
   // jsp 에서 받을 때 name 값을 다 다르게줘서 하나하나 준 모습이다
   public String InsertMember(@RequestParam("inputId0") String memberId,
                        @RequestParam("inputPassword0") String password,
                        @RequestParam("inputName") String userName,
                        @RequestParam("inputNicName") String nickname,
                        @RequestParam("inputIntro") String mcontent,
                        @RequestParam("yy") String birth0,
                        @RequestParam("mm") String birth1,
                        @RequestParam("dd") String birth2,
                        @RequestParam("inputGender") String gender,
                        @RequestParam("inputMobile") String phone,
                        @RequestParam("InputEmail") String email,
                        @RequestParam("roadFullAddr") String address,
                        Model model,
                        @RequestParam(value="mphoto", required = false) MultipartFile[] mphoto, HttpServletRequest request
                        ) {
      
      Date birth = Date.valueOf(birth0 + "-" + birth1 + "-" + birth2);
      String mstatus = "Y";
      
      try {
      // 프로필사진 저장할 폴더
      String savePath = request.getSession().getServletContext().getRealPath("/resources/images/profileImage");
      
      File dir = new File(savePath);
      
      
      if (dir.exists() == false) dir.mkdirs();
      String renamedFileName = "";
      
      // 여기까지 나옴
      for (MultipartFile f : mphoto) {
         if (!f.isEmpty()) {
            // 파일 이름 재생성 해서 저장하기
            String originalFileName = f.getOriginalFilename();
            String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
            // sample.jsp --> .jpg 만 꺼냄

            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

            int rndNum = (int) (Math.random() * 1000);

            renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
            // --> 20191230_154500_1.jpg

            try {
               f.transferTo(new File(savePath + "/" + renamedFileName));

            } catch (IllegalStateException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }

         } else {
            renamedFileName = "defaultMmember.png";
         } 
         
         
         // 저장된 파일 정보를 list에 담기
      
      }
      
      String plainPassword = password;
      
      
      /********************** 암호화 Start ************************/
      
      String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
      // $2a$10$rf8eKgXvjSm6ZC7BiP4Lj.I3v6X3sPwbe0fISb3DrYk82mumYtdaW
      // $2a$ : 암호 알고리즘 (모드)
      // 10$ : 4-31 회 중 10번 반복 횟수를 거침
      // rf8eKgXvjSm6ZC7BiP4Lj. : 랜덤 Salt (임의의 문자열 22글자)
      // I3v6X3sPwbe0fISb3DrYk82mumYtdaW : 실제 암호화된 결과 (31글자)
      
      /********************** 암호화    End ************************/
      
      
      Member member = new Member(memberId, encryptPassword, renamedFileName, userName, nickname,
            mcontent, birth, gender, phone, email, address, mstatus);
      
      // 서비스 로직을 수행
      int result = memberService.insertMember(member);
      
      String loc = "/";
      String msg = "";
      
      // 수행한 결과에 따라 화면 분기 처리 
      if(result > 0) msg = "회원가입성공!";
      else msg = "회원가입 실패!";
      
      model.addAttribute("loc", loc); // like request.setAttribute("loc", loc);
      model.addAttribute("msg", msg);
      
      } catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
      
      return "common/msg";
   }
   
   // 아이디 중복체크
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> responseBodyProcess(String memberId){
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		try {
		boolean isUsable = memberService.checkIdDuplicate(memberId) == 0 ? true : false;
		map.put("isUsable", isUsable);
		
		// @ResponseBody는 결과가 viewResolver로 가지 않고, 직접 그 결과 자체를 화면으로 전달한다
		
		} catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
		return map;
	}
	
	// 회원정보수정페이지로 넘어가기전에 비밀번호 확인
	@RequestMapping("/member/checkPassword.do")
	@ResponseBody
	public Map<String, Object> respenseBodyProcess(@RequestParam String memberId,@RequestParam  String password){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
		Member m = memberService.selectOne(memberId);
		
		boolean isUsable;
		
		if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
			isUsable = true;
            
         } else {
        	 isUsable = false;
         }
		
		map.put("isUsable", isUsable);
		
		
		} catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
		
		return map;
		
	}
	
	// 로그인
   @RequestMapping(value="/member/memberLogin.do",method=RequestMethod.POST)
   public ModelAndView memberLogin(
         @RequestParam("inputId") String memberId,
         @RequestParam("inputPassword") String password) {
      ModelAndView mav = new ModelAndView();
      
      try { // 로그인 에러시 에러 페이지 이동용 try-catch
      
      Member m = memberService.selectOne(memberId);
      
      // 직접 만든 예외 발생 구문
      // if(true) throw new RuntimeException("내가 던진 에러 구문!");
      
      
      
      // 2. view 처리
      String msg = "";
      String loc = "/";
      
      if(m == null) {
         msg = "존재 하지 않는 아이디입니다.";
      } else {
         
         // ** 비밀번호 암호화 검증 예정
         // 똑같은 비밀번호라도 암호화된 결과가 다르기때문에 bcrypt객체를 사용하여 matches함수로 
         // 둘 간의 값이 동일한지 검증하는 수학적 계산을 수행한다 
         if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
            msg = "로그인 성공";
            
            mav.addObject("member", m); // setAttribute()
            
         } else {
            msg = "비밀번호가 틀렸습니다.";
         }
         
         
      }
      // Model 객체에 담기는 값은 기본 request 영역에 저장된다

      
      
      mav.addObject("loc", loc);
      mav.addObject("msg", msg);
      
      mav.setViewName("common/msg");
      } catch (Exception e) {
         
         throw new MemberException(e.getMessage());
      }
      
      return mav;
   }
   
   // 아이디 찾기
   @RequestMapping("/member/findId.do")
   public String findId(@RequestParam("findIdName") String userName,
	         @RequestParam("findIdBirth") String birth1 , Model model) throws ParseException {
	   
	   // 데이터 베이스에 yy/mm/dd 라고 저장되어있기때문에 6글자로 받아온 birth1을 데이터베이스 형식에 맞춰줌
	   SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
	   java.util.Date d1 = sdf.parse(birth1);
	   sdf.applyPattern("yyyy-MM-dd");
	   
	   Date birth = Date.valueOf(sdf.format(d1));
	   
	   
	   Member member = new Member(userName, birth);
	   
	   
	   try {
	   
	   model.addAttribute("findId", memberService.findIdMember(member));
	   
	   } catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
	   
	   return "member/yourId";
   }
   
   // 로그아웃
   @RequestMapping("/member/memberLogout.do")
   public String memberLogout(SessionStatus status) {
      // SessionStatus 는 현재 사용자가 접속한 웹 브라우저와 서버 사이의 세션의 설정을 가지는 객체
      
      // 세션이 아직 완료되지 않았다면 세션을 종료 시키라
      if(! status.isComplete())
         status.setComplete();
      
      return "redirect:/";
   }
   
   // 회원탈퇴 (회원탈퇴시 세션비워줌)
   @RequestMapping("/member/deleteMember.do")
   public String deleteMember(@RequestParam("memberId") String memberId,
		   					Model model, SessionStatus status) {
	   
	   memberService.deleteMember(memberId);
	   
	   if(! status.isComplete())
	         status.setComplete();
	   
	   return "redirect:/";
   }
   
   // 회원정보 수정 페이지 이동
   @RequestMapping("/member/goMemberUpdate.do")
   public String goMemberUpdate(@RequestParam String memberId,@RequestParam String password, Model model) {

	   try {
      model.addAttribute("member", memberService.selectOne(memberId));
      
	   } catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
      return "member/updateMember";
   }
         
   // 회원 정보 수정 기능 메소드
   @RequestMapping("/member/memberUpdate.do")
   public String memberUpdate(@RequestParam("inputId0") String memberId,
  		 @RequestParam("inputPassword0") String password,
            @RequestParam("inputNicName") String nickname,
            @RequestParam("inputIntro") String mcontent,
            @RequestParam("inputMobile") String phone,
            @RequestParam("InputEmail") String email,
            @RequestParam("roadFullAddr") String address,
            Model model,
            @RequestParam(value="mphoto", required = false) MultipartFile[] mphoto, HttpServletRequest request) {
      
      String mstatus = "Y";

      // 프로필사진 저장할 폴더
      String savePath = request.getSession().getServletContext().getRealPath("/resources/images/profileImage");
      
      File dir = new File(savePath);
      
      try {
      if (dir.exists() == false) dir.mkdirs();
      String renamedFileName = "";
      
      // 여기까지 나옴
      for (MultipartFile f : mphoto) {
         if (!f.isEmpty()) {
            // 파일 이름 재생성 해서 저장하기
            String originalFileName = f.getOriginalFilename();
            String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
            // sample.jsp --> .jpg 만 꺼냄

            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

            int rndNum = (int) (Math.random() * 1000);

            renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
            // --> 20191230_154500_1.jpg

            try {
               f.transferTo(new File(savePath + "/" + renamedFileName));

            } catch (IllegalStateException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }

         } else {
            renamedFileName = "null";
         } 
         
         
         // 저장된 파일 정보를 list에 담기
      
      }
   int result;
   if(password.length()>0) {
      String plainPassword = password;

      /********************** 암호화 Start ************************/
      
      String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
      // $2a$10$rf8eKgXvjSm6ZC7BiP4Lj.I3v6X3sPwbe0fISb3DrYk82mumYtdaW
      // $2a$ : 암호 알고리즘 (모드)
      // 10$ : 4-31 회 중 10번 반복 횟수를 거침
      // rf8eKgXvjSm6ZC7BiP4Lj. : 랜덤 Salt (임의의 문자열 22글자)
      // I3v6X3sPwbe0fISb3DrYk82mumYtdaW : 실제 암호화된 결과 (31글자)
      
      /********************** 암호화    End ************************/
      
      
      Member member = new Member(memberId, encryptPassword, renamedFileName, nickname,
            mcontent, phone, email, address, mstatus);
      
      
      // 서비스 로직을 수행
      result = memberService.updateMember1(member);
      } else {
      	
      	Member member = new Member(memberId, renamedFileName, nickname,
                  mcontent, phone, email, address, mstatus);
      	
      result = memberService.updateMember2(member);
      }
      
      String loc = "/";
      String msg = "";
      
      // 수행한 결과에 따라 화면 분기 처리 
      if(result > 0) msg = "정보수정성공!";
      else msg = "정보수정 실패!";
      
      model.addAttribute("loc", loc); // like request.setAttribute("loc", loc);
      model.addAttribute("msg", msg);
      
      Member m = memberService.selectOne(memberId);
      
      model.addAttribute("member", m);
      
      } catch (Exception e) {
			
			throw new MemberException(e.getMessage());
		}
      
      return "common/msg";
   }
        
   // 팔로잉 취소 버튼
   @RequestMapping("/member/followingCancel.do")
   @ResponseBody
   public Map<String, Object>followingCancel(@RequestParam String memberId, @RequestParam String followerId, Model model, HttpSession session){
 	   Map<String, Object> map = new HashMap<String, Object>(); 
 		Follower follower = new Follower(memberId, followerId);
 		
 		try {
 		boolean isUsable = memberService.followingCancel(follower) != 0 ? true : false;
 		
 		map.put("isUsable", isUsable);
 		
 		// @ResponseBody는 결과가 viewResolver로 가지 않고, 직접 그 결과 자체를 화면으로 전달한다
 		} catch (Exception e) {
 			
 			throw new MemberException(e.getMessage());
 		}
 		
 		return map;
   }
   
   	 /**
	  * 마이페이지에 지도 마커와 카테고리별 차트, 지역별 차트 출력 서블릿
	  * @author Hyunmin Jo, Yejin Ahn
	  * @return
	  */   
      @RequestMapping("/member/myPage.do")
      public String myPage(@RequestParam String memberId, PostList post, Model model, HttpSession session) {
    	  String member_Id=memberId;
    	  
    	  try {

    	  List<PostList> list = memberService.myPage(member_Id);
    	  
    	  model.addAttribute("list",list);
          
    	  // --------------------------------------------------------------------------------
    	  
    	  Map<String, Object> map =new HashMap<String, Object>();

    	  	//String k="";
    		//String c="";
    		//String j ="";
    		//String y ="";
    		//String e ="";
    		
    		String[] category = new String[5];
    		BigDecimal[] cntCategory = new BigDecimal[5];
    		
    		String[] countrys = new String[5];
    		BigDecimal[] ctyCounts = new BigDecimal[5];
    		
    		List<Map<String, Object>> rChart = memberService.restaurantChartList(member_Id);	
    		// 한식/중식/일식/양식/기타
    		int idxx=0;
      		for( Map<String, Object> r : rChart ) {
      			
      			category[idxx] = (String) (r.get("category"));
      			cntCategory[idxx] = (BigDecimal)(r.get("cntCategory"));
      	
      			// k = String.valueOf((r.get("한식")));
      			// c = String.valueOf((r.get("중식")));
      			// j = String.valueOf((r.get("일식")));
      			// y = String.valueOf((r.get("양식")));
      			// e = String.valueOf((r.get("기타")));
      			 //System.out.println(member);
      			 //System.out.println(category);
      			idxx++;
      		}
      		
      		for(int i=0; i<idxx; i++) {
      		map.put(category[i],cntCategory[i]);
      		}
      		//map.put("k", k);
      		//map.put("c", c);
      		//map.put("j", j);
      		//map.put("y", y);
      		//map.put("e", e);
      		model.addAttribute("map", map);
      		model.addAttribute("category",category);
      		model.addAttribute("cntCategory",cntCategory);
      		//System.out.println(map);
      	
     		
     	// --------------------------------------------------------------------------------
     		//식당 행정구 통계
      		List<Map<String, Object>> nawhabariChart = memberService.addressChartList();
     		
     		int idx = 0;
     		for( Map<String, Object> n : nawhabariChart ) {
     			countrys[idx] = (String)n.get("COUNTRY");
     			ctyCounts[idx] = (BigDecimal)(n.get("ctyCount"));
     			
     			idx++;
     		}    	

     		for(int i=0; i<idx; i++) {

 			map.put(countrys[i], ctyCounts[i]);
     		}
     		
     		model.addAttribute("map", map);
     		model.addAttribute("countrys",countrys);
     		
    	  } catch (Exception e) {
  			
  			throw new MemberException(e.getMessage());
  		}
          return "myPage/myPage";
      }

}