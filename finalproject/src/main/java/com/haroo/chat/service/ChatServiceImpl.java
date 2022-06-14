package com.haroo.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haroo.chat.mapper.ChatMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ChatServiceImpl {
	
	@Autowired
	private ChatMapper chatMapper;

}
