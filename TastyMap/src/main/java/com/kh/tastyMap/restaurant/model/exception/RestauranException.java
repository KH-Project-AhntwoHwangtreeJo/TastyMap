package com.kh.tastyMap.restaurant.model.exception;

public class RestauranException extends RuntimeException {

	public RestauranException() {}

	public RestauranException(String message) {
		super("식당 기능 에러 발생 : " + message);
	}
}
