package com.haroo.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
			
		int emNo = 19362300;
		
		log.warn("오늘 날짜 출력" + model.addAttribute("today", service.printToday()));
		log.warn("출근 목록" + model.addAttribute("list", service.statusAttendance(emNo)));
		log.warn("로그인한 사원의 부서 목록" + model.addAttribute("depts", service.listDept(emNo)));
		
		return "/attendance/attendance_status";
	}
	
	@PostMapping("/start")
	public String start(int emNo, RedirectAttributes rttr) { //출근시간 입력 + 휴가자 입력
		
		log.warn("출근 시간 입력 : " + service.insertStartTime(emNo));
		log.warn("휴가자 입력 : " + service.insertDayoff());
		
		rttr.addFlashAttribute("emNo", emNo);
		
		return "redirect:/attendance/status";
	}
	
	@PostMapping("/outside")
	public String outside(int emNo, RedirectAttributes rttr) { //외근시간 입력
		
		log.warn("외근 시간 입력 : " + service.insertOutside(emNo));
		rttr.addFlashAttribute("emNo", emNo);
		
		return "redirect:/attendance/status";
	}
	
	@PostMapping("/end")
	public String end(int emNo, RedirectAttributes rttr) { //퇴근시간 수정(입력)
		
		log.warn("퇴근 시간 입력 : " + emNo);
		
		if (service.updateEndTime(emNo)) { //update의 return값은 모두 boolean이므로 성공한 경우에만 rttr에 저장하도록 함
			rttr.addFlashAttribute("result", "success");
		}	
		
		return "redirect:/attendance/status";
	}
	
	@GetMapping("/list/day")
	public String listDay(AttendanceVO attendance, Model model) { //일별 부서 근태조회 	
		
		attendance.setEmNo(19362300);
		//attendance.setAtDate("2022-06-05");
		
		if (attendance.getAtDate()== null || attendance.getAtDate().equals("")) {
			attendance.setAtDate(service.printToday());
		} else {
			attendance.setAtDate(attendance.getAtDate());
		}
		
		log.warn("오늘 날짜 출력 : " + model.addAttribute("today", service.printToday()));
		log.warn("검색 날짜 출력 : " + model.addAttribute("searchDate", service.printSearchDate(attendance.getAtDate())));
		log.warn("로그인한 사원의 부서 목록 : " + model.addAttribute("depts", service.listDept(attendance.getEmNo())));
		log.warn("일별 부서 근태목록 조회 : " + model.addAttribute("list", service.listDay(attendance)));
		
		return "/attendance/attendance_list";
	}
	
	@GetMapping("/list/month")
	public String listMonth(AttendanceVO attendance, Model model) { //월별 개인 근태조회 	
		
		attendance.setEmNo(19362300);
		// attendance.setAtDate("2022-06");

		String currentMonth = service.printToday().substring(0, 7);
		log.warn("현재 월 : " + model.addAttribute("currentMonth", currentMonth));
		
		//현재 년월 없으면 오늘날짜 기준으로 년월 기본값 설정
		if (attendance.getAtDate() == null || attendance.getAtDate().equals("")) {
			attendance.setAtDate(currentMonth);
		} else {
			attendance.setAtDate(attendance.getAtDate());
		}
		
		
		int onTime = service.countOnTime(attendance);
		int late = service.countLate(attendance);
		int monthLastDay = service.getMonthLastDay(attendance.getAtDate());
		int absent = 0;
		int dayoff = service.countDayoffDay(attendance);
		
		//결근 구하기
		SimpleDateFormat dateFormat= new SimpleDateFormat( "yyyy-MM" );
        Date searchDate = null;
        Date today = null;
        try {
        	searchDate = dateFormat.parse(attendance.getAtDate());
        	today = dateFormat.parse(currentMonth);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        //검색일 기준 오늘과 비교
        int compare = searchDate.compareTo(today);
        if (compare < 0) { //현재 월보다 이전일 때
        	absent = monthLastDay - (onTime + late + dayoff);
        }else { //현재월과 같을 때 오늘 일자에서 출근+지각+휴가 빼기
        	int currentLastDay = Integer.parseInt(service.printToday().substring(8, 10));
        	absent = currentLastDay - (onTime + late + dayoff);
            System.out.println( "searchDate = today" );
        }	
		
		log.warn("월별 정상출근 일수 : " + model.addAttribute("onTime", onTime));
		log.warn("월별 지각 일수 : " + model.addAttribute("late", late));
		log.warn("월별 결근 일수 : " + model.addAttribute("absent", absent));
		log.warn("월별 사용휴가 일수 : " + model.addAttribute("dayoff", dayoff));

		log.warn("월별 개인 근태목록 조회 : " + model.addAttribute("list", service.listMonth(attendance)));
		log.warn("검색 연월 출력하기 : " + model.addAttribute("search", attendance.getAtDate()));
		

		return "/attendance/attendance_list_month";
	}

}
