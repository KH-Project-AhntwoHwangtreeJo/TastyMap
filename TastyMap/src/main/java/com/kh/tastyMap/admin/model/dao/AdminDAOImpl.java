package com.kh.tastyMap.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.restaurant.model.vo.Restaurant;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	

		//-----------------------------------//
		// 1. [회원] 관리 조회용
		@Override
		public List<Map<String, String>> selectMemberList() {
			
			return sqlSession.selectList("adminMapper.selectMemberList");
		}
		
	
		//-----------------------------------//
		// 2. [식당] 관리 조회용
		@Override
		public List<Map<String, String>> selectRestaurantList() {
			return sqlSession.selectList("adminMapper.selectRestaurantList");
		}
		
		
		
		//-----------------------------------//
		// 3. [게시글] 관리 조회용
		// 3-1. 게시글 내용 조회용
		@Override
		public List<Map<String, String>> selectPostList() {
			return sqlSession.selectList("adminMapper.selectPostList");
		}
		
		// 3-2. 게시글에 해당하는 사진 조회용
		@Override
		public List<Map<String, String>> selectPictureList() {
			return sqlSession.selectList("adminMapper.selectPictureList");
		}
		
		
		
		//-----------------------------------//
		// 4. [공지사항] 관리 조회용
		@Override
		public List<Map<String, String>> selectNoticeList() {
			return sqlSession.selectList("adminMapper.selectNoticeList");
		}
		
		
		
		//-----------------------------------//
		// 5. [신고 ] 관리 조회용
		@Override
		public List<Map<String, String>> selectCommentReportList() {
			// TODO Auto-generated method stub
			return null;
		}


		@Override
		public List<Map<String, String>> selectPostReportList() {
			// TODO Auto-generated method stub
			return null;
		}
		 
		
		//-----------------------------------//
		
		@Override
		public int insertRestaurant(Restaurant R) {
			return sqlSession.insert("adminMapper.insertRestaurnat",R);
		}


		




}