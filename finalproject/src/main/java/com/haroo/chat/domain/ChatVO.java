package com.haroo.chat.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {

	private int ch_no;//채팅창번호
	private String ch_contents;//내용
	private Date ch_time;//시간
	private String ch_from;//보낸 사람
	private String ch_to;//받는 사람
}
