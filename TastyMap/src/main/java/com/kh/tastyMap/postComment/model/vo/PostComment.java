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
	
}
