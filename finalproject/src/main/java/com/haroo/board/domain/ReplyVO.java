package com.haroo.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int reNo;
	private String reWriter;
	private String reContents;
	private String reRegdate;
	private Long bdNo;

}
