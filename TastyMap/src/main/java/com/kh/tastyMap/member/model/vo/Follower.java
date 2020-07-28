package com.kh.tastyMap.member.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Follower implements Serializable{
	
	private static final long serialVersionUID = 5677L;
	
	private String memberId;
	private String followerId;
}
