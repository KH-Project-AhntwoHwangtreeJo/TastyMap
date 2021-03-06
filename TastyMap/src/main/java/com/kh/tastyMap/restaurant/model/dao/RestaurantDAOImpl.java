package com.kh.tastyMap.restaurant.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;
import com.kh.tastyMap.restaurant.model.vo.RestaurantList;

@Repository("restaurantDAO")
public class RestaurantDAOImpl implements RestaurantDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
//	@Override
//	public List<Map<String, String>> selectRestaurantList(int cPage, int numPerPage) {
//		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
//		
//		return sqlSession.selectList("restaurantMapper.selectrestaurantList", null, rows);
//	}
//	

	
	
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
	@Override	// 식당 top9
	public List<Map<String, String>> top8() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("restaurantMapper.selectTop8");
	}

	@Override	// 인플루언서 top8
	public List<Map<String, String>> influencerTop8() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("restaurantMapper.influencerTop8");
	}

	@Override	// 검색바
	public List<Map<String, String>> RestaurantSearchBar(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("restaurantMapper.RestaurantSearchBar", map);
	}
	@Override	// 검색바
	public List<Map<String, String>> PostSearchBar(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("restaurantMapper.PostSearchBar", map);
	}

	@Override //식당 상세페이지 사진 (조은성)
	public List<Picture> pictureList(int rno) {
		return sqlSession.selectList("restaurantMapper.PictureList", rno);
	}
	
	
	
	@Override  //식당 상세페이지 원형 차트(조은성)
	public List<Map<String, String>> restaurantChartTwo(int rno) {
	
		return sqlSession.selectList("restaurantMapper.chartListTwo", rno);
	}

	@Override    //식당 상세페이지  막대 차트(조은성)
	public List<Map<String, String>> restaurantChart(int rno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("restaurantMapper.chartList", rno);
	}

	


	@Override
	public int deleteRestaurant(int restaurantNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//식당전체리스트(안예진)
	@Override
	public List<RestaurantList> restaurantAllList() {
		
		return sqlSession.selectList("restaurantMapper.restaurantAllList");
	}

	//식당전체리스트(안예진)
	@Override
	public int selectRestaurantTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("restaurantMapper.selectRestaurantTotal");
	}

	@Override  	//식당 상세페이지  리뷰 가져오기(조은성)
	public List<PostList> restaurantPost(int rno) {
		
		return sqlSession.selectList("restaurantMapper.postList", rno);
	}

	@Override  //식당 리뷰 사진(조은성)
	public List<Picture> restaurantPicture(int rno) {
	
		return sqlSession.selectList("restaurantMapper.postPicture", rno);
	}

	@Override //식당 리뷰 개수(조은성)
	public int restaurantPostTwo(int rno) {
		
		return sqlSession.selectOne("restaurantMapper.postNumber", rno);
	}

	@Override  //주변 인기 식당(조은성)
	public List<Restaurant> Raround(String address) {

		return sqlSession.selectList("restaurantMapper.Raround",address);
	}

	
	
}
	





