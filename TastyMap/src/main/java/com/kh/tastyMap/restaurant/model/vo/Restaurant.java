package com.kh.tastyMap.restaurant.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data   //롬복을 활용한 getter, setter 자동 추가 어노테이션
@AllArgsConstructor // 전체 매개 변수 받는 생성자 자동 생성 어노테이션
@NoArgsConstructor // 기본 생성자용
// @Getter / @Setter 로 각각 선택하여 추가할 수도 있다.
public class Restaurant implements Serializable {

	
	private static final long serialVersionUID = -1212L;
	
	
	private int rno;
	private String rname;
	private String rcontent;
	private String category;
	private String price;
	private String time;
	private String tel;
	private String address;
	private String paking;
	private Date updatedate;
	private int latitude;
	private int longitude;
	private String rstatus;
	private String adminStatus;
	
	// 관리자가 식당등록하는 생성자
	public Restaurant(String rname, String rcontent, String category, String price, String time, String tel,
			String address, String paking, Date updatedate, String rstatus) {
		super();
		this.rname = rname;
		this.rcontent = rcontent;
		this.category = category;
		this.price = price;
		this.time = time;
		this.tel = tel;
		this.address = address;
		this.paking = paking;
		this.updatedate = updatedate;
		this.rstatus = rstatus;
	}
	
	// admin 식당 활성화 상태 변경용 생성자 (by sung a)
	public Restaurant(int rno, String rstatus) {
		super();
		this.rno = rno;
		this.rstatus = rstatus;
	}

	
	
	
}
