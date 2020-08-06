package com.kh.tastyMap.post.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tastyMap.love.model.service.LoveService;
import com.kh.tastyMap.love.model.vo.Love;
import com.kh.tastyMap.post.model.exception.PostException;
import com.kh.tastyMap.post.model.service.PostService;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.post.model.vo.PostRequest;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.report.model.service.ReportService;
import com.kh.tastyMap.report.model.vo.Report;

@Controller
public class PostController {
	
	@Autowired
	PostService postService;
	@Autowired
	LoveService loveService;
	@Autowired
	ReportService reportService;
	
	
	// 게시글 전체리스트 조회// 사용자에게 응답할 view를 생성
		@RequestMapping("/post/postAllList.do")
		
		// String은 controller에서 view로 리턴할 때 model을 매개변수로 리턴한다.->postAllList로
		public String postAllList(Model model) {
			
			List<PostList> postList = postService.postAllList();
			System.out.println(postList);
		
			model.addAttribute("postList", postList);
			
			return "post/postAllList";
		}
		
	
	@RequestMapping("/post/insertPost.do")
	public void insertPost() {
		
	}
	
		//게시글 정보 전달 (postDetail -> insertPost)(조은성)
	@RequestMapping("/post/postchange.do")
	public String postchange(int pNo, String pContent, double star,String rname, String memberId, String address, Model model) {		    
		try {
		List postPhoto = postService.postDetailPhoto(pNo); 	    
		model.addAttribute("pNo", pNo); 
		model.addAttribute("postPhoto", postPhoto); 
		model.addAttribute("pContent", pContent);
		model.addAttribute("star", star);	
		model.addAttribute("rname", rname);
		model.addAttribute("address", address);
		}catch (Exception e) {
			 // 오류 시 PostException 동작
			throw new PostException(e.getMessage());
		 }
		return "post/insertPost";
	}
	
		//식당 상세페이지에서 게시글 등록(조은성)
	@RequestMapping("/post/restaurantInsert.do")
	public String restaurantInsert(String rname,String address, Model model) {
	 try {
		model.addAttribute("rname", rname);
		model.addAttribute("address", address);
	 }catch (Exception e) {
		 // 오류 시 PostException 동작
		throw new PostException(e.getMessage());
	 }
		return "post/insertPost";
	}

	   //게시글 수정하기(조은성)
	@RequestMapping("/post/updatePostEnd.do")
	   public String updatePostEnd(PostRequest postRequst, Model model, HttpSession session, HttpServletRequest request,
	         @RequestParam(value="upFile", required= false) List<MultipartFile> upFile) {
	    		
	      String rName = postRequst.getRName();
	      String address = postRequst.getAddress();
		  int pno = postRequst.getPno();
	      int rno = postService.selectRestaurantName(rName);
	      try {
	      if(rno > 0) { // 가져오기 성공
	         System.out.println("가져오기 성공");
	      } else { // 없는 경우 레스토랑 테이블에 추가 해줘야 한다.
	         System.out.println("RNO 없음");
	         
	         // insert into restaurant -> rno가 생김
	         try {
	            int insertResult = postService.insertFirstRestaurant(rName, address);         
	            
	            if (insertResult < 1) {
	               System.err.print("새로운 레스토랑 등록 실패");
	            }
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	         // select 다시
	         rno = postService.selectRestaurantName(rName);
	      }
	      
	      Post post = new Post();
	      post.setMember_Id(postRequst.getMember_Id());
	      post.setPContent(postRequst.getPContent());
	      post.setStar(postRequst.getStarValue());
	      post.setPNo(postRequst.getPno()); 
	      post.setRNo(rno);
	
	      //1. 파일을 저장할 경로 생성
	      String saveDir = session.getServletContext().getRealPath("/resources/upload/post");
	      
	      List<Picture> pictureList = new ArrayList<Picture>();
	       //2. 폴더 유무 확인 후 생성
	      File dir = new File(saveDir);
	      
	      // mkdir과 mkdirs 의 차이점 - mkdir은 해당 위치에 폴더가 있어야만 하고, mkdirs는 폴더가 없으면 만들어준다.
	      if(dir.exists() == false) dir.mkdirs();  // getRealPath 경로에 폴더가 없으면 만들어주고 있으면 나두는 코드

	       //3. 파일 업로드 시작 (MultipartFile 사용 시)

	      // for (Object obj : files)
	      // files를 하나씩 객체를 꺼내서 obj에 넣어준다..
	      int i = 0;
	      for(MultipartFile f : upFile) {
	         if(!f.isEmpty()) {
	            String originName = f.getOriginalFilename();	         
	            String ext = originName.substring(originName.lastIndexOf(".")+1);
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	         
	            int rndNum = (int)(Math.random()*1000);
	            // member_id 를 이미지파일이름 규칙에 추가

	            String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;

	            try {
	               f.transferTo(new File(saveDir + "/" + renamedName));
	            } catch (IllegalStateException | IOException e) {
	               e.printStackTrace();
	            }
	            
	            Picture pic = new Picture();
	            pic.setPOriginName(originName);
	            pic.setPRenamedName(renamedName);
	            
	            pictureList.add(pic);
	            
	            // 첫번째 사진의 레벨은 0 /즉,대표사진
	            if(i == 0) {
	               pic.setPLevel(0);
	            // 나머지 사진은 1   
	            } else {
	               pic.setPLevel(1);
	            }
	            
	         }
	         i++; // 사진 하나 담기면 +1 // 그러면 레벨 구분됨
	      }
	      int result = 0;

	      try {
	         result = postService.updatePost(post, pictureList);
	    
	         // PNO
	      } catch(Exception e) {
	         System.err.print(e.getMessage());
	         System.err.print(e.getStackTrace());
//	         throw new PostException("게시글 등록 오류");
	      }

	       String loc = "/post/postAllList.do";
	       String msg = "";

	       if(result > 0) {
	          msg = "게시글 수정 완료!";
	          loc = "/post/postAllList.do?no="+post.getPNo();

	       } else {
	          msg = "게시글 수정 실패!";
	          
	       }

	       model.addAttribute("loc", loc).addAttribute("msg", msg);
	      }catch (Exception e) {
				 // 오류 시 PostException 동작
				throw new PostException(e.getMessage());
			 }

	       return "common/msg";

	   }
	
	
	   //새로운 게시글 생성하기
	@RequestMapping("/post/insertPostEnd.do")
	   public String insertPost(PostRequest postRequst, Model model, HttpSession session, HttpServletRequest request,
	         @RequestParam(value="upFile", required= false) List<MultipartFile> upFile) {
	     	   
	      String rName = postRequst.getRName();
	      String address = postRequst.getAddress();
	      int rno = postService.selectRestaurantName(rName);
	      try {
	      if(rno > 0) { // 가져오기 성공
	         System.out.println("가져오기 성공");
	      } else { // 없는 경우 레스토랑 테이블에 추가 해줘야 한다.
	         System.out.println("RNO 없음");
	         
	         // insert into restaurant -> rno가 생김
	         try {
	            int insertResult = postService.insertFirstRestaurant(rName, address);         
	            
	            if (insertResult < 1) {
	               System.err.print("새로운 레스토랑 등록 실패");
	            }
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	         
	         rno = postService.selectRestaurantName(rName);
	      }
	      
	      Post post = new Post();
	      post.setMember_Id(postRequst.getMember_Id());
	      post.setPContent(postRequst.getPContent());
	      post.setStar(postRequst.getStarValue());
	      post.setRNo(rno);
	      
	  
	   
      
	      //1. 파일을 저장할 경로 생성
	      String saveDir = session.getServletContext().getRealPath("/resources/upload/post");
	      
	      List<Picture> pictureList = new ArrayList<Picture>();
	       //2. 폴더 유무 확인 후 생성
	      File dir = new File(saveDir);
	      
	      // mkdir과 mkdirs 의 차이점 - mkdir은 해당 위치에 폴더가 있어야만 하고, mkdirs는 폴더가 없으면 만들어준다.
	      if(dir.exists() == false) dir.mkdirs();  // getRealPath 경로에 폴더가 없으면 만들어주고 있으면 나두는 코드

	       //3. 파일 업로드 시작 (MultipartFile 사용 시)
	      System.out.println("사진:"+ upFile);
	      // for (Object obj : files)
	      // files를 하나씩 객체를 꺼내서 obj에 넣어준다..
	      int i = 0;
	      for(MultipartFile f : upFile) {
	         if(!f.isEmpty()) {
	            String originName = f.getOriginalFilename();
	          
	            String ext = originName.substring(originName.lastIndexOf(".")+1);
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	         
	            int rndNum = (int)(Math.random()*1000);
	            // member_id 를 이미지파일이름 규칙에 추가

	            String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;

	            try {
	               f.transferTo(new File(saveDir + "/" + renamedName));
	            } catch (IllegalStateException | IOException e) {
	               e.printStackTrace();
	            }
	            
	            Picture pic = new Picture();
	            pic.setPOriginName(originName);
	            pic.setPRenamedName(renamedName);
	            
	            pictureList.add(pic);
	            
	            // 첫번째 사진의 레벨은 0 /즉,대표사진
	            if(i == 0) {
	               pic.setPLevel(0);
	            // 나머지 사진은 1   
	            } else {
	               pic.setPLevel(1);
	            }
	            
	         }
	         i++; // 사진 하나 담기면 +1 // 그러면 레벨 구분됨
	      }
	      int result = 0;

	      try {
	         result = postService.insertPost(post, pictureList);
	         
	         // PNO
	      } catch(Exception e) {
	         System.err.print(e.getMessage());
	         System.err.print(e.getStackTrace());
//	         throw new PostException("게시글 등록 오류");
	      }

	    
	       String loc = "/post/postAllList.do";
	       String msg = "";

	       if(result > 0) {
	          msg = "게시글 등록 성공!";
	          loc = "/post/postAllList.do?no="+post.getPNo();

	       } else {
	          msg = "게시글 등록 실패!";
	          
	       }

	       model.addAttribute("loc", loc).addAttribute("msg", msg);

	      }catch (Exception e) {
				 // 오류 시 PostException 동작
				throw new PostException(e.getMessage());
			 }
	       return "common/msg";

	   }
	
	
	
	@RequestMapping("/post/postDelete.do")
	public String postDelete(@RequestParam int pNo, HttpSession session, Model model) {
		
		
		
		
		int result2 = postService.deletePicture(pNo);
		int result = postService.deletePost(pNo);
		int result1= postService.deleteComment(pNo);
		
	
		
		return "post/myGallery";
	}
	

	// 게시글 식당 이름 주소 
	@RequestMapping("/post/resAddress.do")
	public String resAddress() {
		//System.out.println("ggg");
		return "post/resAddress";
	}
	
	// post 상세페이지
	@RequestMapping("/post/postDetail.do")
	public String selectOne(@RequestParam int pNo, Model model, @RequestParam String memberId) {
		// 1. 게시글 정보
		// 2. 게시글에 대한 사진 리스트
		// 3. 특정 유저의 해당 게시글 좋아요 여부 조회
		// 4. 특정 유저의 해당 게시글 신고 여부
		// 5. 댓글 정보
		//--------------------------------------//
		// <변수 선언부 > 
		// 1. 포스트 기타 정보 및 사진 정보 (선언과 동시에 실행) 
		Post p = postService.postDetail(pNo);
		
		// 2. 사진 리스트(선언과 동시에 실행)
		List postPhoto = postService.postDetailPhoto(pNo);
		// 3. 좋아요 여부 조회 / 4. 신고여부 조회
		Map<String, Object> map = new HashMap<String, Object>(); // 좋아요 조회용
		// 5. 댓글 정보
		List<PostComment> PComment = postService.commentList(pNo);
		// 6. 해당 포스트에 신고된 댓글번호 리스트
		List commentNoReportList = reportService.selectCommentReportList(pNo);
				
		String status; // 좋아요 조회용 결과를 받아올 변수
		String pstatus; // 포스트 신고 조회용  결과를 받아올 변수
		String pcstatus; // 포스트 댓글 신고 조회용 결과 받아올 변수
		//-------------------------------------//
	
		// <변수 실행부>
		Love love = new Love(memberId, pNo); // 좋아요 조회용
		Report report = new Report(memberId, pNo); // 포스트 신고 조회용
		//Report creport = new Report(memberId, cno); // 댓글 신고 조회용
		postService.updatePCNT(pNo);
		
		int result= loveService.selectLove(love); // 좋아요 조회용

		int presult = reportService.selectPostReport(report); // 포스트 신고 조회용
		int pcresult = reportService.selectCommentReport(report);// 댓글 신고 조회용
		System.out.println("controller : " + pcresult);
		
		// 좋아요 조회 결과에 따른 상태 선언 조건문
		if (result == 0) { // SELECT해서 COUNT 한 결과가 없을 때
			status = "N"; // N : DB에 없다.
		} else if(result == 1) { // SELECT 해서 COUNT 한 결과가 있을 때
			status = "Y"; // Y : DB에 있다.
		} else {
			status="null";
		}
		
		
		  // 게시글 신고 조회 조건문 
		if (presult == 0) { // SELECT 해서 COUNT 한 결과가 없을때 (신고 안한거) -게시글 
			pstatus = "N"; 
		} else if(presult == 1) { // SELECT 해서 COUNT 한 결과가 있을 때 (신고 한거) - 게시글 
			pstatus = "Y"; 
		} else { 
			pstatus = "null"; 
		}
		
		// 댓글 신고 조회 조건문
		if (pcresult == 0) { // SELECT 해서 COUNT 한 결과가 없을때 (신고 안한거) -댓글 
			pcstatus = "N"; 
		} else if(pcresult == 1) { // SELECT 해서 COUNT 한 결과가 있을 때 (신고 한거) - 댓글 
			pcstatus = "Y"; 
		} else { 
			pcstatus = "null"; 
		}
		 
		
		map.put("status", status); // 좋아요 결과 넣어줌
		map.put("pstatus", pstatus); // 게시글 신고 결과 넣어줌		
		map.put("pstatus", pstatus); // 게시글 신고 결과 넣어줌
		map.put("pcstatus", pcstatus); // 댓글 신고 결과 넣어줌
		
		model.addAttribute("post", p) // 포스트 기본 정보
			 .addAttribute("postDetailPhotoList", postPhoto) // 포스트 내 사진 정보
			 .addAttribute("map", map) // 좋아요 정보 & 게시글 신고 정보
			 .addAttribute("PComment", PComment) // 댓글 정보
			 .addAttribute("commentNoReportList", commentNoReportList); // 해당 포스트에 신고된 댓글번호 리스트
		
		String member_Id = memberId;
		int pno = pNo;
		//내 게시글에 좋아요한 사용자 리스트(안예진)
		List<PostList> pList = postService.getLoveMemberList(pno);
		
		model.addAttribute("pList" ,pList);
		
		return "post/postDetail";
			
	}
	

	

	
}
