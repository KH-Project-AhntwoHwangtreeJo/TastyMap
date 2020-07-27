package com.kh.tastyMap.love.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tastyMap.love.model.service.LoveService;
import com.kh.tastyMap.love.model.vo.Love;

@Controller
public class LoveController {
	
	@Autowired
	LoveService loveService;
	
	@RequestMapping("love/myLove.do")
	public String myLove() {
		
		return "myPage/myLove";
	}
	
	@RequestMapping("love/postLove.do")
	@ResponseBody
	public Map<String, Object> clickLove(@RequestParam int pNo, @RequestParam String memberId, Model model, HttpSession session) {
		Map<String, Object> map;
		
		Love love = new Love(memberId, pNo);
		
		map = loveService.clickLove(love);
		
		return map;
	}
	
	@RequestMapping("love/loveselect.do")
	@ResponseBody
	public Map<String, Object> selectLove(@RequestParam int pNo, @RequestParam String memberId, Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String status;
		Love love = new Love(memberId, pNo);
		
		int result = loveService.selectLove(love);
		 
		if (result == 0) { // SELECT 해서 COUNT 한 결과가 없을 때 
			status = "N";			
		} else if(result == 1) { // SELECT해서 COUNT한 결과가 있을 때
			status = "Y";
		} else {
			status="null";
		}
		
		map.put("status", status);
		
		return map;
	} 
}
