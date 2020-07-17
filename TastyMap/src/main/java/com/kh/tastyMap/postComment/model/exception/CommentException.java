package com.kh.tastyMap.postComment.model.exception;

public class CommentException extends RuntimeException {
	
	public CommentException() {}

	public CommentException(String message) {
		super("회원 기능 에러 발생 : " + message);
	}
		

}
