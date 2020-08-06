package com.kh.tastyMap.restaurant.model.exception;

public class searchBarPostException extends RuntimeException {

	public searchBarPostException() {}

	public searchBarPostException(String message) {
		super("게시글 검색 기능 에러 발생 : " + message);
	}
	
}
