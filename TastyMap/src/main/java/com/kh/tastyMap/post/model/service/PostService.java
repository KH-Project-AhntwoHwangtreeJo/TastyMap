package com.kh.tastyMap.post.model.service;

import java.util.List;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;

public interface PostService  {
	
	/**
	 * 게시글 작성 메소드
	 * @param post
	 * @return
	 */
	int insertPost(Post post, List<Picture> pictureList);
	
	/**
	 * 게시글 수정 메소드
	 * @param post
	 * @return
	 */
	int updatePost(Post post, List<Picture> pictureList);
	
	/**
	 * 게시글 삭제 메소드
	 * @param pno
	 * @return
	 */
	int deletePost(int pno);
	
	/**
	 * 게시글 리스트 전체 조회 메소드
	 * @return
	 */
	List<Post> postList();
	
	/**
	 * 게시글 상세 조회 메소드
	 * @param pno
	 * @return
	 */
	Post PostDetail(int pno);


}
