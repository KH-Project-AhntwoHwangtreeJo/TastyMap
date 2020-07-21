package com.kh.tastyMap.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.member.model.vo.Member;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
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
		return sqlSession.selectOne("memberMapper.myGallery", memberId);
	}

	@Override
	public int[] followAndPostCnt(String memberId) {
		return sqlSession.selectOne("memberMapper.followAndPostCnt", memberId);
	}

}
