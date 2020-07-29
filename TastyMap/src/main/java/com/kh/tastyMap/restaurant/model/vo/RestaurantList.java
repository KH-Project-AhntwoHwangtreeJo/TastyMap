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
public class RestaurantList implements Serializable {

	
	private static final long serialVersionUID = 4646L;
	
	
	private int rno;
	private int bno;
	private String member_Id;
	private String rName;
	private String rcontent;
	private String category;
	private int price;
	private String time;
	private String tel;
	private String address;
	private String paking;
	private Date updatedate;
	private int latitude;
	private int longitude;
	private String rstatus;
	private String pRenamedName;
	private double avg_star;
	private String nickName;

}
