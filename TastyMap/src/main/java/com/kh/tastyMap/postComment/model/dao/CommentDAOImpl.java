package com.kh.tastyMap.postComment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.postComment.model.vo.PostComment;

@Repository("commentDAO")
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertComment(PostComment comment) {
		return sqlSession.insert("commentMapper.insertPostComment", comment);
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
