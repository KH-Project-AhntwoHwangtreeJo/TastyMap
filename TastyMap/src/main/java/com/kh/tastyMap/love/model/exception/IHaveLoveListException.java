package com.kh.tastyMap.love.model.exception;

public class IHaveLoveListException extends RuntimeException{
	
	public IHaveLoveListException() {}

	public IHaveLoveListException(String message) {
		super("좋아요한 게시글 목록 출력 기능 에러 발생 : " + message);
	}
		

}
