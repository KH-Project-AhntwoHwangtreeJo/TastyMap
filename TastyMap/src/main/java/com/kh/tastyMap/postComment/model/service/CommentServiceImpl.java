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
	
	@Override
	public int insertComment(PostComment comment) {
		return commentDAO.insertComment(comment);
	}

	@Override
	public int updateComment(PostComment comment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(int cno) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
