package com.kh.tastyMap.restaurant.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;
import com.kh.tastyMap.restaurant.model.vo.RestaurantList;

public interface RestaurantDAO {


    int insertRestaurant(Restaurant restaurant);


    Restaurant selectOneRestaurant(int restaurantNo);
 

    int updateRestaurant(Restaurant restaurant);


    int deleteRestaurant(int restaurantNo);



    int deleteFile(int attNo);

    List<Map<String, String>> top8();

    List<Map<String, String>> influencerTop8();

    //식당 상세페이지 사진 
    List<Picture> pictureList(int rno);
    //식당 상세페이지  막대 차트
    List<Map<String, String>> restaurantChart(int rno);
	 //식당 상세페이지 원형 차트
    List<Map<String, String>> restaurantChartTwo(int rno);

	List<Map<String, String>> searchBar();
	
	int selectRestaurantTotal();

	List<RestaurantList> restaurantAllList(int cPage, int numPerPage);

	//식당 상세페이지  리뷰 가져오기
	List<PostList> restaurantPost(int rno);
	//식당 리뷰 사진
	List<Picture> restaurantPicture(int rno);
}
