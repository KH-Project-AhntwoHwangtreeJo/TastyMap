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
	
	private int pno;			// 게시글 고유키
	private int rno;			// 식당 고유키
	private String member_Id;	// 회원아이디
	private Date pDate;			// 게시일자
	private String pContent;	// 게시글 내용
	private int pCnt;			// 게시글 조회수
	private double star;		// 별점
	private String pStatus;		// 게시상태
	private String mPhoto;		// 회원 프로필사진
	private String nickName;	// 회원 닉네임
	private String pRenamedName;// PICTURE 변경사진 파일명
	private String rName;		// 식당이름
	private String address;		// 식당주소						
	
	
	private List<Picture> files = new ArrayList<Picture>();
}
