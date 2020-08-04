package com.kh.tastyMap.admin.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tastyMap.admin.model.service.AdminService;
import com.kh.tastyMap.common.util.Utils;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	/**
	 * admin 페이지 이동 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/adminMain.do")
	public String adminPage() {
		return "admin/adminIndex";
	}
	
	
	/**
	 * admin 회원관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/selectMember.do")
	public String adminMemberSelect(Model model) {
		
		List<Map<String, String>> list=adminService.selectMemberList();
		
		
		model.addAttribute("list", list);
			
		return "admin/memberList";
	}
	
	
	/**
	 * admin 식당 관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/selectRestaurant.do")
	public String adminRestaurantList(Model model) {
		
		List<Map<String, String>> list=adminService.selectRestaurantList();
		
		model.addAttribute("list", list);
			
		return "admin/restaurantList";
	}
	
	@RequestMapping("/admin/goinsertRestaurant.do")
	public String adminRestaurantInsert(Model model) {
		
		return "admin/restaurantInsert";
	}
	
	@RequestMapping("/admin/insertRestaurant.do")
	public String insertRestaurant(@RequestParam String rName, @RequestParam String rcontent, @RequestParam String category, @RequestParam String price, @RequestParam String time,
			@RequestParam String tel, @RequestParam String address, @RequestParam String paking, @RequestParam Date updatedate, @RequestParam String rstatus, Model model) {
		
		Restaurant R = new Restaurant(rName,rcontent,category,price,time,tel,address,paking,updatedate,rstatus);
		
		
		adminService.insertRestaurant(R);
		
		List<Map<String, String>> list=adminService.selectRestaurantList();
		
		
		model.addAttribute("list", list);
			
		return "admin/restaurantList";
	}

	
	/**
	 * admin 게시글 관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/selectPost.do")
	public String adminPostList(Model model) {
		// 1. 게시글 전체 리스트를 가져오는 리스트 객체
		List<Map<String, String>> list=adminService.selectPostList();
		System.out.println(list);
		
		// 2. 게시글에 대한 사진 리스트를 가져오는 객체
		//List<Map<String, String>> pictureList = adminService.selectPictureList();
		
		// 3. 화면으로 보내줄 객체들 추가 
		model.addAttribute("list", list);
			
		return "admin/postList";
	}
	
	
	/**
	 * admin 댓글 신고 관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/selectCommentReport.do")
	public String adminCommentReportList(Model model) {
		
		List<Map<String, String>> list=adminService.selectCommentReportList();
		
		
		model.addAttribute("list", list);
			
		return "admin/commentReportList";
	}
	
	/**
	 * admin 게시글 신고 관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/selectPostReport.do")
	public String adminPostReportList(Model model) {
		
		List<Map<String, String>> list=adminService.selectPostReportList();
		
		
		model.addAttribute("list", list);
			
		return "admin/postReportList";
	}
	
	
	
	
	/**
	 * admin 공지사항 관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	/*
	@RequestMapping("/admin/selectNotice.do")
	public String adminNoticeList(Model model) {
		
		List<Map<String, String>> list=adminService.selectNoticeList();
		
		
		model.addAttribute("list", list);
			
		return "admin/noticeList";
	}
	*/

}
