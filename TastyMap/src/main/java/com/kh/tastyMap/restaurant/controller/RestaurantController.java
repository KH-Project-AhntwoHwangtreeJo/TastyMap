package com.kh.tastyMap.restaurant.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tastyMap.bookmark.model.service.BookmarkService;
import com.kh.tastyMap.bookmark.model.vo.Bookmark;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.restaurant.model.service.RestaurantService;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;
import com.kh.tastyMap.restaurant.model.vo.RestaurantList;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService restaurantService;
	

	@RequestMapping("/restaurant/restaurantAllList.do")
	   public List restaurantAllList(
	         @RequestParam (value="cPage", required=false, defaultValue="1")
	         int cPage, Model model) {
	      int numPerPage = 5;

	      
	      List<RestaurantList> RList = restaurantService.restaurantAllList(cPage, numPerPage);
	         
	      System.out.println(RList);
	         
	      List<RestaurantList> kList = new ArrayList<>();
	      List<RestaurantList> cList = new ArrayList<>();
	      List<RestaurantList> jList = new ArrayList<>();
	      
	      for(RestaurantList r : RList) {
	         if("한식".equals(r.getCategory())){
	            kList.add(r);
	         } else if ("중식".equals(r.getCategory())) {
	            cList.add(r);
	         } else if ("일식".equals(r.getCategory())) {
	            jList.add(r);
	         }
	      }
	      
	      int totalContent = restaurantService.selectRestaurantTotal();
	      
//	      String pageBar = Utils.getPageBar(totalContent, cPage, numPerPage, "restaurantAllList.do");

	      System.out.println("k" + kList);
	      System.out.println("c" + cList);
	      System.out.println("j" + jList);
	      
	      model.addAttribute("RList", RList);
	      model.addAttribute("kList", kList);
	      model.addAttribute("cList", cList);
	      model.addAttribute("jList", jList);
	      model.addAttribute("totalContent", totalContent);
	      model.addAttribute("numPerPage", numPerPage);
//	      model.addAttribute("pageBar", pageBar);
	      
	      
	      
	   return kList;
	}
	
	@Autowired
	BookmarkService bookmarkService;
	
	
	@RequestMapping("/restaurant/top8.do")
	@ResponseBody
	public List restarauntTop8(Model model) {
		
		List<Map<String, String>> list = restaurantService.top8();

		model.addAttribute("list",list);

		return list;
	}
	
	@RequestMapping("/restaurant/influencer.do")
	@ResponseBody 
	public List influencerTop8(Model model) {
		
		List<Map<String, String>> list = restaurantService.influencerTop8();

		model.addAttribute("list",list);

		return list;
	}

	@RequestMapping("/restaurant/searchBar.do")
	public ModelAndView searchBar(@RequestParam(defaultValue="Restaurant") String searchOption, 
						  @RequestParam(defaultValue="") String keyword, RestaurantList restaurant, PostList post, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(searchOption.equals("Restaurant")) {
			List<Map<String, String>> list = restaurantService.RestaurantSearchBar(searchOption, keyword);
			map.put("searchOption",searchOption);
			map.put("keyword",keyword);			
			mav.addObject("RList",list);
			mav.addObject("map",map);
			mav.setViewName("restaurant/restaurantAllList");
			
		} else {
			List<Map<String, String>> list = restaurantService.PostSearchBar(searchOption, keyword);
			map.put("searchOption",searchOption);
			map.put("keyword",keyword);			
			mav.addObject("postList",list);
			mav.addObject("map",map);
			mav.setViewName("post/postAllList");
		}

		return mav;
	}
	
	//주변식당 출력
	@RequestMapping("/restaurant/restaurantaround.do")
	@ResponseBody
	public Map<String, List<Restaurant>> Raround(String address, Model model) {	 
		  List<Restaurant> adr = restaurantService.Raround(address);
		  
		  for( Restaurant s: adr) {
			 System.out.println("s"+s);
			  
		  }
		 
		  
		  Map<String,List<Restaurant>> map = new HashMap<String, List<Restaurant>>();
		  System.out.println("주변식당 찾기"+adr);
		  
		  
		  map.put("adr",adr);
		  return map;
		  
	}
	
  // 레스토랑 디테일 페이지 (조은성)
	@RequestMapping("/restaurant/restaurantDatail.do")
	public String RestaurantDetail(@RequestParam int rno, @RequestParam String memberId, Model model) {	
		Map<String, String> map =new HashMap<String, String>();
		String status;
		String M="";
		String F="";
		String A ="";
		String B ="";
		String C ="";
		String D ="";
		String E ="";
	
//				 식당 디테일 페이지 접속 시 동작하는 구문
//				1. 식당 기본정보(리스트) 가져오기
//				2. 해당하는 식당 사진 불러오기 
//				3. 북마크 조회 하기 
//				4. 막대 차트 
//				5. 원형 차트
//				6. 리뷰 
//				7. 리뷰갯수
//				8. 리뷰 사진						
//				9. 주변식당 리스트 출력
//			1. 식당 기본정보(리스트) 가져오기
		Restaurant R = restaurantService.restaurantDetail(rno);	
		System.out.println(R.getAddress());
//			2. 사진 리스트 불러오기
		List<Picture> list = restaurantService.pictureList(rno);
		
//  		3. 북마크 조회 하기 
		Bookmark bookmark = new Bookmark(memberId,rno);
		int result =bookmarkService.selectBookmark(bookmark);
	
		if (result == 0) { // SELECT해서 COUNT한 결과가 없을 때 
			status = "N";
		}else if(result == 1) { // SELECT해서 COUNT한 결과가 있을 때
			status ="Y";
		}else {
			status="null"; 
		}
		

		
//		4. 막대 차트 
		List<Map<String, String>> chart = restaurantService.restaurantChart(rno);

  
   		for( Map<String, String> r : chart ) {
   			
   			 M = String.valueOf((r.get("남자")));
   			 F = String.valueOf((r.get("여자")));	
   		}
   		
//   	5. 원형 차트	
   	   List<Map<String, String>> chartTwo = restaurantService.restaurantChartTwo(rno);
   	 
	   
   		
   		for( Map<String, String> e : chartTwo ) {
			
	   		 A = String.valueOf((e.get("10대")));
			 B = String.valueOf((e.get("20대")));
			 C = String.valueOf((e.get("30대")));
			 D = String.valueOf((e.get("40대")));
			 E = String.valueOf((e.get("50대 이상")));
		}
   	
  
   	   
   	   
		
		
//       	6. 리뷰
		List<PostList> RPost = restaurantService.restaurantPost(rno);
		
		
//		 	7. 리뷰 사진
		List<Picture> RPicture = restaurantService.restaurantPicture(rno);
	
		
		
//			8. 리뷰갯수
		  int PostNumber = restaurantService.restaurantPostTwo(rno);
		String Pnum = String.valueOf(PostNumber);
		
	   
	
	
		
//	        9. 주변식당 리스트 출력 
		List<Restaurant> adr = restaurantService.Raround(R.getAddress());
		
		  
		map.put("Pnum",Pnum);	
		map.put("M",M);
		map.put("F",F);
		map.put("A",A);
		map.put("B",B);
		map.put("C",C);
		map.put("D",D);
		map.put("E",E);
		 map.put("status",status);
		 model.addAttribute("map", map);
		 model.addAttribute("restaurant", R);				 
		 model.addAttribute("list", list);
		 model.addAttribute("RPost", RPost);
		 model.addAttribute("RPicture", RPicture);
		 model.addAttribute("adr", adr);
		
		 
		 
		return "restaurant/restaurantDetail";    
		
		
	}
}
