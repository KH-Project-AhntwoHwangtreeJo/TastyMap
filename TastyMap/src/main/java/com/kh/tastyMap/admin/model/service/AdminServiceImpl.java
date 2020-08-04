package com.kh.tastyMap.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.admin.model.dao.AdminDAO;
import com.kh.tastyMap.member.model.vo.Member;
import com.kh.tastyMap.notice.model.vo.Notice;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.report.model.vo.Report;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;
	//-----------------------------------//
	// 1. [회원] 관리 조회용
	@Override
	public List<Map<String, String>> selectMemberList() {
		
		return adminDAO.selectMemberList();
	}
	
	
	//-----------------------------------//
	// 2. [식당] 관리 조회용
	@Override
	public List<Map<String, String>> selectRestaurantList() {
		return adminDAO.selectRestaurantList();
	}
	
	
	//-----------------------------------//
	// 3. [게시글] 관리 조회용
	
	// 3-1. 게시글 전체 리스트 출력용
	@Override
	public List<Map<String, String>> selectPostList() {
		return adminDAO.selectPostList();
	}
	

	// 3-1. 게시글에 해당하는 사진 리스트 출력용
	@Override
	public List<Map<String, String>> selectPictureList() {
		return adminDAO.selectPictureList();
	}
	
	
	//-----------------------------------//
	// 4. [공지사항] 관리 조회용
	@Override
	public List<Map<String, String>> selectNoticeList() {
		return adminDAO.selectNoticeList();
	}
	
	
	
	//-----------------------------------//
	// 5. [신고 ] 관리 조회용
	@Override
	public List<Map<String, String>> selectCommentReportList() {
		return adminDAO.selectCommentReportList();
	}


	@Override
	public List<Map<String, String>> selectPostReportList() {
		return adminDAO.selectPostReportList();
	}

	
	//-----------------------------------//



}
