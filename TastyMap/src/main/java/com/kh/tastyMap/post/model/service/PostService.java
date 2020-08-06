package com.kh.tastyMap.post.model.service;

import java.util.List;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.postComment.model.vo.PostComment;

public interface PostService  {
	
	static int POST_SERVICE_ERROR = 0;
	static int POST_SERVICE_COMPLETE = 1;
	
	
	
	/**
	 * RESTAURANT 검색하는 메소드
	 * @param post
	 * @return
	 */
	int selectRestaurantName(String rName);
	
	
	/**
	 * RESTAURANT에 식당이 없을 시 POST에서 추가하는 메소드
	 * @param post
	 * @return
	 */
	int insertFirstRestaurant(String rName, String address);
	
	/**
	 * 게시글 작성 메소드
	 * @param post
	 * @return
	 */
	int insertPost(Post post, List<Picture> pictureList);
	
	
	/**
	 * 게시글 리스트 전체 조회 메소드
	 * @return
	 */
	List<PostList> postAllList();
	
	/**
	 * 게시글 수정 메소드
	 * @param post
	 * @return
	 */
	/* 게시글 수정(조은성) */
	int updatePost(Post post, List<Picture> pictureList);
	
	/**
	 * 게시글 삭제 메소드
	 * @param pno
	 * @return
	 */
	int deletePost(int pNo);
	int deletePicture(int pNo);
	int deleteComment(int pNo);
	
	
	/**
	 * 게시글 상세 조회 메소드
	 * @param pno
	 * @return
	 */
	Post postDetail(int pNo);

	/**
	 * 게시글 상세 페이지 사진 조회 메소드
	 * @param pno
	 * @return
	 */
	List postDetailPhoto(int pNo);
	
	/**
	 * 게시글 조회수 증가 메소드
	 * @param pno
	 * @return
	 */
	int updatePCNT(int pNo);
	
	/**
	 * 내 게시글에 좋아요한 사용자 리스트
	 * @param pno
	 * @return
	 */
	List<PostList>getLoveMemberList(int pNo);

	List<PostComment> commentList(int pNo);
}
