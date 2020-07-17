package com.kh.tastyMap.member.model.exception;

public class MemberException  extends RuntimeException{
	public MemberException() {}

	public MemberException(String message) {
		super("회원 기능 에러 발생 : " + message);
	}
		

}
