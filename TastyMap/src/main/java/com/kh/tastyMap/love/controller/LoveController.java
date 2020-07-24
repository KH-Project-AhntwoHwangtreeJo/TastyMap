package com.kh.tastyMap.love.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoveController {
	
	@RequestMapping("love/myLove.do")
	public String myLove() {
		
		return "myPage/myLove";
	}
	
}
