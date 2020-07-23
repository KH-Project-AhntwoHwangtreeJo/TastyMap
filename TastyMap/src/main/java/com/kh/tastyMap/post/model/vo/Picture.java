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
	
	private int picture_No;
	private int pNo;
	private String pOriginName;
	private String pRenamedName;
	private int pLevel;
	private Date uploadDate;
	private String pStatus;
	   
		private List<Picture> sajin = new ArrayList<Picture>();
	   
}
