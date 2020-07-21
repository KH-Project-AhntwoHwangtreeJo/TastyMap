package com.kh.tastyMap.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tastyMap.member.model.service.MemberService;
import com.kh.tastyMap.member.model.vo.Member;

@Controller
public class MemberController {

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
}
