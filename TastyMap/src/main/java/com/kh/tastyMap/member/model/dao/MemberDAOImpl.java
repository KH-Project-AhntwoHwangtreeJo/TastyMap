package com.kh.tastyMap.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.member.model.vo.Follower;
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
		return sqlSession.update("memberMapper.updateMember", m);
	}

	@Override
	public int deleteMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 마이갤러리 조회
	@Override
	public Member myGallery(String memberId) {
		return sqlSession.selectOne("memberMapper.myGallery", memberId);
	}
	
	// 팔로우 팔로워 게시글 개수 조회
	@Override
	public Map<String, Object> followAndPostCnt(String memberId) {
		return sqlSession.selectOne("memberMapper.followAndPostCnt", memberId);
	}
	
	// 마이갤러리 대표사진 조회
	@Override
	public List myGalleryPhoto(String memberId) {
		return sqlSession.selectList("memberMapper.myGalleryPhoto", memberId);
	}
	
	// 팔로우 됐는지 조회하는 메소드
	@Override
	public int selectFollower(Follower follower) {
		return sqlSession.selectOne("followerMapper.selectFollower", follower);
	}

	// 팔로우 추가 메소드
	@Override
	public int insertFollower(Follower follower) {
		return sqlSession.insert("followerMapper.insertFollower", follower);
	}

	// 팔로우 취소 메소드
	@Override
	public int deleteFollower(Follower follower) {
		return sqlSession.delete("followerMapper.deleteFollower", follower);
	}

}
