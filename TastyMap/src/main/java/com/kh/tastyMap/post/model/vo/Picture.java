package com.kh.tastyMap.post.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Picture extends Post implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int picture_No;
	private int pNo;
	private String pictureName;

}
