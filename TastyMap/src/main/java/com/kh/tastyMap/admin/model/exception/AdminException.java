package com.kh.tastyMap.admin.model.exception;

public class AdminException extends RuntimeException {

	public AdminException() {}

	public AdminException(String message) {
		super("관리자 기능 에러 발생 : " + message);
	}
}
