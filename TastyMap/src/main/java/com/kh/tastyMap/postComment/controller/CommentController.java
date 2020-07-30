package com.kh.tastyMap.postComment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tastyMap.postComment.model.service.CommentService;
import com.kh.tastyMap.postComment.model.vo.PostComment;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	
	@RequestMapping("postComment/insertComment.do")
	@ResponseBody
	public Map<String, Object> insertComment(PostComment postComment, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		  System.out.println(postComment);
		 
		int result = commentService.insertComment(postComment);
		
		
		String msg = "";
		
		if(result > 0) msg = "댓글달기 성공";
		else msg = "댓글 달기 실패!";
		
		map.put("msg", msg);
		
		return map;
	}
}
