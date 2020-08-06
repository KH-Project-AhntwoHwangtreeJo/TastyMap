package com.kh.tastyMap.post.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Picture implements Serializable{

	private static final long serialVersionUID = 1004L;
	
	private int picture_No; // 사진 고유번호
	private int pNo;		// 게시글 번호
	private String pOriginName; // 원본 사진파일명
	private String pRenamedName;// 변경 사진파일명
	private int pLevel;			// 대표사진 구분용
	private Date uploadDate;	// 등록일자
	private String pStatus;		// 게시상태
	   
		private List<Picture> sajin = new ArrayList<Picture>();
	   

}
