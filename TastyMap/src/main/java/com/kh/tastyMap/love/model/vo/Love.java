package com.kh.tastyMap.love.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //롬복을  활용한 getter, setter 자동 추가 어노테이션
@AllArgsConstructor // 전체 매개변수 받는 생성자 자동생성 어노테이션
@NoArgsConstructor // 기본 생성자 용 (super)
public class Love {
	
	private int lno;
	private String memberId;
	private int pNo;
	
	
	public Love(String memberId, int pNo) {
		this.memberId = memberId;
		this.pNo = pNo;
	}
	
	
}
