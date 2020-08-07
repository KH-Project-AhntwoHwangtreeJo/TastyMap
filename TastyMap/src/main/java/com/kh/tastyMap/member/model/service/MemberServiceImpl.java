package com.kh.tastyMap.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.kh.tastyMap.member.model.dao.MemberDAO;
import com.kh.tastyMap.member.model.vo.Alarm;
import com.kh.tastyMap.member.model.vo.Alarm;
import com.kh.tastyMap.member.model.vo.Follower;
import com.kh.tastyMap.member.model.vo.Member;
import com.kh.tastyMap.post.model.vo.PostList;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int checkIdDuplicate(String memberId) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("memberId", memberId);
		return memberDAO.checkIdDuplicate(hmap);
	}


	@Override
	public int insertMember(Member m) {
		return memberDAO.insertMember(m);
	}

	@Override
	public Member selectOne(String memberId) {
		return memberDAO.selectOne(memberId);
	}

	@Override
	public int deleteMember(String memberId) {
		return memberDAO.deleteMember(memberId);
	}

	// 마이갤러리
	@Override
	public Member myGallery(String memberId) {
		return memberDAO.myGallery(memberId);
		
	}


	@Override
	public String findIdMember(Member member) {
		return memberDAO.findId(member);
	}


	@Override
	public int updateMember1(Member member) {
		return memberDAO.updateMember1(member);
	}


	@Override
	public int updateMember2(Member member) {
		return memberDAO.updateMember2(member);
	}
	
	// 팔로우 팔로워 게시글 개수 조회
	@Override
	public Map<String, Object> followAndPostCnt(String memberId) {
		return memberDAO.followAndPostCnt(memberId);
	}
	
	// 마이갤러리 대표사진 조회
	@Override
	public List myGalleryPhoto(String memberId) {
		return memberDAO.myGalleryPhoto(memberId);
	}

	// 팔로우 됐는지 조회하는 메소드
	@Override
	public int selectFollower(Follower follower) {
		return memberDAO.selectFollower(follower);
	}
	
	// 팔로우 클릭시
	@Override
	public Map<String, Object> clickFollower(Follower follower) {
		
		int result = memberDAO.selectFollower(follower);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String msg;
		String status = "N"; // DB에 데이터 없을 때 : N / 있을 때 : Y
		
		if(result > 0) {
			result = memberDAO.deleteFollower(follower);
			
			if(result == 1) {
				msg = "팔로우 취소 성공";
			} else {
				msg = "팔로우 취소 실패";
				status = "Y";
			}
		} else if (result == 0) {
			result = memberDAO.insertFollower(follower);
			
			if(result == 1) {
				msg = "팔로우 추가 성공!";
				status = "Y";
			} else {
				msg = "팔로우 추가 실패";
			}
		} else msg = "팔로우 조회 실패";
		
		map.put("msg", msg);
		map.put("status", status);
		
		return map;
	}
	@Override
	public List<Map<String, String>> myFollowingList(String memberId) {
		return memberDAO.myFollowingList(memberId);
	}


	@Override
	public List<Map<String, String>> myFollowerList(String memberId) {
		return memberDAO.myFollowerList(memberId);
	}


	@Override
	public int followerCancel(Follower follower) {
		return memberDAO.followerCancel(follower);
	}


	@Override
	public int followingCancel(Follower follower) {
		// TODO Auto-generated method stub
		return memberDAO.followingCancel(follower);
	}

	@Override
	public List<PostList> myPage(String member_Id) {
		// TODO Auto-generated method stub
		return memberDAO.myPage(member_Id);
	}


	@Override
	public List<Map<String, String>> restaurantCargoChartList() {
		// TODO Auto-generated method stub
		return memberDAO.restaurantCargoChartList();
	}


	@Override
	public List<Map<String, Object>> addressChartList() {
		// TODO Auto-generated method stub
		return memberDAO.addressChartList();
	}


	@Override
	public List<Map<String, Object>> restaurantChartList(String member_Id) {
		// TODO Auto-generated method stub
		return memberDAO.restaurantChartList(member_Id);
	}


	@Override
	public List<Alarm> selectApprovalReceive(String memberId) {
		// TODO Auto-generated method stub
		return memberDAO.selectApprovalReceive(memberId);
	}
	
	

}
