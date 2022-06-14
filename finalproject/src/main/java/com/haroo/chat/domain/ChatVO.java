package com.haroo.chat.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ChatVO implements Serializable{
	private int chatNo;
	private String chatContents;
	private int chatTime;
	private String chatFrom;
	private String chatTo;
	
}
	