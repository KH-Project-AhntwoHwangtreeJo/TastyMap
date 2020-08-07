package com.kh.tastyMap.admin.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tastyMap.admin.model.exception.AdminException;
import com.kh.tastyMap.admin.model.service.AdminService;
import com.kh.tastyMap.member.model.vo.Member;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.report.model.vo.Report;
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
		
		try {
			// 회원 리스트 가져와서
			List<Map<String, String>> list=adminService.selectMemberList();
			// 화면으로 보냄
			model.addAttribute("list", list);
			
		}catch(Exception e) {
			throw new AdminException(e.getMessage());
		}
		return "admin/memberList";
	}
	
	
	/**
	 * 회원 활성화 상태 변경
	 * @author Sung A Cho
	 * @param memberId
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updateMemberStatus.do")
	@ResponseBody
	public Map<String, String> adminMemberUpdateStatus(@RequestParam String memberId, @RequestParam boolean status, Model model) {

		// 1. 변수선언부
		int result=0; // 회원의 상태를 변경하고 결과를 받아올 변수
		String mstatus=""; // 회원의 상태를 받아서 Y,N으로 담아줄 변수 (true/false로 넘어옴)
		String msg=""; // 결과에 따라 화면으로 보내줄 메세지를 저장할 변수
		Map<String, String> map; // 메세지를 화면으로 보내줄 객체
		
		if(status== true) {
			mstatus="Y";
		}else {
			mstatus="N";
		}
		
		Member member= new Member(memberId, mstatus);
		// 2. 실행부
		result = adminService.updateMemberList(member);
		if(result>0)msg="회원 상태 변경 성공";
		else msg="회원 상태 변경 실패";
		
		// 결과에 따른 메세지를 map 객체에 담아 화면으로 보냄
		map = new HashMap<String, String>();
		map.put("msg", msg);
		
		return map;
	}
	
	
	/**
	 * admin 식당 관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/selectRestaurant.do")
	public String adminRestaurantList(Model model) {
		try {
			// 식당 리스트 가져와서
			List<Map<String, String>> list=adminService.selectRestaurantList();
			// 화면으로 보냄
			model.addAttribute("list", list);
			
		}catch(Exception e) {
			throw new AdminException(e.getMessage());
		}
		return "admin/restaurantList";
	}
	
	/**
	 * admin 식당 등록 페이지로 이동하는 서블릿
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/goinsertRestaurant.do")
	public String adminRestaurantInsert(Model model) {
		
		return "admin/restaurantInsert";
	}
	
	/**
	 * admin 식당 등록 서블릿
	 * @author ha young Hwang
	 * @param rName
	 * @param rcontent
	 * @param category
	 * @param price
	 * @param time
	 * @param tel
	 * @param address
	 * @param paking
	 * @param updatedate
	 * @param rstatus
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/insertRestaurant.do")
	public String insertRestaurant(@RequestParam String rName, @RequestParam String rcontent, @RequestParam String category, @RequestParam String price, @RequestParam String time,
			@RequestParam String tel, @RequestParam String address, @RequestParam String paking, @RequestParam Date updatedate, @RequestParam String rstatus, Model model) {
		
		try {
			// 페이지에서 받은 식당 정보를 레스토랑 객체에 담음
			Restaurant R = new Restaurant(rName,rcontent,category,price,time,tel,address,paking,updatedate,rstatus);
			adminService.insertRestaurant(R); // 식당 객체를 DB로 보내서 추가
			
			List<Map<String, String>> list=adminService.selectRestaurantList();
			
			
			model.addAttribute("list", list);
		
		
		}catch(Exception e) {
			throw new AdminException(e.getMessage());
		}	
		return "admin/restaurantList";
	}
	
	// admin 식당 활성화 상태 변경 서블릿
	@RequestMapping("/admin/updateRestaurantStatus.do")
	@ResponseBody
	public Map<String, String> updateRestaurantStatus(@RequestParam int rno, @RequestParam boolean status, Model model) {

		// 1. 변수선언부
		int result=0; // 식당의 상태를 변경하고 결과를 받아올 변수
		String rstatus=""; // 식당의 상태를 받아서 Y,N으로 담아줄 변수 (true/false로 넘어옴)
		String msg=""; // 결과에 따라 화면으로 보내줄 메세지를 저장할 변수
		Map<String, String> map; // 메세지를 화면으로 보내줄 객체
		
		if(status== true)rstatus="Y";
		else rstatus="N";
		
		Restaurant restaurant = new Restaurant(rno, rstatus);

		// 2. 실행부
		result = adminService.updateRestaurantStatus(restaurant);
		if(result>0)msg="식당 활성화 상태 변경 성공";
		else msg="식당 활성화 상태 변경 실패";
		
		// 결과에 따른 메세지를 map 객체에 담아 화면으로 보냄
		map = new HashMap<String, String>();
		map.put("msg", msg);
		
		return map;
	}
	
	// admin 식당admin 활성화 상태 변경 서블릿
	@RequestMapping("/admin/updateRestaurantAdminStatus.do")
	@ResponseBody
	public Map<String, String> updateRestaurantAdminStatus(@RequestParam int rno, @RequestParam int status, Model model) {

		// 1. 변수선언부
		int result=0; // 식당의 상태를 DB에 변경하고 결과를 받아올 변수
		String adminStatus=""; // 관리자의 상태를 받아서 해당하는 값으로 담아줄 변수 (status변수에 1~4의 값으로 넘어옴)
		String msg=""; // 결과에 따라 화면으로 보내줄 메세지를 저장할 변수
		Map<String, String> map; // 메세지를 화면으로 보내줄 객체
		
		// range의 값에 따라 Admin 상태 값 지정
		switch (status) {
		case 1: adminStatus="R";
			break;
		case 2: adminStatus="H";
			break;
		case 3: adminStatus="C";
			break;
		case 4: adminStatus="A";
			break;
		}
		
		Restaurant restaurant = new Restaurant(rno, adminStatus);
		// 2. 실행부
		result = adminService.updateRestaurantAdminStatus(restaurant);
		if(result>0)msg="식당 admin 상태 변경 성공";
		else msg="식당 admin 상태 변경 실패";
		
		// 결과에 따른 메세지를 map 객체에 담아 화면으로 보냄
		map = new HashMap<String, String>();
		map.put("msg", msg);
		
		return map;
	}

	
	/**
	 * admin 게시글 관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/selectPost.do")
	public String adminPostList(Model model) {
		
		try {
			
		// 1. 게시글 전체 리스트를 가져오는 리스트 객체
		List<Map<String, String>> list=adminService.selectPostList();
		//System.out.println(list);
		
		// 2. 게시글에 대한 사진 리스트를 가져오는 객체
		//List<Map<String, String>> pictureList = adminService.selectPictureList();
		
		// 3. 화면으로 보내줄 객체들 추가 
		model.addAttribute("list", list);
		
		
		}catch(Exception e) {
			throw new AdminException(e.getMessage());
		}	
		return "admin/postList";
	}
	
	/**
	 * 관리자 게시글 상태 변경용 메소드
	 * 
	 * @param pNo
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updatePostStatus.do")
	@ResponseBody
	public Map<String, String> adminPostUpdateStatus(@RequestParam int pNo, @RequestParam boolean status, Model model) {

		// 1. 변수선언부
		int result=0; // 게시글의 상태를 변경하고 결과를 받아올 변수
		String pStatus=""; // 게시글의 상태를 받아서 Y,N으로 담아줄 변수 (true/false로 넘어옴)
		String msg=""; // 결과에 따라 화면으로 보내줄 메세지를 저장할 변수
		Map<String, String> map; // 메세지를 화면으로 보내줄 객체
		
		if(status== true) {
			pStatus="Y";
		}else {
			pStatus="N";
		}
		
		Post post= new Post(pNo, pStatus);
		// 2. 실행부
		result = adminService.adminPostUpdateStatus(post);
		if(result>0)msg="게시글 상태 변경 성공";
		else msg="게시글상태 변경 실패";
		
		// 결과에 따른 메세지를 map 객체에 담아 화면으로 보냄
		map = new HashMap<String, String>();
		map.put("msg", msg);
		
		return map;
	}
	
	/**
	 * admin 댓글 신고 관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/selectCommentReport.do")
	public String adminCommentReportList(Model model) {
		
		try {
		List<Map<String, String>> list=adminService.selectCommentReportList();
		model.addAttribute("list", list);
		
		
		}catch(Exception e) {
			throw new AdminException(e.getMessage());
		}
		
		
		return "admin/commentReportList";
	}
	
	/**
	 * 신고된 댓글의 활성화 상태를 변경하는 서블릿
	 * @author Sung A Cho
	 * @param cno
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/adminPostCommentStatus.do")
	@ResponseBody
	public Map<String, String> adminPostCommentStatus(@RequestParam int cno, @RequestParam boolean status, Model model) {

		// 1. 변수선언부
		int result=0; // 게시글의 상태를 변경하고 결과를 받아올 변수
		String cStatus=""; // 게시글의 상태를 받아서 Y,N으로 담아줄 변수 (true/false로 넘어옴)
		String msg=""; // 결과에 따라 화면으로 보내줄 메세지를 저장할 변수
		Map<String, String> map; // 메세지를 화면으로 보내줄 객체

		if(status== true) {
			cStatus="Y";
		}else {
			cStatus="N";
		}
		
		PostComment comment= new PostComment(cno, cStatus);

		// 2. 실행부
		result = adminService.adminPostCommentStatus(comment);
		if(result>0)msg="댓글 상태 변경 성공";
		else msg="댓글 상태 변경 실패";
		
		// 결과에 따른 메세지를 map 객체에 담아 화면으로 보냄
		map = new HashMap<String, String>();
		map.put("msg", msg);
		
		return map;
	}
	
	/**
	 * 댓글의 신고상태를 변경하는 서블릿
	 * @author Sung A Cho
	 * @param reno
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/cReportStatusUpdate.do")
	@ResponseBody
	public Map<String, String> cReportStatusUpdate(@RequestParam int reno, @RequestParam boolean status, Model model) {
		
		// 1. 변수선언부
		int result=0; // 게시글의 상태를 변경하고 결과를 받아올 변수
		String rStatus=""; // 게시글의 상태를 받아서 Y,N으로 담아줄 변수 (true/false로 넘어옴)
		String msg=""; // 결과에 따라 화면으로 보내줄 메세지를 저장할 변수
		Map<String, String> map; // 메세지를 화면으로 보내줄 객체
		
		if(status== true) {
			rStatus="C";
		}else {
			rStatus="R";
		}
		
		Report report= new Report(reno, rStatus);
		// 2. 실행부
		result = adminService.cReportStatusUpdate(report);
		//System.out.println(result);
		if(result>0)msg="댓글 [신고]상태 변경 성공";
		else msg="댓글 [신고상태 변경 실패";
		
		// 결과에 따른 메세지를 map 객체에 담아 화면으로 보냄
		map = new HashMap<String, String>();
		map.put("msg", msg);
		
		return map;
	}
	
	/**
	 * admin 게시글 신고 관리 출력 서블릿
	 * @author Sung A Cho
	 * @return
	 */
	
	@RequestMapping("/admin/selectPostReport.do")
	public String adminPostReportList(Model model) {
		
		try {
			
		List<Map<String, String>> list=adminService.selectPostReportList();
		model.addAttribute("list", list);
		
		
		}catch(Exception e) {
			throw new AdminException(e.getMessage());
		}
		return "admin/postReportList";
	}

	
	/**
	 * 게시글의 신고상태를 변경하는 서블릿
	 * @author Sung A Cho
	 * @param reno
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/pReportStatusUpdate.do")
	@ResponseBody
	public Map<String, String> pReportStatusUpdate(@RequestParam int reno, @RequestParam boolean status, Model model) {
		
		// 1. 변수선언부
		int result=0; // 게시글의 상태를 변경하고 결과를 받아올 변수
		String rStatus=""; // 게시글의 상태를 받아서 Y,N으로 담아줄 변수 (true/false로 넘어옴)
		String msg=""; // 결과에 따라 화면으로 보내줄 메세지를 저장할 변수
		Map<String, String> map; // 메세지를 화면으로 보내줄 객체
		
		if(status== true) {
			rStatus="C";
		}else {
			rStatus="R";
		}
		
		Report report= new Report(reno, rStatus);
		// 2. 실행부
		result = adminService.pReportStatusUpdate(report);
		//System.out.println(result);
		if(result>0)msg="게시글 [신고]상태 변경 성공";
		else msg="게시글 [신고상태 변경 실패";
		
		// 결과에 따른 메세지를 map 객체에 담아 화면으로 보냄
		map = new HashMap<String, String>();
		map.put("msg", msg);
		
		return map;
	}
	
	
	
	

}
