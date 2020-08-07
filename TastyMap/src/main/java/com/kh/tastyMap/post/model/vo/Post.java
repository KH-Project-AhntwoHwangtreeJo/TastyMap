package com.kh.tastyMap.post.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data // 롬복을 활용한 getter,setter 자동 추가 어노테이션
@AllArgsConstructor 
@NoArgsConstructor
public class Post implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int pNo; 			// 게시글 고유키
	private int rNo; 			// 레스토랑 고유키
	private String member_Id; 	// 회원 아이디
	private Date date;			// 게시일자
	private String pContent;	// 게시글 내용
	private int pCnt;			// 게시글 조회수
	private double star;		// 게시글 별점
	private String pStatus;		// 게시상태
	private int picture_No;
	
	// 첨부파일 갯수 확인용 가상 변수
	private int fileCount;
	
	private List<Picture> files = new ArrayList<Picture>();

	// post 디테일 조회용 변수
	private String address;
	private String nickname;
	private String rname;
	
	// admin 게시글 상태 변경용
	public Post(int pNo, String pStatus) {
		super();
		this.pNo = pNo;
		this.pStatus = pStatus;
	}
	
	
	
}
