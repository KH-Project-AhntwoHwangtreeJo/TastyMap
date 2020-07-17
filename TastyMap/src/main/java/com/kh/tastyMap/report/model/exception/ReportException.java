package com.kh.tastyMap.report.model.exception;

public class ReportException extends RuntimeException {
	
	public ReportException() {}

	public ReportException(String message) {
		super("신고 기능 에러 발생 : " + message);
	}

}
