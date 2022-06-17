package com.haroo.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.haroo.chat.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
//@RestController
@Log4j
@RequestMapping("/chat/*")
@AllArgsConstructor
public class ChatController {

	@Autowired
	ChatService service; 

	
	/*
	 * @GetMapping("/main") public String chat_main() {
	 * System.out.println("chat_form");
	 * 
	 * return "chat/chat_form"; }
	 */
	
	/*
	 * @GetMapping("/main") public String list(Model model) {
	 * 
	 * log.info("list"); model.addAttribute("chatlist", service.getList());
	 * 
	 * return "chat/list"; }
	 */
	
	@RequestMapping("/main")
	public ModelAndView chat(Model model) {
		ModelAndView mv = new ModelAndView();
		model.addAttribute("chatlist", service.getList());
		mv.setViewName("chat/chat_message");
		return mv;
	}
	
}
