package com.kh.tastyMap.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.kh.tastyMap.member.model.vo.Member;

@SessionAttributes(value= {"member"})
@Controller
public class MemberController {

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	MemberService memberService;
	
	// 마이 갤러리 조회
	@RequestMapping("/member/myGallery.do")
	public String selectOne(@RequestParam String memberId, Model model) {
		
		Member m = memberService.myGallery(memberId);
		int[]cnt = memberService.followAndPostCnt(memberId);  
		
		
		model.addAttribute("member", m)
			 .addAttribute("cnt", cnt);
		
		return "member/myGallery";
	}
	
	@RequestMapping("/member/jusoPopup.do")
	public String jusoPopup() {
		System.out.println("5475745");
		return "member/jusoPopup";
	}
	
	@RequestMapping("/member/goInsertMember.do")
	public String goInsertMember() {
		return "member/insertMember";
	}
	
	@RequestMapping("/member/insertMember.do")
	public String InsertMember(@RequestParam("inputId") String memberId,
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
		System.out.println(memberId);
		System.out.println(password);
		System.out.println(userName);
		System.out.println(nickname);
		System.out.println(mcontent);
		System.out.println(birth);
		System.out.println(gender);
		System.out.println(phone);
		System.out.println(email);
		System.out.println(address);
		System.out.println(mphoto);
		
		// 프로필사진 저장할 폴더
		String savePath = request.getSession().getServletContext().getRealPath("/resources/images/profileImage");
		
		File dir = new File(savePath);
		
		System.out.println("폴더가 있나요? " + dir.exists());
		
		if (dir.exists() == false) dir.mkdirs();
		String renamedFileName = "";
		System.out.println("upFiles" + mphoto[0].getOriginalFilename());
		
		// 여기까지 나옴
		for (MultipartFile f : mphoto) {
			System.out.println(f);
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
		
		System.out.println("비밀번호 암호화 전 : " + plainPassword);
		
		/********************** 암호화 Start ************************/
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		// $2a$10$rf8eKgXvjSm6ZC7BiP4Lj.I3v6X3sPwbe0fISb3DrYk82mumYtdaW
		// $2a$ : 암호 알고리즘 (모드)
		// 10$ : 4-31 회 중 10번 반복 횟수를 거침
		// rf8eKgXvjSm6ZC7BiP4Lj. : 랜덤 Salt (임의의 문자열 22글자)
		// I3v6X3sPwbe0fISb3DrYk82mumYtdaW : 실제 암호화된 결과 (31글자)
		
		/********************** 암호화    End ************************/
		
		System.out.println("비밀번호 암호화 후 : " + encryptPassword);
		
		Member member = new Member(memberId, encryptPassword, renamedFileName, userName, nickname,
				mcontent, birth, gender, phone, email, address, mstatus);
		
		System.out.println(member);
		// 서비스 로직을 수행
		int result = memberService.insertMember(member);
		
		String loc = "/";
		String msg = "";
		
		// 수행한 결과에 따라 화면 분기 처리 
		if(result > 0) msg = "회원가입성공!";
		else msg = "회원가입 실패!";
		
		model.addAttribute("loc", loc); // like request.setAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		
		return "common/msg";
	}
	
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	// 자바객체인 map이나 hashmap 등등을 자바스크립트에서는 처리를(객체를 넘겨주지)못하는데 @ResponseBody를 객체를 넘겨준다.

	public Map<String, Object> checkIdDuplicate(@RequestParam String memberId) {

		boolean isUsable = memberService.checkIdDuplicate(memberId) == 0 ? true : false;

		Map<String, Object> map = new HashMap();
		map.put("isUsable", isUsable);

		return map;
	}
	
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
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status) {
		// SessionStatus 는 현재 사용자가 접속한 웹 브라우저와 서버 사이의 세션의 설정을 가지는 객체
		
		// 세션이 아직 완료되지 않았다면 세션을 종료 시키라
		if(! status.isComplete())
			status.setComplete();
		
		return "redirect:/";
	}
}
