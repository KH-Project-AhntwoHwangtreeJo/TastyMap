package com.kh.tastyMap.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.tastyMap.member.model.vo.Member;
import com.kh.tastyMap.notice.model.vo.Notice;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.report.model.vo.Report;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

public interface AdminService {
	
	/**
	 * 관리자 페이지에서 회원 리스트를 불러오는 메소드
	 * @author Sung A Cho
	 * @return
	 */
	 List<Map<String, String>>  selectMemberList();
	
	
	 //-----------------------------------------------------//
	/**
	 * 관리자 페이지에서 식당 리스트를 불러오는 메소드
	 * @author Sung A Cho
	 * @return
	 */
	 List<Map<String, String>>  selectRestaurantList();
	 
	
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
	 
	
	 //-----------------------------------------------------//
	/**
	 * 관리자 페이지에서 공지사항 리스트를 불러오는 메소드
	 * @author Sung A Cho
	 * @return
	 */
	 List<Map<String, String>>  selectNoticeList();
	 
	
	 //-----------------------------------------------------//
	/**
	 * 관리자 페이지에서 신고내용 리스트를 불러오는 메소드
	 * @author Sung A Cho
	 * @return
	 */
	 List<Map<String, String>>  selectReportList();


	
	 


}
