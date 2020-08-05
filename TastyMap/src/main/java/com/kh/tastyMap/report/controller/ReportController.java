package com.kh.tastyMap.report.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tastyMap.report.model.exception.ReportException;
import com.kh.tastyMap.report.model.service.ReportService;
import com.kh.tastyMap.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	// 포스트 신고하기 
	@RequestMapping("/report/insertPostReport.do")
	@ResponseBody
	public Map<String, Object> insertPostReport(@RequestParam int pNo, @RequestParam String memberId, Model model, HttpSession session) {
		Map<String, Object> reportInsertMap;
		
		Report report = new Report(memberId, pNo);
		
		try {
			
			reportInsertMap = reportService.insertPostReport(report);
		} catch (Exception e) {
			
			throw new ReportException(e.getMessage());
		}
		
		return reportInsertMap;
	}
	
	// 댓글 신고하기
	@RequestMapping("/report/insertCommentReport.do")
	@ResponseBody
	public Map<String, Object> insertCommentReport(@RequestParam int reportNo, @RequestParam String memberId, Model model, HttpSession session) {
		Map<String, Object> commentReportInsertMap;
		Report report = new Report(memberId, reportNo);
		
		try {
			
			commentReportInsertMap = reportService.insertCommentReport(report);
		} catch (Exception e) {
			
			throw new ReportException(e.getMessage());
		}
		
		return commentReportInsertMap;
	}

}
