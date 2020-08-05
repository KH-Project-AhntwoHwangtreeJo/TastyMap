package com.kh.tastyMap.bookmark.model.exception;

public class IHaveBookmarkListException extends RuntimeException {

	public IHaveBookmarkListException() {}

	public IHaveBookmarkListException(String message) {
		super("북마크한 음식점 목록 출력 기능 에러 발생 : " + message);
	}
}
