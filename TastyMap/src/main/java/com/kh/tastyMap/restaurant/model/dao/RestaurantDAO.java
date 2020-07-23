package com.kh.tastyMap.restaurant.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

public interface RestaurantDAO {

	List<Map<String, String>> selectRestaurantList(int cPage, int numPerPage);

    int selectRestaurantTotalContents();

    int insertRestaurant(Restaurant restaurant);


    Restaurant selectOneRestaurant(int restaurantNo);
 

    int updateRestaurant(Restaurant restaurant);


    int deleteRestaurant(int restaurantNo);





	List<Map<String, String>> top8();

	List<Map<String, String>> influencerTop8();
	

	List<Picture> pictureList(int rno);
}
