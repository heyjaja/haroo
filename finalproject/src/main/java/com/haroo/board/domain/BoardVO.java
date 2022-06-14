package com.haroo.board.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Long bdNo;
	private String title;
	private String contents;
	private String writer;
	private Date regdate;
	private int hitcount;
	private int emNo;
	
}
