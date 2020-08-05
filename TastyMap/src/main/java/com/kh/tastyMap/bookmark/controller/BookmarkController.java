package com.kh.tastyMap.bookmark.controller;

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

import com.kh.tastyMap.bookmark.model.exception.IHaveBookmarkListException;
import com.kh.tastyMap.bookmark.model.service.BookmarkService;
import com.kh.tastyMap.bookmark.model.vo.Bookmark;

@Controller
public class BookmarkController {

	@Autowired
	BookmarkService bookmarkService;
	
	
	
	@RequestMapping("/restaurant/bookmark.do")
	@ResponseBody
	public Map<String, Object> clickBookmark(@RequestParam int rno, @RequestParam String memberId, Model model, HttpSession session) {
		Map<String, Object> map;
		
		Bookmark bookmark = new Bookmark(memberId,rno);
		 
		map =bookmarkService. clickBookmark(bookmark);
		  
		System.out.println(map); 
		  
	
		return map;
	}
	
	@RequestMapping("/restaurant/bookmarkselect.do")
	@ResponseBody
	public Map<String, Object> selectBookmark(@RequestParam int rno, @RequestParam String memberId, Model model, HttpSession session) {
		Map<String, Object> map =new HashMap<String, Object>();
		
		System.out.println(rno + memberId);
		String status;
		Bookmark bookmark = new Bookmark(memberId,rno);
		 
		int result =bookmarkService.selectBookmark(bookmark);
		
		if (result == 0) { // SELECT해서 COUNT한 결과가 없을 때 
			status = "N";
		}else if(result == 1) { // SELECT해서 COUNT한 결과가 있을 때
			status ="Y";
		}else {
			status="null"; 
		}
		System.out.println(result);
		map.put("status",status);
		  
		return map;
	}
	
	@RequestMapping("/bookmark/myBookmarkList.do")
	public String myBookmark() {
		
		
		return "myPage/myBookmark";
	}
	
	/**
	 * 마이페이지에 북마크한 음식점 목록 출력 서블릿
	 * @author Hyunmin Jo
	 * @return
	 */
	@RequestMapping("/bookmark/iHaveBookmarkList.do")
	public String restarauntTop8(@RequestParam String member_Id, Model model, HttpSession session) {
		
		try {
			
			List<Bookmark> list = bookmarkService.iHaveBookmarkList(member_Id);
			
			model.addAttribute("list",list);
			
		} catch(Exception e) {
			
			throw new IHaveBookmarkListException(e.getMessage());
			
		}

		return "myPage/myBookmark";
	}
}
