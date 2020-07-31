package com.kh.tastyMap.restaurant.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.restaurant.model.dao.RestaurantDAO;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;
import com.kh.tastyMap.restaurant.model.vo.RestaurantList;

@Service("restaurantService")
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	RestaurantDAO restaurantDAO;
	
	@Override
	public List<Restaurant> mainRestaurantList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Restaurant> restaurantList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Restaurant restaurantDetail(int rno) {
		
		return restaurantDAO.selectOneRestaurant(rno);
	}

	@Override
	public int insertRestaurant(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRestaurant(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRestaurant(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override	// 식당 top9
	public List<Map<String, String>> top8() {
		// TODO Auto-generated method stub
		return restaurantDAO.top8();
	}

	@Override	// 인플루언서 top8
	public List<Map<String, String>> influencerTop8() {
		// TODO Auto-generated method stub
		return restaurantDAO.influencerTop8();
	}

	@Override	// 검색바
	public List<Map<String, String>> RestaurantSearchBar(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return restaurantDAO.RestaurantSearchBar(searchOption, keyword);
	}
	
	@Override	// 검색바
	public List<Map<String, String>> PostSearchBar(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return restaurantDAO.PostSearchBar(searchOption, keyword);
	}

	@Override   ///식당 상세페이지 사진 
	public List<Picture> pictureList(int rno) {
		return restaurantDAO.pictureList(rno);
	}


	@Override //식당 상세페이지  막대 차트
	public List<Map<String, String>> restaurantChart(int rno) {
		
		return restaurantDAO.restaurantChart(rno);
	}

	@Override   //식당 상세페이지 원형 차트
	public List<Map<String, String>> restaurantChartTwo(int rno) {
		
		return restaurantDAO.restaurantChartTwo(rno);
	}

	@Override
	public List<RestaurantList> restaurantAllList(int cPage, int numPerPage) {
	
		return restaurantDAO.restaurantAllList(cPage, numPerPage);
	}

	@Override
	public int selectRestaurantTotal() {
		// TODO Auto-generated method stub
		return restaurantDAO.selectRestaurantTotal();
	}


	@Override  //식당 상세페이지  리뷰 가져오기
	public List<PostList> restaurantPost(int rno) {
	
		return restaurantDAO.restaurantPost(rno);

	}

	@Override //식당 사진 리뷰 가져오기
	public List<Picture> restaurantPicture(int rno) {
		
		return restaurantDAO.restaurantPicture(rno);
	}

	@Override	// 리뷰갯수
	public int restaurantPostTwo(int rno) {
		// TODO Auto-generated method stub
		return restaurantDAO.restaurantPostTwo(rno);
	}

	@Override	//주변인기식당
	public List<Restaurant> Raround(String address) {
		return restaurantDAO.Raround(address);
	}
}

	

