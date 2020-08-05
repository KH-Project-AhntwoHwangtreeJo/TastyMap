package com.kh.tastyMap.report.model.service;

import java.util.HashMap;
import java.util.List;
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
		return reportDAO.selectCommentReport(report);
	}

	@Override // 댓글 신고 추가
	public Map<String, Object> insertCommentReport(Report report) {
		int result = reportDAO.selectCommentReport(report);
		
		Map<String, Object> pcmap = new HashMap<String, Object>();
		
		String pcmsg;
		String pcstatus = "N"; // DB에 데이터 없을 때 : N / 있을 때 : Y
		
		if(result > 0) { // 이미 신고 한것
			pcmsg = "이미 신고 하셨습니다.";
			pcstatus = "Y";
		} else if (result == 0) {
			result = reportDAO.insertCommentReport(report);
			
			if(result == 1) { // 신고 insert 성공
				pcmsg ="신고 정상적으로 완료되었습니다.";
				pcstatus = "Y";
			} else {
				pcmsg ="신고 실패";
			}
			
		} else pcmsg = "신고 조회 실패";
		
		System.out.println("service pcstatus : " + pcstatus);
		pcmap.put("pcmsg", pcmsg);
		pcmap.put("pcstatus", pcstatus);
		
		return pcmap;
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
	
	// 해당 포스트에서 신고된 댓글 리스트
	@Override
	public List selectCommentReportList(int pNo) {
		return reportDAO.selectCommentReportList(pNo);
	}

}
