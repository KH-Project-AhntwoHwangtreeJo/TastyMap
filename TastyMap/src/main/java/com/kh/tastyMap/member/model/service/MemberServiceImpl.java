package com.kh.tastyMap.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.member.model.dao.MemberDAO;
import com.kh.tastyMap.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int idDupCheck(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memberJoin(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member loginMember(Member m) {
		// TODO Auto-generated method stub
		return null;
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
	public int[] followAndPostCnt(String memberId) {
		return memberDAO.followAndPostCnt(memberId);
	}

}
