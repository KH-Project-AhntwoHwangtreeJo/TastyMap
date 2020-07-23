package com.kh.tastyMap.member.model.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.member.model.dao.MemberDAO;
import com.kh.tastyMap.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int checkIdDuplicate(String memberId) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("userId", memberId);
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
		// TODO Auto-generated method stub
		return 0;
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
		System.out.println("memberId service : " + memberId);
		return memberDAO.followAndPostCnt(memberId);
	}
	
	@Override
	public List myGalleryPhoto(String memberId) {
		return memberDAO.myGalleryPhoto(memberId);
	}





}
