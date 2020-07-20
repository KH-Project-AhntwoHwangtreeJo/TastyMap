package com.kh.tastyMap.post.model.dao;

import java.util.List;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.postComment.model.vo.PostComment;

public interface PostDAO {
	/**
	 * 게시글 작성 메소드
	 * @param post
	 * @return
	 */
	int insertPost(Post post);
	
	int insertPicture(Picture p);
	
	/**
	 * 게시글 수정 메소드
	 * @param post
	 * @return
	 */
	int updatePost(Post post);
	
	int updatePicture(Picture p);
	
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
	
	/**
	 * 게시글 상세 조회 페이지 - 댓글 리스트 출력
	 * @param pno
	 * @return
	 */
	List<PostComment> commemtList(int pno);

}
