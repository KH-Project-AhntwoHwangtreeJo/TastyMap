package com.kh.tastyMap.postComment.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostComment implements Serializable{

	private static final long serialVersionUID = 545L;
	
	private String cno;
	private String pNo;
	private String ccontent;
	private String cdate;
	private String cwriter;
	private String cstatus;
	private String parentkey;
	
}
