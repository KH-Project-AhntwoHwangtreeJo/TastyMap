package com.kh.tastyMap.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.member.model.dao.MemberDAO;
import com.kh.tastyMap.member.model.vo.Member;

@Service("memberService")
public class MemberServiceEmpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public int insertMember(Member m) {
		return memberDAO.insertMember(m);
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
	public int checkIdDuplicate(String memberId) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("userId", memberId);
		return memberDAO.checkIdDuplicate(hmap);
	}

	@Override
	public Member myGallery(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int[] followAndPostCnt(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
