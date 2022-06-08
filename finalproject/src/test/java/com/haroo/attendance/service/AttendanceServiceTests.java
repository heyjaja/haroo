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

}
