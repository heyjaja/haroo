package com.haroo.chat.service;

import java.util.List;

import com.haroo.chat.domain.ChatVO;
import com.haroo.chat.domain.EmpVO;

public interface ChatService {

	public List<EmpVO> getList();

	public EmpVO get(Long em_no);

	public ChatVO getChatList(Long em_no);
}
