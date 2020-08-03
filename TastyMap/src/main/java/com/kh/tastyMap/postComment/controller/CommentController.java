package com.kh.tastyMap.postComment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tastyMap.postComment.model.service.CommentService;
import com.kh.tastyMap.postComment.model.vo.PostComment;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	
	@RequestMapping("postComment/insertComment.do")
	public String insertComment(PostComment postComment, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		  System.out.println("postComment controller : " + postComment);
		 
		int result = commentService.insertComment(postComment);
		// 
		String msg = "";
		int pNo=postComment.getPNo();
		String cwriter = postComment.getCwriter();
		String page= "/post/postDetail.do?pNo="+pNo+"&memberId="+cwriter;
		
		if(result > 0) msg = "댓글달기 성공";
		else msg = "댓글 달기 실패!";
		
		map.put("msg", msg);
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc",page);
		return "common/msg";
	}
	
	@RequestMapping("postComment/updateComment.do")
	@ResponseBody
	public Map<String, String> updateComment(@RequestParam int cno, @RequestParam String ccontent, Model model) {
		Map<String, String> pcmap = new HashMap<String, String>();
		
		PostComment postComment = new PostComment(cno, ccontent);
		int result = commentService.updateComment(postComment);
		String msg = "";
		
		if (result > 0) msg = "댓글 수정 성공";
		else msg = "댓글 수정 실패!"; 			
		
		pcmap.put("msg", msg);
		
			
		return pcmap;
	}
	
	@RequestMapping("postComment/deleteCommnet.do")
	@ResponseBody
	public Map<String, String> deleteComment(@RequestParam int cno) {
		Map<String, String> delmap = new HashMap<String, String>();
		
		int result = commentService.deleteComment(cno);
		String msg = "";
		
		if (result > 0) msg = "댓글 삭제 성공!";
		else msg = "댓글 삭제 실패!";
		
		delmap.put("msg", msg);
		
		return delmap;
	}
}
