package com.kh.tastyMap.love.model.dao;
import com.kh.tastyMap.love.model.vo.Love;

public interface LoveDAO {
	
	/**
	 * 이미 해당 사용자가 좋아요 했는지 조회하는 기능
	 * @param bookmark
	 * @return
	 */
	Love selectBookmarkOne(Love love);
	
	/**
	 * 게시글을 좋아요 하는 기능
	 * @param bookmark
	 * @return
	 */
	int insertLove(Love love);
	
	
	/**
	 * 게시글 좋아요를 취소하는 기능
	 * @param bookmark
	 * @return
	 */
	int deleteLove(Love love);
	
	/**
	 * 마이페이지에서 게시글 좋아요 리스트 출력
	 * @param memberId
	 * @return
	 */
	Love selectMyLoveList(String memberId);
}
