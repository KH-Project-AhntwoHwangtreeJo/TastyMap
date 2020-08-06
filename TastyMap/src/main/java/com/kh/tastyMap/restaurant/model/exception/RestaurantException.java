package com.kh.tastyMap.restaurant.model.exception;

public class RestaurantException extends RuntimeException {

	public RestaurantException() {}

	public RestaurantException(String message) {
		super("식당 기능 에러 발생 : " + message);
	}
	
}
