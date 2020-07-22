package com.kh.tastyMap.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.member.model.vo.Member;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("memberMapper.checkIdDuplicate", hmap);
		
		return (int)hmap.get("result");
	}

	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	@Override
	public Member selectOne(String memberId) {
		return sqlSession.selectOne("memberMapper.loginMember", memberId);
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
		return null;
//		return sqlSession.selectOne("memberMapper.followAndPostCnt", memberId);
	}

	

}
