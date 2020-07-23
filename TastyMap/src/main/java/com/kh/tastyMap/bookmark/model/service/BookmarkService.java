package com.kh.tastyMap.bookmark.model.service;

import java.util.Map;

import com.kh.tastyMap.bookmark.model.vo.Bookmark;

public interface BookmarkService {
	
	/**
	 * 식당을 북마크 하는 기능
	 * - 이미 해당식당을 북마크 했다면 북마크 취소
	 * - 북마크 한적 없으면 북마크 추가
	 *  
	 * @param bookmark
	 * @return
	 */
	Map<String, Object> clickBookmark(Bookmark bookmark);
	
	
	/**
	 * 마이페이지 - 내가 북마크한 식당 출력
	 * @param memberId
	 * @return
	 */
	Bookmark selectMyBookList(String memberId);


	int selectBookmark(Bookmark bookmark);

}
