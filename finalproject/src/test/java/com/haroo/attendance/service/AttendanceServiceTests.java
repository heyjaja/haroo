package com.haroo.attendance.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.haroo.attendance.domain.AttendanceVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AttendanceServiceTests {
	
	@Autowired
	private AttendanceService service;

//	@Test
//	public void testInsertStartTime() {
//		service.insertStartTime(19362303);
//		log.info("출근 입력............");
//	}
	
//	@Test
//	public void testUpdateEndTime() {
//		log.info("Update EndTime : " + service.updateEndTime(19362302));
//	}
	
//	@Test
//	public void testInsertOutside() {
//		service.insertOutside(19362304);
//		log.info("Insert Outside ............");
//	}
	
//	@Test
//	public void testUpdateState() {
//		log.info("Update State : " + service.updateState(19362302));
//	}
	
//	@Test
//	public void testInsertDayoff() { 
//		
//		int re = service.insertDayoff();
//		log.info("InsertDayoff : " + re);
//	}
	
	//------------------------------------print method----------------------------------------
	
//	@Test
//	public void testStatusAttendance() {
//
//		service.statusAttendance(19362303).forEach(v -> log.info(v));
//	}
	
//	@Test
//	public void testListDept() {
//		service.listDept(19362300).forEach(dept -> log.info(dept));
//	}
	
//	@Test
//	public void testPrinToday() {
//		service.printToday();
//	}
	
//	@Test
//	public void testListDay() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(19362300);
//		vo.setAtDate("2022-06-03");
//
//		service.listDay(vo).forEach(v -> log.info(v));
//	}
	
//	@Test
//	public void testListMonth() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(19362300);
//		vo.setAtDate("2022-06");
//
//		service.listMonth(vo).forEach(v -> log.info(v));
//	}
	
//	@Test
//	public void testPrintSearchDate() {
//		log.info("print Search date..............");
//		service.printSearchDate("2022-06-05");
//	}
	
//	@Test
//	public void testCountOnTime() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(19362300);
//		vo.setAtDate("2022-05");
//		log.info("정상출근 일자 카운트: " + service.countOnTime(vo));
//	}
	
//	@Test
//	public void testCountLate() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(19362300);
//		vo.setAtDate("2022-06");
//		log.info("지각 일자 카운트 : " + service.countLate(vo));
//	}
	
//	@Test
//	public void testGetMonthLastDay() {
//		log.info("월 막날 구하기 : " + service.getMonthLastDay("2022-06"));
//	}
	
//	@Test
//	public void testCountDayoffDay() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(45424411);
//		vo.setAtDate("2022-06");
//		log.info("월 사용 휴가 일수 카운트 : " + service.countDayoffDay(vo));
//	}

}
