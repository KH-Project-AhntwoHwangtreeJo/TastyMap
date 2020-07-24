package com.kh.tastyMap.post.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tastyMap.post.model.exception.PostException;
import com.kh.tastyMap.post.model.service.PostService;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.post.model.vo.PostRequest;

@Controller
public class PostController {
	
	@Autowired
	PostService postService;
	
	@RequestMapping("/post/insertPost.do")
	public void insertPost() {
		
	}
	
	@RequestMapping("/post/insertPostEnd.do")
	public String insertPost(PostRequest postRequst, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(value="upFile", required= false) List<MultipartFile> upFile) {
		
		//int star = Integer.parseInt(request.getParameter("star"));
		System.out.println("화면에서 넘어온 값:" + postRequst);
		
		String rName = "배스킨라빈스 강남중앙점";
		String address = "서울 강남구 강남대로96길 9";
		
//		String rName = postRequst.getRName();
//		String address = postRequst.getAddress();
	
		
		
		
		
		int rno = postService.selectRestaurantName(rName);
		
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
		post.setStar(postRequst.getStar());
		post.setRNo(rno);
		
		System.out.println("DB에 입력되는 값:" + post);
		
		
		
		//1. 파일을 저장할 경로 생성
		String saveDir = session.getServletContext().getRealPath("/resources/upload/post");
		
		List<Picture> pictureList = new ArrayList<Picture>();
		 //2. 폴더 유무 확인 후 생성
		File dir = new File(saveDir);
		
		if(dir.exists() == false) dir.mkdirs();  // getRealPath 경로에 폴더가 없으면 만들어주고 있으면 나두는 코드

		 //3. 파일 업로드 시작 (MultipartFile 사용 시)
		System.out.println("사진:"+ upFile);
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String originName = f.getOriginalFilename();
				System.out.println(originName);
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
			}
		}
		int result = 0;

		try {
			result = postService.insertPost(post, pictureList);
			
			// PNO
		} catch(Exception e) {
			System.err.print(e.getMessage());
			System.err.print(e.getStackTrace());
//			throw new PostException("게시글 등록 오류");
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

		 return "common/msg";

	}
	
	@RequestMapping("/post/resAddress.do")
	public String resAddress() {
		System.out.println("ggg");
		return "post/resAddress";
	}
	
	// post 상세페이지
	@RequestMapping("/post/postDetail.do")
	public String selectOne(@RequestParam int pNo, Model model) {
		
		Post p = postService.postDetail(pNo);
		List postPhoto = postService.postDetailPhoto(pNo);
		
		System.out.println("controller postPhoto : " + postPhoto);
		System.out.println("controller p : " + p);
		
		model.addAttribute("post", p)
			 .addAttribute("postDetailPhotoList", postPhoto);
		
		return "post/postDetail";
			
	}
	

	
	
}
