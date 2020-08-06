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
	
	
	private int rno;			// 식당 고유키
	private int bno;			
	private String member_Id;	// 회원아이디	
	private String rName;		// 식당이름
	private String rcontent;	// 식당 설명
	private String category;	// 식당카테고리
	private int price;			// 가격
	private String time;		// 시간
	private String tel;			// 전화번호
	private String address;		// 주소
	private String paking;		// 주차가능여부
	private Date updatedate;		
	private int latitude;
	private int longitude;
	private String rstatus;		// 활성화상태
	private String pRenamedName;// PICTURE	
	private double avg_star;	// 평균 별점
	private String nickName;	// 회원 닉네임

}
