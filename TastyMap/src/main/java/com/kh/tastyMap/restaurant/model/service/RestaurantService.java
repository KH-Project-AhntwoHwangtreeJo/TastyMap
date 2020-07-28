package com.kh.tastyMap.restaurant.model.service;

import java.util.List;
import java.util.Map;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;
import com.kh.tastyMap.restaurant.model.vo.RestaurantList;

public interface RestaurantService {
	
	/**
	 * 메인페이지 - 인기식당 리스트 조회용
	 * @return
	 */
	List<Restaurant> mainRestaurantList();
	
	/**
	 * 식당 전체 리스트 조회용
	 * @return
	 */
	List<Restaurant> restaurantList();
	
	/**
	 * 식당 한개 디테일 조회용
	 * @param rno
	 * @return
	 */
	Restaurant restaurantDetail(int rno);
	
	
	/**
	 * 
	 * @param restaurant
	 * @return
	 */
	int insertRestaurant(Restaurant restaurant);
	
	/**
	 * 
	 * @param restaurant
	 * @return
	 */
	int updateRestaurant(Restaurant restaurant);
	
	/**
	 * 관리자 페이지 - 식당 삭제 (활성화 상태 변경용)
	 * @param restaurant
	 * @return
	 */
	int deleteRestaurant(Restaurant restaurant);


	List<Map<String, String>> top8();

	List<Map<String, String>> influencerTop8();
	
	//식당 상세페이지 사진 
	List<Picture> pictureList(int rno);
	//식당 상세페이지  막대 차트
	 List<Map<String, String>> restaurantChart(int rno);
	
	 //식당 상세페이지 원형 차트
	List<Map<String, String>> restaurantChartTwo(int rno);

	List<RestaurantList> restaurantAllList(int cPage, int numPerPage);

	int selectRestaurantTotal();
	
	List<Map<String, String>> searchBar();
	//식당 상세페이지  리뷰 가져오기
	List<PostList> restaurantPost(int rno);
	//식당 사진 리뷰 가져오기
	List<Picture> restaurantPicture(int rno);

	
	
	

}
