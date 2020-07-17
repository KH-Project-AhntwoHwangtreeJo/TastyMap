package com.kh.tastyMap.notice.model.service;

import java.util.List;

import com.kh.tastyMap.notice.model.vo.Notice;

public interface NoticeService {
	
	/**
	 * 공지사항 추가 메소드
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);
	
	
	/**
	 * 관리자-공지사항 수정 메소드
	 * @param notice
	 * @return
	 */
	int updateNotice(Notice notice);
	
	/**
	 * 관리자-공지사항 비활성화 메소드
	 * @param notice
	 * @return
	 */
	int deleteNotice(Notice notice);
	
	/**
	 * 관리자-공지사항 목록 조회용 메소드
	 * @return
	 */
	List<Notice> adminNoticeList();
	
	/**
	 * 사용자-공지사항 목록 조회용 메소드
	 * @return
	 */
	List<Notice> noticeList();
	
	/**
	 * 공지사항 상세보기 디테일용 메소드
	 * @param nno
	 * @return
	 */
	Notice noticeDetail(int nno);
}
