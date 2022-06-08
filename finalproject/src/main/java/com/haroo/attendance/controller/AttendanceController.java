package com.haroo.attendance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haroo.attendance.domain.AttendanceVO;
import com.haroo.attendance.service.AttendanceService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/attendance/*")
@AllArgsConstructor
public class AttendanceController {
	
	@Autowired
	private AttendanceService service;
	
	@GetMapping("/status")
	public String status(Model model) { //오늘 출근명단 + 로그인한 사원 부사원 목록 + 오늘 날짜 @RequestParam("emNo") int emNo, 
		
		
		AttendanceVO vo = new AttendanceVO();
		vo.setEmNo(19362300);
		
		//log.info("오늘 날짜 출력 : " + service.printToday());
		System.out.println("오늘 날짜 출력");
		model.addAttribute("today", service.printToday());
		
		//log.info("출근 목록 : " + service.statusAttendance(vo.getEmNo()));
		System.out.println("출근 목록");
		model.addAttribute("list", service.statusAttendance(vo.getEmNo()));
		 
		//log.info("로그인한 사원의 부서 목록 : " + service.listDept(vo.getEmNo()));
		System.out.println("로그인한 사원의 부서 목록");
		model.addAttribute("depts", service.listDept(vo.getEmNo()));
		
		
		return "/attendance/attendance_status";
	}
	
	@PostMapping("/start")
	public String start(int emNo, RedirectAttributes rttr) { //출근시간 입력 + 휴가자 입력
		
		log.info("출근 시간 입력 : " + service.insertStartTime(emNo));
		log.info("휴가자 입력 : " + service.insertDayoff());
		
		rttr.addFlashAttribute("emNo", emNo);
		
		return "redirect:/attendance/status";
	}
	
	@PostMapping("/outside")
	public String outside(int emNo, RedirectAttributes rttr) { //외근시간 입력
		
		log.info("외근 시간 입력 : " + service.insertOutside(emNo));
		rttr.addFlashAttribute("emNo", emNo);
		
		return "redirect:/attendance/status";
	}
	
	@PostMapping("/end")
	public String end(int emNo, RedirectAttributes rttr) { //퇴근시간 수정(입력)
		
		log.info("퇴근 시간 입력 : " + emNo);
		
		if (service.updateEndTime(emNo)) { //update의 return값은 모두 boolean이므로 성공한 경우에만 rttr에 저장하도록 함
			rttr.addFlashAttribute("result", "success");
		}	
		
		return "redirect:/attendance/status";
	}
	
	@GetMapping("/list")
	public String list(Model model) { //일월별조회 		
		
		return "/attendance/attendance_list";
	}

}
