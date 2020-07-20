package com.kh.tastyMap.restaurant.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tastyMap.common.util.Utils;
import com.kh.tastyMap.restaurant.model.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService restaurantService;
	
	@RequestMapping("/restaurant/restaurantList.do")
	public String selectRestaurantList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			 int cPage, Model model) {
		
		// 한 페이지 당 게시글 수 
		int numPerPage = 10; // limit 역할
		
		// 1. 현재 페이지 게시글 목록 가져오기
		List<Map<String, String>> list = restaurantService.selectRestaurantList(cPage, numPerPage);
		
		// 2. 페이지 계산을 위한 총 페이지 갯수
		int totalContents = restaurantService.selectRestaurantTotalContents();
		
		// 3. 페이지 HTML 생성
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "restaurantList.do");
		
		model.addAttribute("list",list)
			 .addAttribute("totalContents",totalContents)
			 .addAttribute("numPerPage",numPerPage)
			 .addAttribute("pageBar",pageBar);
		
		return "restaurant/restaurantList";
	}
	
	
}
