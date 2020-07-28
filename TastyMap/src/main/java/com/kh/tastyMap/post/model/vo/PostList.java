package com.kh.tastyMap.post.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.tastyMap.restaurant.model.vo.RestaurantList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data   //롬복을 활용한 getter, setter 자동 추가 어노테이션
@AllArgsConstructor // 전체 매개 변수 받는 생성자 자동 생성 어노테이션
@NoArgsConstructor // 기본 생성자용
// @Getter / @Setter 로 각각 선택하여 추가할 수도 있다.
public class PostList implements Serializable {

	private static final long serialVersionUID = 162221L;
	
	private String nickname;
	private String mphoto;
	private int pNo; 			
	private int rNo; 			
	private String member_Id; 	
	private Date date;			
	private String pContent;	
	private int pCnt;			
	private double star;			
	private String pStatus;		
	
	
	
}
