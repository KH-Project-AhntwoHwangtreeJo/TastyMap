package com.kh.tastyMap.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.tastyMap.member.model.vo.Member;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.report.model.vo.Report;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

public interface AdminDAO {
	
	/**
	 * 관리자 페이지에서 회원 리스트를 불러오는 메소드
	 * @author Sung A Cho
	 * @return
	 */
	 List<Map<String, String>>  selectMemberList();
	
	 /**
	  * 관리자 페이지에서 회원의 상태를 변경하는 메소드
	  * @author Sung A Cho
	  * @param memberId
	  * @param mstatus
	  * @return
	  */
	 int updateMemberList(Member member);
	 //-----------------------------------------------------//
	/**
	 * 관리자 페이지에서 식당 리스트를 불러오는 메소드
	 * @author Sung A Cho
	 * @return
	 */
	 List<Map<String, String>>  selectRestaurantList();
	 

	/**
	 * 관리자 페이지에서 식당을 등록하는 메소드
	 * @author HaYoung Hwang
	 * @param R
	 * @return
	 */
	 int insertRestaurant(Restaurant R);
		 
	 /**
	  * 관리자 페이지에서 식당 활성화 상태를 변경하는 메소드
	  * @author Sung A Cho
	  * @param restaurant
	  * @return
	  */
	 int updateRestaurantStatus(Restaurant restaurant);
		 
		 
	 /**
	  * 관리자 페이지에서 식당  admin 상태를 변경하는 메소드
	  * @author Sung A Cho 
	  * @param restaurant
	  * @return
	  */
	 int updateRestaurantAdminStatus(Restaurant restaurant);
		
	 //-----------------------------------------------------//
	/**
	 * 관리자 페이지에서 게시글 리스트를 불러오는 메소드
	 * @author Sung A Cho
	 * @return
	 */
	 List<Map<String, String>>  selectPostList();
	 
	
	/**
	 * 관리자 페이지에서 게시글에 대한 사진 리스트를 불러오는 메소드
	 * @author Sung A Cho
	 * @return
	 */
	 List<Map<String, String>> selectPictureList();
	 
	 
	 /**
	  * 관리자 페이지에서 게시글의 활성화 상태를 변경하는 메소드
	  * @author Sung A Cho 
	  * @param post
	  * @return
	  */
	 int postUpdateStatus(Post post);
	 
	/**
	 * 관리자 페이지에서 게시글에 해당하는 사진의 활성화 상태를 변경하는 메소드
	 * @author Sung A Cho
	 * @param pno
	 * @return
	 */
	 int pictureUpdateStatus(Picture picture);
	
	 //-----------------------------------------------------//
	
	/**
	 * 관리자 페이지에서 신고내용 리스트를 불러오는 메소드
	 * @author Sung A Cho
	 * @return
	 */
	 List<Map<String, String>>  selectCommentReportList();

	 
	 /**
	  * 관리자 페이지에서 댓글의 활성화 상태를 변경하는  메소드
	  * @author Sung A Cho 
	 * @param comment 
	  * @return
	  */
	 int adminPostCommentStatus(PostComment comment);
	 
	 /**
	  * 관리자 페이지에서 댓글의 신고상태를 변경하는 메소드
	  * @author Sung A Cho 
	 * @param report 
	  * @return
	  */
	 int cReportStatusUpdate(Report report);
	 /**
	  * 관리자 페이지에서 신고내용 리스트를 불러오는 메소드
	  * @author Sung A Cho
	  * @return
	  */
	 List<Map<String, String>>  selectPostReportList();

	 /**
	  * 관리자 페이지에서 게시글의 신고상태를 변경하는 메소드
	  * @author Sung A Cho
	  * @param report
	  * @return
	  */
	int pReportStatusUpdate(Report report);


	 
}
