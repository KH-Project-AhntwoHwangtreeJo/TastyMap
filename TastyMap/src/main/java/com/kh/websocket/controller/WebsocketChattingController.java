package com.kh.websocket.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WebsocketChattingController {

	@RequestMapping("/chatting.do")
	public String chattingMethod(@RequestParam String userName,
								 Model model, HttpSession session,
								 HttpServletRequest req) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");// 인코팅 필터 없어서 바로 등록함
		session.setAttribute("userName", userName);
		String ipAddr = req.getRemoteAddr();
		model.addAttribute("host", ipAddr);
		
		return "chat/chattingView";
	}
}
