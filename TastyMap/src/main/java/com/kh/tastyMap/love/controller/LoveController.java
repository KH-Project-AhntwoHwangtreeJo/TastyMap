package com.kh.tastyMap.love.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tastyMap.love.model.exception.IHaveLoveListException;
import com.kh.tastyMap.love.model.exception.LoveException;
import com.kh.tastyMap.love.model.service.LoveService;
import com.kh.tastyMap.love.model.vo.Love;
import com.kh.tastyMap.post.model.vo.PostList;

@Controller
public class LoveController {
	
	@Autowired
	LoveService loveService;
	
	@RequestMapping("love/myLove.do")
	public String myLove() {
		
		return "myPage/myLove";
	}
	
	// 좋아요 버튼 클릭시
	@RequestMapping("love/postLove.do")
	@ResponseBody
	public Map<String, Object> clickLove(@RequestParam int pNo, @RequestParam String memberId, Model model, HttpSession session) {
		Map<String, Object> map;
		
		Love love = new Love(memberId, pNo);
		
		try {
			map = loveService.clickLove(love);			
		} catch (Exception e) {
			throw new LoveException(e.getMessage());
		}
		
		return map;
	}
	
	// 좋아요 눌렀는지 확인용
	@RequestMapping("love/loveselect.do")
	@ResponseBody
	public Map<String, Object> selectLove(@RequestParam int pNo, @RequestParam String memberId, Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String status;
		Love love = new Love(memberId, pNo);
		
		try {
			int result = loveService.selectLove(love);
			
			if (result == 0) { // SELECT 해서 COUNT 한 결과가 없을 때 
				status = "N";			
			} else if(result == 1) { // SELECT해서 COUNT한 결과가 있을 때
				status = "Y";
			} else {
				status="null";
			}
			
			map.put("status", status);
			
		} catch (Exception e) {
			throw new LoveException(e.getMessage());
		}
		
		return map;
	} 
	
	/**
	 * 마이페이지에 좋아요한 게시글 목록 출력 서블릿
	 * @author Hyunmin Jo
	 * @return
	 */
	@RequestMapping("/love/iHaveLoveList.do")
	public String restarauntTop8(@RequestParam String member_Id, Model model, HttpSession session) {
		
		try {
			List<PostList> list = loveService.iHaveLoveList(member_Id);
			
			model.addAttribute("list",list);	
			
		} catch(Exception e) {
			
			throw new IHaveLoveListException(e.getMessage());
		}
		
		return "myPage/myLove";
	}
	
	
}
