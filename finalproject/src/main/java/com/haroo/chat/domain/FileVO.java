package com.haroo.chat.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class FileVO implements Serializable {
	private int co_no;
	private String co_name;
	private int co_size;
	private String co_realname;
	

}
