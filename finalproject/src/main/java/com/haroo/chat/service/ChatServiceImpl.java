package com.haroo.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haroo.chat.domain.EmpVO;
import com.haroo.chat.mapper.ChatMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatMapper mapper;
	
	@Override
	public List<EmpVO> getList() {
		
		log.info("getList.............");
		
		return mapper.getList();
	}
}
