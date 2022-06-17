package com.haroo.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haroo.board.domain.Criteria;

import com.haroo.board.domain.ReplyVO;
import com.haroo.board.service.BoardService;
import com.haroo.board.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
@Controller
public class ReplyController {

	@Autowired
	private BoardService service2;
	
	@Autowired
	private ReplyService service;

	@PostMapping("/register")
	public String register(ReplyVO vo, RedirectAttributes rttr) {

		log.info("ReplyVO: " + vo);

		int insertCount = service.register(vo);

		log.info("Reply INSERT COUNT: " + insertCount);
		rttr.addFlashAttribute("result", vo.getBdNo());
		return "redirect:/board/list";

	}

//	@GetMapping("/pages/{bdNo}/{page}")
//	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page, @PathVariable("bdNo") Long bdNo){
//	
//		log.info("getList...");
//		
//		Criteria cri = new Criteria(page, 10);
//		
//		log.info(cri);
//		
//		return new ResponseEntity<List<ReplyVO>>(service.getList(cri, bdNo), HttpStatus.OK);
//	}
//
//	@GetMapping("/{reNo}")
//	public ResponseEntity<ReplyVO> get(@PathVariable("reNo") Long reNo) {
//
//		log.info("get: " + reNo);
//
//		return new ResponseEntity<ReplyVO>(service.get(reNo), HttpStatus.OK);
//	}

	
	@GetMapping("/remove")
	public String remove(@RequestParam("reNo") Long reNo, RedirectAttributes rttr) {

		log.info("remove: " + reNo);
		if(service.remove(reNo)==1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}

	
	@PostMapping("/modify")
	public String modify(ReplyVO vo,  RedirectAttributes rttr) {

		if(service.modify(vo)==1) {
			rttr.addFlashAttribute("result", "success");
		}
		

		return "redirect:/board/list";

	}

//	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
//			MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {
//
//		Criteria cri = new Criteria(page, 10);
//
//		log.info("get Reply List bno: " + bno);
//
//		log.info("cri: " + cri);
//
//		return new ResponseEntity<ReplyPageDTO>(service.getListPage(cri, bno), HttpStatus.OK);
//	}

}
