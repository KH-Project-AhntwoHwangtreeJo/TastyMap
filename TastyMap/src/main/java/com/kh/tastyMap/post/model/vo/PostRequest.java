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
public class PostRequest implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String member_Id; 	// 회원 아이디
	private String rName;		// 식당이름
	private String address;		// 식당주소
	private String pContent;	// 게시글 내용
	private double starValue;	// 게시글 별점
	
	  private int pno; // 수정용

	// 첨부파일 갯수 확인용 가상 변수
	private int fileCount;
	
	
	private List<Picture> files = new ArrayList<Picture>();

	
}
