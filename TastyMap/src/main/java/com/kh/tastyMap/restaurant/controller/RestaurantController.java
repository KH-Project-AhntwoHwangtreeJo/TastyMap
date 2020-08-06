package com.kh.tastyMap.restaurant.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tastyMap.bookmark.model.service.BookmarkService;
import com.kh.tastyMap.bookmark.model.vo.Bookmark;
import com.kh.tastyMap.member.model.exception.MemberException;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.restaurant.model.exception.RestaurantException;
import com.kh.tastyMap.restaurant.model.exception.searchBarPostException;
import com.kh.tastyMap.restaurant.model.exception.searchBarRestaurantException;
import com.kh.tastyMap.restaurant.model.service.RestaurantService;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;
import com.kh.tastyMap.restaurant.model.vo.RestaurantList;

@Controller
public class RestaurantController {
	
	@Autowired
	RestaurantService restaurantService;

	@Autowired
	BookmarkService bookmarkService;
	
	// 식당 전체리스트 출력(안예진)
	@RequestMapping("/restaurant/restaurantAllList.do")
	   public String restaurantAllList(Model model) {
	     
		try {
	      
	      List<RestaurantList> RList = restaurantService.restaurantAllList();
	         
	      //System.out.println(RList);
	         
	      		// 카테고리 별 출력하기 // 한식/중식/일식/양식/기타(디저트등등..)
	   			List<RestaurantList> kList = new ArrayList<>();
	   			List<RestaurantList> cList = new ArrayList<>();
	   			List<RestaurantList> jList = new ArrayList<>();
	   			List<RestaurantList> yList = new ArrayList<>();
	   			List<RestaurantList> etcList = new ArrayList<>();
	   			
	   			
	   			// 카테고리 별 출력하기 // 한식/중식/일식/양식/기타(디저트등등..)
	   			
	   			for(RestaurantList r : RList) {
	   				if("한식".equals(r.getCategory())){
	   					kList.add(r);
	   				} else if ("중식".equals(r.getCategory())) {
	   					cList.add(r);
	   				} else if ("일식".equals(r.getCategory())) {
	   					jList.add(r);
	   				} else if ("양식".equals(r.getCategory())) {
	   					yList.add(r);
	   				} else if ("기타".equals(r.getCategory())) {
	   					etcList.add(r);
	   				}
	   			}
	      
	      int totalContent = restaurantService.selectRestaurantTotal();
	      


	    //  System.out.println("k" + kList);
	    //  System.out.println("c" + cList);
	    //  System.out.println("j" + jList);
	      
	      model.addAttribute("RList", RList);
	      model.addAttribute("kList", kList);
	      model.addAttribute("cList", cList);
	      model.addAttribute("jList", jList);
	      model.addAttribute("yList", yList);
	      model.addAttribute("etcList", etcList);
	      model.addAttribute("totalContent", totalContent);
	   
		} catch (Exception e) {
			// 오류 시 RestaurantException 동작
			throw new RestaurantException(e.getMessage());
		}
	      
	      
	      
	   return "restaurant/restaurantAllList";
	}
	
	
	/**
	 * 음식점 Top 9개 index에 출력 서블릿
	 * @author Hyunmin Jo
	 * @return
	 */
	@RequestMapping("/restaurant/top8.do")
	@ResponseBody
	public List restarauntTop8(Model model) {
		
		List<Map<String, String>> list = restaurantService.top8();

		model.addAttribute("list",list);

		return list;
	}
	
	/**
	 * 인플루언서 게시글 Top 8 개 index에 출력 서블릿
	 * @author Hyunmin Jo
	 * @return
	 */
	@RequestMapping("/restaurant/influencer.do")
	@ResponseBody 
	public List influencerTop8(Model model) {
		
		List<Map<String, String>> list = restaurantService.influencerTop8();

		model.addAttribute("list",list);

		return list;
	}

	/**
	 * 검색 기능 서블릿
	 * @author Hyunmin Jo
	 * @return
	 */
	@RequestMapping("/restaurant/searchBar.do")
	public ModelAndView searchBar(@RequestParam(defaultValue="Restaurant") String searchOption, 
						  @RequestParam(defaultValue="") String keyword, RestaurantList restaurant, PostList post, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, String>> list = null;
		
		if(searchOption.equals("Restaurant")) {
			
			try {
				list = restaurantService.RestaurantSearchBar(searchOption, keyword);
				map.put("searchOption",searchOption);
				map.put("keyword",keyword);			
				mav.addObject("RList",list);
				mav.addObject("map",map);
				mav.setViewName("restaurant/restaurantAllList");
				
			} catch(Exception e) {
			
				throw new searchBarRestaurantException(e.getMessage());
			}
			
		} else if(searchOption.equals("Post")){
			
			try {
				list = restaurantService.PostSearchBar(searchOption, keyword);
				map.put("searchOption",searchOption);
				map.put("keyword",keyword);			
				mav.addObject("postList",list);
				mav.addObject("map",map);
				mav.setViewName("post/postAllList");
				
			} catch (Exception e){
				
				throw new searchBarPostException(e.getMessage());
			}
		}
		
		if(list == null || list.isEmpty()){
			mav.addObject("loc","/");
			mav.addObject("msg","조회한 결과가 없습니다.");
			mav.setViewName("common/msg");
			
			return mav;
			
		} else {
			
			return mav;
		}

	}
	
	//식당 디테일 페이지 - 주변식당 리스트(조은성) 
	@RequestMapping("/restaurant/restaurantaround.do")
	@ResponseBody
	public Map<String,List<Restaurant>> Raround(String address, Model model) {	 		
		   Map<String,List<Restaurant>> map = new HashMap<String, List<Restaurant>>();
		  try {
			  //주변 식당 정보 받아오는 객체 생성
			 List<Restaurant> adr = restaurantService.Raround(address);
			  //HashMap에 전달
			 map.put("adr",adr);
			 	
		 } catch (Exception e) {
			 // 오류 시 RestaurantException 동작
			throw new RestaurantException(e.getMessage());
		 }
		 				  
		  return map;		  
	}
	
	 //식당 디테일 페이지 - 전체 기능(조은성)
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
			
//			 식당 디테일 페이지 
//			 1. 식당 기본정보(리스트) 가져오기
//			 2. 해당하는 식당 사진 불러오기 
//			 3. 북마크 조회 하기 
//		     4. 리뷰 
//			 5. 막대 차트 
//			 6. 원형 차트
//			 7. 리뷰갯수
//			 8. 리뷰 사진						
//			 9. 주변식당 리스트 출력		
			try {		
//				1. 식당 기본정보(리스트) 가져오기
			Restaurant R = restaurantService.restaurantDetail(rno);		
			
//				2. 사진 리스트 불러오기					
				List<Picture> list = restaurantService.pictureList(rno);				
//	  		3. 북마크 조회 하기 		
				Bookmark bookmark = new Bookmark(memberId,rno);
			
				int result =bookmarkService.selectBookmark(bookmark);
				
				if (result == 0) { // SELECT해서 COUNT한 결과가 없을 때 
					status = "N";
				}else if(result == 1) { // SELECT해서 COUNT한 결과가 있을 때
					status ="Y";
				}else {
					status="null"; 
				}					
		
//	       	4. 리뷰
				List<PostList> RPost = restaurantService.restaurantPost(rno);				
//				리뷰가 없을 시 차트 X
				if(RPost != null) {			
//			5. 막대 차트 
				
				  List<Map<String, String>> chart = restaurantService.restaurantChart(rno);
				  for( Map<String, String> r : chart ) {			  
				  M = String.valueOf((r.get("남자"))); F = String.valueOf((r.get("여자"))); }
				 
//	   	6. 원형 차트			
				
				  List<Map<String, String>> chartTwo = restaurantService.restaurantChartTwo(rno); 
				  for( Map<String, String> e : chartTwo ) {			  
				  A = String.valueOf((e.get("10대"))); B = String.valueOf((e.get("20대"))); C =
				  String.valueOf((e.get("30대"))); D = String.valueOf((e.get("40대"))); E =
				  String.valueOf((e.get("50대 이상"))); }
				}
				
				
//			 	7. 리뷰 사진
			List<Picture> RPicture = restaurantService.restaurantPicture(rno);			
//				8. 리뷰갯수
			int PostNumber = restaurantService.restaurantPostTwo(rno);		
			String Pnum = String.valueOf(PostNumber);
			
				
//		        9. 주변식당 리스트 출력 
			List<Restaurant> adr = restaurantService.Raround(R.getAddress());
			
//			    hashMap 저장
			 map.put("Pnum",Pnum);	
			 map.put("M",M);
			 map.put("F",F);
			 map.put("A",A);
			 map.put("B",B);
			 map.put("C",C);
			 map.put("D",D);
			 map.put("E",E);
			 map.put("status",status);  //북마크
			 model.addAttribute("map", map);
			 model.addAttribute("restaurant", R); //식당 기본 정보		 
			 model.addAttribute("list", list);
			 model.addAttribute("RPost", RPost);
			 model.addAttribute("RPicture", RPicture);
			 model.addAttribute("adr", adr);		 
			}catch (Exception e) {
				 // 오류 시 RestaurantException 동작
				throw new RestaurantException(e.getMessage());
			 }				 
			return "restaurant/restaurantDetail";    
			
				
		}
		
   
	
		
		
}
