package com.kh.tastyMap.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.member.model.vo.Member;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.report.model.vo.Report;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	

		//-----------------------------------//
		// 1. [회원] 관리
		// 1-1. [회원] 리스트 조회용
		@Override
		public List<Map<String, String>> selectMemberList() {
			
			return sqlSession.selectList("adminMapper.selectMemberList");
		}
		// 1-2. [회원] 상태 변경용
		@Override
		public int updateMemberList(Member member) {
			return sqlSession.update("adminMapper.updateMemberStatus", member);
		}
		
	
		//-----------------------------------//
		// 2. [식당] 관리
		// 2-1. 식당 리스트 조회용
		@Override
		public List<Map<String, String>> selectRestaurantList() {
			return sqlSession.selectList("adminMapper.selectRestaurantList");
		}
		// 2-2. 식당 등록용
		@Override
		public int insertRestaurant(Restaurant R) {
			return sqlSession.insert("adminMapper.insertRestaurnat",R);
		}
		// 2-3. [식당] 활성화 상태 변경용
		@Override
		public int updateRestaurantStatus(Restaurant restaurant) {
			return sqlSession.update("adminMapper.updateRestaurantStatus",restaurant);
		}
		// 2-4. [식당] Admin 상태 변경용
		@Override
		public int updateRestaurantAdminStatus(Restaurant restaurant) {
			return sqlSession.update("adminMapper.updateRestaurantAdminStatus",restaurant);
		}
		
		//-----------------------------------//
		// 3. [게시글] 관리
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
		// 3-3. 게시글의 활성화 상태 변경용
		@Override
		public int postUpdateStatus(Post post) {
			return sqlSession.update("adminMapper.PostUpdateStatus", post);
		}
		// 3-4. 게시글에 대한 사진의 활성화 상태 변경용
		@Override
		public int pictureUpdateStatus(Picture picture) {
			return sqlSession.update("adminMapper.pictureUpdateStatus", picture);
		}
	
		
		//-----------------------------------//
		// 4. [신고 ] 관리 조회용
		// 4-1. 신고된 댓글 리스트 출력용
		@Override
		public List<Map<String, String>> selectCommentReportList() {
			return sqlSession.selectList("adminMapper.selectCommentReportList");
		}
		// 4-2. 댓글의  활성화 상태 변경용
		@Override
		public int adminPostCommentStatus(PostComment comment) {
			return sqlSession.update("adminMapper.commentStatusUpdate", comment);
		}
		// 4-3. 댓글의 신고상태 변경용
		@Override
		public int cReportStatusUpdate(Report report) {
			return sqlSession.update("adminMapper.cReportStatusUpdate", report);
		}
		
		// 4-4. 신고된 게시글 리스트 출력용
		@Override
		public List<Map<String, String>> selectPostReportList() {
			return sqlSession.selectList("adminMapper.selectPostReportList");
		}
		
		// 4-5. 게시글의 신고상태 변경용
		@Override
		public int pReportStatusUpdate(Report report) {
			return sqlSession.update("adminMapper.pReportStatusUpdate", report);
		}
		
		//-----------------------------------//
		
		


		


		




}