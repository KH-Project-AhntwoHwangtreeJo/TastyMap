package com.kh.tastyMap.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.admin.model.dao.AdminDAO;
import com.kh.tastyMap.member.model.vo.Member;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.report.model.vo.Report;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;
	//-----------------------------------//
	// 1. [회원] 관리
	// 1-1. [회원] 리스트 조회용
	@Override
	public List<Map<String, String>> selectMemberList() {
		
		return adminDAO.selectMemberList();
	}
	// 1-2. [회원] 상태 변경용
	@Override
	public int updateMemberList(Member member) {
		return adminDAO.updateMemberList(member);
	}
	
	//-----------------------------------//
	// 2. [식당] 관리
	// 2-1. [식당] 리스트 조회용
	@Override
	public List<Map<String, String>> selectRestaurantList() {
		return adminDAO.selectRestaurantList();
	}
	// 2-2. [식당] 등록용
	@Override
	public int insertRestaurant(Restaurant R) {
		return adminDAO.insertRestaurant(R);
	}
	// 2-3. [식당] 활성화 상태 변경용
	@Override
	public int updateRestaurantStatus(Restaurant restaurant) {
		return adminDAO.updateRestaurantStatus(restaurant);
	}
	// 2-4. [식당] Admin 상태 변경용
	@Override
	public int updateRestaurantAdminStatus(Restaurant restaurant) {
		return adminDAO.updateRestaurantAdminStatus(restaurant);
	}
	
	//-----------------------------------//
	// 3. [게시글] 관리 조회용
	
	// 3-1. 게시글 전체 리스트 출력용
	@Override
	public List<Map<String, String>> selectPostList() {
		return adminDAO.selectPostList();
	}
	

	// 3-2. 게시글에 해당하는 사진 리스트 출력용
	@Override
	public List<Map<String, String>> selectPictureList() {
		return adminDAO.selectPictureList();
	}
	// 3-3. 게시글의 활성화 상태 변경 & 해당 게시글의 사진 활성화 상태 변경
	@Override
	public int adminPostUpdateStatus(Post post) {
		int result = adminDAO.postUpdateStatus(post);
		
		if(result>0) {// 게시글의 활성화 상태 변경 성공
			Picture picture = new Picture();
			picture.setPNo(post.getPNo());
			picture.setPStatus(post.getPStatus());
			
			result = adminDAO.pictureUpdateStatus(picture);
		}
		return result;
	}

	//-----------------------------------//
	// 4. [신고 ] 관리 조회용
	// 4-1. 신고된 댓글 리스트 출력용
	@Override
	public List<Map<String, String>> selectCommentReportList() {
		return adminDAO.selectCommentReportList();
	}
	// 4-2. 댓글의  활성화 상태 변경용
	@Override
	public int adminPostCommentStatus(PostComment comment) {
		return adminDAO.adminPostCommentStatus(comment);
	}
	// 4-3. 댓글의 신고상태 변경용
	@Override
	public int cReportStatusUpdate(Report report) {
		return adminDAO.cReportStatusUpdate(report);
	}
	

	// 4-4. 신고된 게시글 리스트 출력용
	@Override
	public List<Map<String, String>> selectPostReportList() {
		return adminDAO.selectPostReportList();
	}
	
	// 4-5. 게시글의 신고상태 변경용
	@Override
	public int pReportStatusUpdate(Report report) {
		return adminDAO.pReportStatusUpdate(report);
	}
	

	
	//-----------------------------------//
	


}
