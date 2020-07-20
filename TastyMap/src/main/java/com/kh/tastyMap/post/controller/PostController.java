package com.kh.tastyMap.post.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tastyMap.post.model.service.PostService;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;

@Controller
public class PostController {
	
	@Autowired
	PostService postService;
	
	@RequestMapping("/post/insertPost.do")
	public void insertPost() {
		
	//}
	
	//@RequestMapping("/post/insertPostEnd.do")
	//public String insertPost(Post post, Model model, HttpSession session,
	//		@RequestParam(value="upFile", required= false) MultipartFile[] upFile) {
		
		// 1. 파일을 저장할 경로 생성
	//	String saveDir = session.getServletContext().getRealPath("/resources/upload/post");
		
	//	List<Picture> pictureList = new ArrayList<Picture>();
		
		// 2. 폴더 유무 확인 후 생성
	//	File dir = new File(saveDir);
		
	//	if(dir.exists() == false) dir.mkdirs();  // getRealPath 경로에 폴더가 없으면 만들어주고 있으면 나두는 코드

		// 3. 파일 업로드 시작 (MultipartFile 사용 시)
		//for(MultipartFile f : upFile) {
		//	if(!f.isEmpty()) {
				
		//	}
	//	}
	}
}
