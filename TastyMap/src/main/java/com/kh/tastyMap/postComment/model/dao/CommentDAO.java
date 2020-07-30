package com.kh.tastyMap.postComment.model.dao;

import java.util.List;

import com.kh.tastyMap.postComment.model.vo.PostComment;

public interface CommentDAO {
	
	/**
	 * 댓글 작성 메소드
	 * @param comment
	 * @return
	 */
	int insertComment(PostComment comment);
	
	/**
	 * 댓글 수정 메소드
	 * @param comment
	 * @return
	 */
	int updateComment(PostComment comment);
	
	/**
	 * 댓글 삭제 메소드 (활성화 상태 N으로 변경)
	 * @param cno
	 * @return
	 */
	int deleteComment(int cno);
	
	

}
