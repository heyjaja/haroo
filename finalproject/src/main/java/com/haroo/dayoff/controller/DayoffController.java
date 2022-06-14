package com.haroo.dayoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haroo.dayoff.domain.DayoffUsageVO;
import com.haroo.dayoff.domain.DayoffVO;
import com.haroo.dayoff.service.DayoffService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/dayoff/*")
@AllArgsConstructor
public class DayoffController {
	
	@Autowired
	private DayoffService service;
	
	@GetMapping("/status")
	public String status(DayoffVO vo, DayoffUsageVO usage, Model model) { //@RequestParam("emNo") int emNo, 
		
		//vo.setEmNo(19362300);
		vo.setEmNo(45424411);
		
		log.warn("오늘 날짜 : " + model.addAttribute("today", service.printToday()));
		
		//휴가 현황 출력
		log.warn("/status..................");
		model.addAttribute("dayoff", service.statusDayoff(vo.getEmNo()));
	
		//검색한 사용 기록
		usage.setEmNo(45424411);
		
		if (usage.getLeStart() == null || usage.getLeStart().equals("")) {
			usage.setLeStart(service.printToday().substring(0, 4));
		} else {
			usage.setLeStart(usage.getLeStart());
		}
		log.warn("검색연도 : " + model.addAttribute("sYear", usage.getLeStart()));
		
		model.addAttribute("usageList", service.printUsageList(usage));
		
		return "/dayoff/dayoff_status";
	}

}
