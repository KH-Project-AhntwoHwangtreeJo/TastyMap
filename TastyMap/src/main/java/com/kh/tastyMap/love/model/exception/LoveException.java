package com.kh.tastyMap.love.model.exception;

public class LoveException extends RuntimeException{
	
	public LoveException() {}

	public LoveException(String message) {
		super("좋아요 기능 에러 발생 : " + message);
	}
		

}
