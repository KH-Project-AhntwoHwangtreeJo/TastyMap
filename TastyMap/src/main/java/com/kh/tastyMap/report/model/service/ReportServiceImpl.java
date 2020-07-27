package com.kh.tastyMap.report.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.report.model.dao.ReportDAO;
import com.kh.tastyMap.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportDAO reportDAO;
	
	@Override // 게시판 신고 조회
	public int selectPostReport(Report report) { // PostController 로  연결됨
		return reportDAO.selectPostReport(report);
	}

	@Override // 게시판 신고 추가
	public Map<String, Object> insertPostReport(Report report) {
		int result = reportDAO.selectPostReport(report);
		
		Map<String, Object> pmap = new HashMap<String, Object>();
		
		String pmsg;
		String pstatus = "N"; // DB에 데이터 없을 때 : N / 있을 때 : Y
		
		if(result > 0) { // 이미 신고 한것
			pmsg = "이미 신고 하셨습니다.";
			pstatus = "Y";
		} else if (result == 0) {
			result = reportDAO.insertPostReport(report);
			
			if(result == 1) { // 신고 insert 성공
				pmsg ="신고 정상적으로 완료되었습니다.";
				pstatus = "Y";
			} else {
				pmsg ="신고 실패";
			}
			
		} else pmsg = "신고 조회 실패";
		
		pmap.put("pmsg", pmsg);
		pmap.put("pstatus", pstatus);
		
		return pmap;
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
