package com.kh.tastyMap.notice.model.exception;

public class NoticeException  extends RuntimeException {

	public NoticeException() {}

	public NoticeException(String message) {
		super("공지사항 기능 에러 발생 : " + message);
	}
		
		
}
