package com.kh.tastyMap.postComment.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostComment implements Serializable{

	private static final long serialVersionUID = 545L;
	
	private int cno;
	private int pNo;
	private String ccontent;
	private Date cdate;
	private String cwriter;
	private String cstatus;
	private int parentkey;
	
	private String nickname;
	private String mphoto;
	private int level;
	
	// 댓글 수정용 생성자
	public PostComment(int cno, String ccontent) {
		super();
		this.cno = cno;
		this.ccontent = ccontent;
	}

	public PostComment(int pNo, String ccontent, String cwriter, int parentkey, int level) {
		super();
		this.pNo = pNo;
		this.ccontent = ccontent;
		this.cwriter = cwriter;
		this.parentkey = parentkey;
		this.level = level;
	}
	
	
	
}
