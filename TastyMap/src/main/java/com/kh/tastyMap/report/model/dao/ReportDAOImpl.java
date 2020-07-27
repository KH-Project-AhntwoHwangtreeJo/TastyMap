package com.kh.tastyMap.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.report.model.vo.Report;

@Repository
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override // 게시판 신고 조회
	public int selectPostReport(Report report) {
		return sqlSession.selectOne("reportMapper.postReportCheck", report);
	}

	@Override // 게시판 신고 추가
	public int insertPostReport(Report report) {
		return sqlSession.insert("reportMapper.insertPostReport", report);
	}

	@Override // 댓글 신고 조회
	public int selectCommentReport(Report report) {
		return 0;
	}

	@Override // 댓글 신고 추가
	public int insertCommentReport(Report report) {
		return 0;
	}

	@Override
	public int updateReportStatus(Report report) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePostStatus(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCommentStatus(PostComment comment) {
		// TODO Auto-generated method stub
		return 0;
	}

}
