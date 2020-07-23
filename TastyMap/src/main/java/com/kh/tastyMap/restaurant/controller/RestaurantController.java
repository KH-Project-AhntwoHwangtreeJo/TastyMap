package com.kh.tastyMap.restaurant.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tastyMap.bookmark.model.service.BookmarkService;
import com.kh.tastyMap.bookmark.model.vo.Bookmark;
import com.kh.tastyMap.bookmark.model.service.BookmarkService;
import com.kh.tastyMap.bookmark.model.vo.Bookmark;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.restaurant.model.service.RestaurantService;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService restaurantService;
	

	@Autowired
	BookmarkService bookmarkService;
	
	
	@RequestMapping("/restaurant/top8.do")
	@ResponseBody
	public List restarauntTop8(Model model) {
		
		List<Map<String, String>> list = restaurantService.top8();

		System.out.println(list);
		model.addAttribute("list",list);

		return list;
	}
	
	@RequestMapping("/restaurant/influencer.do")
	@ResponseBody 
	public List influencerTop8(Model model) {
		
		List<Map<String, String>> list = restaurantService.influencerTop8();

		System.out.println(list);
		model.addAttribute("list",list);

		return list;
	}
	
	@RequestMapping("/restaurant/restaurantAllList.do")
	public String memberEnroll() {
		
		
		
	return "/restaurant/restaurantAllList";
	}
	
	
	@RequestMapping("/restaurant/restaurantDatail.do")
	public String RestaurantDetail(@RequestParam int rno, @RequestParam String memberId, Model model) {	
//		System.out.println(rno);
		Map<String, Object> map =new HashMap<String, Object>();
		System.out.println(memberId);
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
		
		map.put("status",status);
		System.out.println("map :" + map);
		model.addAttribute("map", map);
		
		
		Restaurant R = restaurantService.restaurantDetail(rno);	
		 model.addAttribute("restaurant", R);
		
		 List<Picture> list
			= restaurantService.pictureList(rno);
		
		 System.out.println("가져온 리스트 list :" + list);
		 
		 model.addAttribute("list", list);
		
		
		
		
		return "/restaurant/restaurantDetail";    
		
		
	}
}
