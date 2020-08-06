package com.kh.tastyMap.restaurant.model.exception;

public class searchBarRestaurantException extends RuntimeException {

	public searchBarRestaurantException() {}

	public searchBarRestaurantException(String message) {
		super("식당 검색 기능 에러 발생 : " + message);
	}
	
}
