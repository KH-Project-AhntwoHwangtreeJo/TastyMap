package com.kh.tastyMap.postComment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.postComment.model.dao.CommentDAO;
import com.kh.tastyMap.postComment.model.vo.PostComment;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDAO commentDAO;
	
	// 댓글 등록
	@Override
	public int insertComment(PostComment comment) {
		return commentDAO.insertComment(comment);
	}

	// 댓글 수정
	@Override
	public int updateComment(PostComment comment) {
		return commentDAO.updateComment(comment);
	}

	// 댓글삭제
	@Override
	public int deleteComment(int cno) {
		return commentDAO.deleteComment(cno);
	}
	
}
