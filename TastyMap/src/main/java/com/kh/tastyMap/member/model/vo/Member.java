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
	
	
}
