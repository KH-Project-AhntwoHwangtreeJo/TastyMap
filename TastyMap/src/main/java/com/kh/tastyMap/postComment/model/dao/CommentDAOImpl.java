package com.kh.tastyMap.postComment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.postComment.model.vo.PostComment;

@Repository("commentDAO")
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 댓글 등록
	@Override
	public int insertComment(PostComment comment) {
		return sqlSession.insert("commentMapper.insertPostComment", comment);
	}

	// 댓글 수정
	@Override
	public int updateComment(PostComment comment) {
		return sqlSession.update("commentMapper.updatePostComment", comment);
	}

	// 댓글 삭제
	@Override
	public int deleteComment(int cno) {
		return sqlSession.delete("commentMapper.deletePostComment", cno);
	}
	

}
