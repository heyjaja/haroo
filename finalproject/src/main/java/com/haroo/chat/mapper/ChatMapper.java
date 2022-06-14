package com.haroo.chat.mapper;

import java.util.List;

import com.haroo.chat.domain.ChatVO;
import com.haroo.chat.domain.FileVO;

public interface ChatMapper {
	
//	int uploadFile(FileVO fileVO);
//	
//	List<FileVO> listFile();
	
	public void insertChat(ChatVO chatVO);
}