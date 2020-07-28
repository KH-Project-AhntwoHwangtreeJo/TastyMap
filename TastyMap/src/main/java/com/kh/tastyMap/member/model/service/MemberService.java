package com.kh.tastyMap.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.tastyMap.love.model.vo.Love;
import com.kh.tastyMap.member.model.vo.Follower;
import com.kh.tastyMap.member.model.vo.Member;

public interface MemberService {
	
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
	  * 회원 정보 수정용 메소드
	  * @param m
	  * @return
	  */
	int updateMember(Member m);
	
	/**
	 * 회원 탈퇴용 메소드
	 * @param m
	 * @return
	 */
	int deleteMember(Member m);
	
	/**
	 * 마이 갤러리 조회용 메소드
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
	 * 마이갤러리 포스트 사진 조회용 메소드
	 * @param memberId
	 * @return
	 */
	List myGalleryPhoto(String memberId);

	/**
	 * 아이디 중복 체크
	 * @param memberId
	 * @return
	 */
	int checkIdDuplicate(String memberId);

	/**
	 * 팔로우 했는지 조회 
	 * @param follower
	 * @return
	 */
	int selectFollower(Follower follower);
	
	/**
	 * 팔로우 하는 기능
	 * - 이미 해당 팔로우를 했다면 취소
	 * - 팔로우 한적 없으면 팔로우 추가
	 *  
	 * @param follower
	 * @return
	 */
	Map<String, Object> clickFollower(Follower follower);
}
