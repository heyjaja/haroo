package com.haroo.chat.mapper;

import java.util.List;

import com.haroo.chat.domain.ChatVO;
import com.haroo.chat.domain.EmpVO;

public interface ChatMapper {

	public List<EmpVO> getList();
	
	public EmpVO read(Long em_no);
	
	public ChatVO getChatList(Long em_no);
}
