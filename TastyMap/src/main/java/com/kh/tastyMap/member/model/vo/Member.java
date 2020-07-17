package com.kh.tastyMap.member.model.vo;

import java.sql.Date;

public class Member {
	
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
	
	
	public Member() {
		super();
	}


	public Member(String memberId, String password, String mphoto, String userName, String nickname, String mcontent,
			Date birth, String gender, String phone, String email, String address, String mstatus) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.mphoto = mphoto;
		this.userName = userName;
		this.nickname = nickname;
		this.mcontent = mcontent;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.mstatus = mstatus;
	}


	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", mphoto=" + mphoto + ", userName="
				+ userName + ", nickname=" + nickname + ", mcontent=" + mcontent + ", birth=" + birth + ", gender="
				+ gender + ", phone=" + phone + ", email=" + email + ", address=" + address + ", mstatus=" + mstatus
				+ "]";
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getMphoto() {
		return mphoto;
	}


	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getMcontent() {
		return mcontent;
	}


	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getMstatus() {
		return mstatus;
	}


	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}
	
	
	
	
	
	

}
