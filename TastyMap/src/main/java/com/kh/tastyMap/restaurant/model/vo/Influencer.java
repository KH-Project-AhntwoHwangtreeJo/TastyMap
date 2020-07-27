package com.kh.tastyMap.restaurant.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.tastyMap.post.model.vo.Picture;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Influencer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5252L;
	
	private int rNo;
	private int pNo;
	private String memberId;
	private Date pDate;
	private String pContent;
	private int star;
	private String pOriginName;
	private String pRenamedName;
	private int pLevel;
	private int pc_cnt;
	private String pStatus;
	private int loveCnt;
	private String nickName;

	private List<Picture> sajin = new ArrayList<Picture>();
}
