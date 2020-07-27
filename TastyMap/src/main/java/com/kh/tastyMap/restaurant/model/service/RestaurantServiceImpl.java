package com.kh.tastyMap.restaurant.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.restaurant.model.dao.RestaurantDAO;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

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

	@Override
	public List<Map<String, String>> selectRestaurantList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return restaurantDAO.selectRestaurantList(cPage, numPerPage);
	}

	@Override
	public int selectRestaurantTotalContents() {
		// TODO Auto-generated method stub
		return restaurantDAO.selectRestaurantTotalContents();
	}

	@Override

	public List<Map<String, String>> top8() {
		// TODO Auto-generated method stub
		return restaurantDAO.top8();
	}

	@Override
	public List<Map<String, String>> influencerTop8() {
		// TODO Auto-generated method stub
		return restaurantDAO.influencerTop8();
	}

	@Override
	public List<Map<String, String>> searchBar() {
		// TODO Auto-generated method stub
		return restaurantDAO.searchBar();
	}

	@Override
	public List<Picture> pictureList(int rno) {
		return restaurantDAO.pictureList(rno);
	}


	@Override /* 막대차트 */
	public List<Map<String, String>> restaurantChart(int rno) {
		
		return restaurantDAO.restaurantChart(rno);
	}

	@Override  /*원형차트*/
	public List<Map<String, String>> restaurantChartTwo(int rno) {
		
		return restaurantDAO.restaurantChartTwo(rno);
	}

	

//	 사진입니다
/*	@Override
	public List<Picture> PictureList(int rno) {

		return restaurantDAO.PictureList(rno);*/
	}


	

