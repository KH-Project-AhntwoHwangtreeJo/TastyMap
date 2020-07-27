package com.kh.tastyMap.report.model.vo;

import java.io.Serializable;

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
	private String reportType;
	private String reportStatus;
	
	public Report(String memberId, int reportNo) {
		super();
		this.memberId = memberId;
		this.reportNo = reportNo;
	}
	
	
}
