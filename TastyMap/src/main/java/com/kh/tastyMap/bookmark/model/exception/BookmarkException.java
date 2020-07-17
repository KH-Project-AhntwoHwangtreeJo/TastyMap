package com.kh.tastyMap.bookmark.model.exception;

public class BookmarkException extends RuntimeException {

	public BookmarkException() {}

	public BookmarkException(String message) {
		super("북마크 기능 에러 발생 : " + message);
	}
}
