package com.kh.tastyMap.bookmark.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.tastyMap.bookmark.model.vo.Bookmark;
@Repository
public interface BookmarkDAO {
	
	/**
	 * 이미 해당 사용자가 북마크 했는지 조회하는 기능
	 * @param bookmark
	 * @return
	 */
	int selectBookmarkOne(Bookmark bookmark);
	
	/**
	 * 식당을 북마크 하는 기능
	 * @param bookmark
	 * @return
	 */
	int insertBookmark(Bookmark bookmark);
	
	
	/**
	 * 북마크 리스트에서 식당을 지우는 기능
	 * @param bookmark
	 * @return
	 */
	int deleteBookmark(Bookmark bookmark);
	
	/**
	 * 마이페이지 - 내가 북마크한 식당 출력
	 * @param memberId
	 * @return
	 */
	Bookmark selectMyBookList(String member_Id);

	List<Bookmark> iHaveBookmarkList(String member_Id);
}
