package com.kh.tastyMap.restaurant.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tastyMap.restaurant.model.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService restaurantService;
	
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
}
