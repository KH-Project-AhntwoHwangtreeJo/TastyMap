package com.kh.tastyMap.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.member.model.dao.MemberDAO;
import com.kh.tastyMap.member.model.vo.Follower;
import com.kh.tastyMap.member.model.vo.Member;

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
	public int updateMember(Member m) {
		return memberDAO.updateMember(m);
	}

	@Override
	public int deleteMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Member myGallery(String memberId) {
		return memberDAO.myGallery(memberId);
		
	}


	@Override
	public Map<String, Object> followAndPostCnt(String memberId) {
		return memberDAO.followAndPostCnt(memberId);
	}
	
	@Override
	public List myGalleryPhoto(String memberId) {
		return memberDAO.myGalleryPhoto(memberId);
	}

	@Override
	public int selectFollower(Follower follower) {
		return memberDAO.selectFollower(follower);
	}
	
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
	
	

}
