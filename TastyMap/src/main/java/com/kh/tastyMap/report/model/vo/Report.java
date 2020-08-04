package com.kh.tastyMap.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report implements Serializable{

	private static final long serialVersionUID = 959L;
	
	private String memberId;
	private int reportNo;
	private String reportType;// 댓글인지 게시글인지 구분값을 넣을 변수
	private String reportStatus; //관리자의 체크여부를 받아올 변수 (R:등록/C:확인완료) 
	
	//----------------Admin Zone-----------------
	// admin 신고관리
	private String writer;  //게시글/댓글 작성자 받아올 변수 
	private String content; // 게시글/댓글 내용 받아올 변수
	private Date writeDate; // 게시글/댓글 작성일자를 받아올 변수
	private String status; // 게시글/댓글의 활성화 상태를 받아올 변수
	//--------------------------------------------
	
	// 신고하기 버튼을 눌렀을 때, 이미 같은 사람이 같은 글을 중복신고 하는지 select할 생성자 
	public Report(String memberId, int reportNo) {
		super();
		this.memberId = memberId;
		this.reportNo = reportNo;
	}
	
	
}
