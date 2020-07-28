package com.kh.tastyMap.post.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data   //롬복을 활용한 getter, setter 자동 추가 어노테이션
@AllArgsConstructor // 전체 매개 변수 받는 생성자 자동 생성 어노테이션
@NoArgsConstructor // 기본 생성자용
// @Getter / @Setter 로 각각 선택하여 추가할 수도 있다.
public class PostList implements Serializable {

	private static final long serialVersionUID = 162221L;
	
	private int pno;
	private int rno;
	private String member_Id;
	private Date pDate;
	private String pContent;
	private int pCnt;
	private double star;
	private String pStatus;
	private String mPhoto;
	private String nickName;
	private String pRenamedName;
	private String rName;
	private String address;
	
	
	private List<Picture> files = new ArrayList<Picture>();
}

