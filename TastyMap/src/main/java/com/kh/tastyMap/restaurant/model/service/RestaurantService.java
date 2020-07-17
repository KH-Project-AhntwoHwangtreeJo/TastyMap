package com.kh.tastyMap.restaurant.model.service;

import java.util.List;

import com.kh.tastyMap.restaurant.model.vo.Restaurant;

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
	
	

}
