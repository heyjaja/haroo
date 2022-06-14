package com.haroo.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
//@RestController
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class ChatController {

	@Autowired
	ChatController chatController;
	
	
}
