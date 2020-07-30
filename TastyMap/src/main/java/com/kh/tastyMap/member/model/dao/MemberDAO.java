package com.kh.tastyMap.member.model.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import com.kh.tastyMap.love.model.vo.Love;
import com.kh.tastyMap.member.model.vo.Follower;
import com.kh.tastyMap.member.model.vo.Member;
import com.kh.tastyMap.post.model.vo.PostList;

public interface MemberDAO {
	
	/**
	 * 회원 가입용 메소드
	 * @param m
	 * @return
	 */
	int insertMember(Member m);
	
	/**
	 * 로그인용 메소드
	 * @param m
	 * @return
	 */
	Member selectOne(String memberId);
	
	
	/**
	 * 회원 탈퇴용 메소드
	 * @param m
	 * @return
	 */
	int deleteMember(String memberId);
	
	/**
	 * 마이갤러리 조회용
	 * @param memberId
	 * @return
	 */
	Member myGallery(String memberId);

	/**
	 * 팔로우 와 포스트 개수
	 * @param memberId
	 * @return
	 */
	Map<String, Object> followAndPostCnt(String memberId);

	/**
	 * 마이갤러리 포스트 사진 조회용
	 * @param memberId
	 * @return
	 */
	List myGalleryPhoto(String memberId);


	/**
	 * 아이디 중복 체크
	 * @param memberId
	 * @return
	 */
	int checkIdDuplicate(HashMap<String, Object> hmap);
	/**
	 * 아이디 찾기
	 * @param memberId
	 * @return
	 */
	String findId(Member member);
	
	/**
	 * 비밀번호 입력했을 때 수정
	 * @param memberId
	 * @return
	 */
	int updateMember1(Member member);
	
	/**
	 * 비밀번호 입력안했을 때 수정
	 * @param memberId
	 * @return
	 */
	int updateMember2(Member member);
	/**
	 * 이미 해당 사용자가 팔로우 했는지 조회하는 기능
	 * @param follower
	 * @return
	 */
	int selectFollower(Follower follower);
	
	
	/**
	 * 팔로우를 추가 하는 기능
	 * @param follower
	 * @return
	 */
	int insertFollower(Follower follower);
	
	
	/**
	 * 팔로우를 취소하는 기능
	 * @param follower
	 * @return
	 */
	int deleteFollower(Follower follower);

	List<PostList> myPage(String member_Id);

}
