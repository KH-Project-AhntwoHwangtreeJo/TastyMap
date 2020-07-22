package com.kh.tastyMap.restaurant.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

@Repository("restaurantDAO")
public class RestaurantDAOImpl implements RestaurantDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectRestaurantList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("restaurantMapper.selectrestaurantList", null, rows);
	}
	

	@Override
	public int selectRestaurantTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("restaurantMapper.selectRestaurantTotalContent");
	}

	@Override
	public int insertRestaurant(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * @Override public int insertAttachment(Attachment a) { // TODO Auto-generated
	 * method stub return 0;
	}
	 */

	@Override
	public Restaurant selectOneRestaurant(int rno) {
	
		return sqlSession.selectOne("restaurantMapper.selectOneRestaurant", rno);
		
	
	}

	
	

	@Override
	public int updateRestaurant(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * @Override public int updateAttachment(Attachment a) { // TODO Auto-generated
	 * method stub return 0;
	}
	 */

	@Override
	public int deleteRestaurant(int restaurantNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAttachment(int restaurantNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Picture> pictureList(int rno) {
		return sqlSession.selectList("restaurantMapper.PictureList", rno);
	}


	
			//사진입니다
/*	@Override
	public List<Picture> PictureList(int rno) {
	
		return sqlSession.selectOne("restaurantMapper.PictureList", rno);
		*/
	}



