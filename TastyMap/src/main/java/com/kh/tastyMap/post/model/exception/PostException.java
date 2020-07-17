package com.kh.tastyMap.post.model.exception;

public class PostException extends RuntimeException {
	
	public PostException() {}

	public PostException(String message) {
		super("게시글 기능 에러 발생 : " + message);
	}

}
