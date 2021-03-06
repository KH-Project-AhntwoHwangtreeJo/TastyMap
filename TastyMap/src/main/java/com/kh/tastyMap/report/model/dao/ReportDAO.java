package com.kh.tastyMap.report.model.dao;

import java.util.List;

import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.report.model.vo.Report;

public interface ReportDAO {
	
	/**
	 * 게시글 신고 조회
	 * reportType=='P'
	 * @param report
	 * @return
	 */
	int selectPostReport(Report report);
	
	/**
	 * 게시글 신고하기
	 * reportType=='P'
	 * @param report
	 * @return
	 */
	int insertPostReport(Report report);
	
	/**
	 * 댓글 신고 조회
	 * reportType=='C'
	 * @param report
	 * @return
	 */
	int selectCommentReport(Report report);
	
	/**
	 * 댓글 신고하기
	 * reportType=='C'
	 * @param report
	 * @return
	 */
	int insertCommentReport(Report report);
	
	
	/**
	 * 관리자 페이지 - 신고 접수상태 변경 
	 * @param report
	 * @return
	 */
	int updateReportStatus(Report report);
	
	
	/**
	 * 관리자 페이지 - 신고리스트 중 게시글 활성화 상태 변경
	 * (신고된 것이 게시글인지 댓글인지 확인은 컨트롤러에서 !
	 *  reportType=='P' 일때 실행 )
	 * @param post
	 * @return
	 */
	int updatePostStatus(Post post);
	
	/**
	 * 관리자페이지 - 신고리스트 중 댓글 활성화 상태 변경
	 * (신고된 것이 게시글인지 댓글인지 확인은 컨트롤러에서 !
	 *  reportType=='C' 일때 실행 )
	 * @param comment
	 * @return
	 */
	int updateCommentStatus(PostComment comment);

	/**
	 * 해당 포스트에서 신고된 댓글 리스트 조회
	 * @param pNo
	 * @return
	 */
	List selectCommentReportList(int pNo);

}
