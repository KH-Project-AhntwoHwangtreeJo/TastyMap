package com.kh.tastyMap.love.model.service;

import java.util.List;
import java.util.Map;

import com.kh.tastyMap.love.model.vo.Love;
import com.kh.tastyMap.post.model.vo.PostList;

public interface LoveService {
	/**
	 * 게시글을 좋아요 하는 기능
	 * - 이미 해당 게시글을 좋아요 했다면 취소
	 * - 좋아요 한적 없으면 좋아요 추가
	 *  
	 * @param love
	 * @return
	 */
	Map<String, Object> clickLove(Love love);
	
	/**
	 * 마이페이지에서 게시글 좋아요 리스트 출력
	 * @param memberId
	 * @return
	 */
	Love selectMyLoveList(String memberId);
	
	int selectLove(Love love);
	
	List<PostList> iHaveLoveList(String member_Id);

}
