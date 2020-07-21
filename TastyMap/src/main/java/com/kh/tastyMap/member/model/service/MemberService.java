package com.kh.tastyMap.member.model.service;

import com.kh.tastyMap.member.model.vo.Member;

public interface MemberService {
	
	/**
	 * 아이디 중복 체크
	 * @param memberId
	 * @return
	 */
	int idDupCheck(String memberId);
	
	/**
	 * 회원 가입용 메소드
	 * @param m
	 * @return
	 */
	int memberJoin(Member m);
	
	/**
	 * 로그인용 메소드
	 * @param m
	 * @return
	 */
	 Member loginMember(Member m);
	 
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
	int[] followAndPostCnt(String memberId);



}
