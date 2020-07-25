package com.kh.tastyMap.bookmark.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data //롬복을  활용한 getter, setter 자동 추가 어노테이션
@AllArgsConstructor // 전체 매개변수 받는 생성자 자동생성 어노테이션
@NoArgsConstructor // 기본 생성자 용 (super)
public class Bookmark implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	
	private int bno;
	private String memberId;
	private int rno;
	
	
	
	
	public Bookmark(String memberId, int rno) {
		super();
		this.memberId = memberId;
		this.rno = rno;
	}

	
	
}
