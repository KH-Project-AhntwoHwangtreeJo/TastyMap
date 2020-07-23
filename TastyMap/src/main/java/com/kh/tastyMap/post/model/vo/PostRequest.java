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
	private String rName;
	private String address;
	private String pContent;	// 게시글 내용
	private int star;			// 게시글 별점
	
	
	// 첨부파일 갯수 확인용 가상 변수
	private int fileCount;
	
	// 별점 평균 가상변수
	private int percent;
	
	private List<Picture> files = new ArrayList<Picture>();

	
}
