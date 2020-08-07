package com.kh.tastyMap.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1588L;
	private String memberId;
	private String password;
	private String mphoto;
	private String userName;
	private String nickname;
	private String mcontent;
	private Date birth;
	private String gender;
	private String phone;
	private String email;
	private String address;
	private String mstatus;
	
	public Member(String userName, Date birth) {
		super();
		this.userName = userName;
		this.birth = birth;
	}

	public Member(String memberId, String password, String mphoto, String nickname, String mcontent, String phone,
			String email, String address, String mstatus) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.mphoto = mphoto;
		this.nickname = nickname;
		this.mcontent = mcontent;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.mstatus = mstatus;
	}

	public Member(String memberId, String mphoto, String nickname, String mcontent, String phone, String email,
			String address, String mstatus) {
		super();
		this.memberId = memberId;
		this.mphoto = mphoto;
		this.nickname = nickname;
		this.mcontent = mcontent;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.mstatus = mstatus;
	}
	
	// 관리자 - 회원상태 변경용
	public Member(String memberId, String mstatus) {
		super();
		this.memberId = memberId;
		this.mstatus = mstatus;
	}
	
	
}
