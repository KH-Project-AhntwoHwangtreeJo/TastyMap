package com.kh.tastyMap.restaurant.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.tastyMap.restaurant.model.vo.Attachment;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

public interface RestaurantDAO {

	List<Map<String, String>> selectRestaurantList(int cPage, int numPerPage);

    int selectRestaurantTotalContents();

    int insertRestaurant(Restaurant restaurant);

    int insertAttachment(Attachment a);

    Restaurant selectOneRestaurant(int restaurantNo);
 
    List<Attachment> selectAttachmentList(int restaurantNo);

    int updateRestaurant(Restaurant restaurant);

    int updateAttachment(Attachment a);

    int deleteRestaurant(int restaurantNo);

    int deleteAttachment(int restaurantNo);

    int deleteFile(int attNo);
}
