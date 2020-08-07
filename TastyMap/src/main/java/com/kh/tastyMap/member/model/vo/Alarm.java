package com.kh.tastyMap.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Alarm implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1588L;
	
	
	private String mphoto;
	private String who;
	private int type;
	private int pno;
	private String whos;
	private String prenamedName;


}
