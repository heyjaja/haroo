package com.haroo.attendance.mapper;

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
public class AttendanceMapperTests {
	
	@Autowired
	private AttendanceMapper mapper;
	
//	@Test
//	public void testInsertStartTime() {
//		mapper.insertStartTime(19362300);
//		
//		log.info("insert start time...........");
//	}
	
//	@Test
//	public void testUpdateEndTime() {
//		
//		int re = mapper.updateEndTime(19362300);
//		log.info("Update EndTime : " + re );
//	}
	
//	@Test
//	public void testInsertOutside() {
//		
//		mapper.insertOutside(19362305);
//		
//		log.info("Insert Outside..................");
//	}
	
//	@Test
//	public void testUpdateState() {
//		
//		int re = mapper.updateState(19362300);
//		log.info("Update State : " + re );
//	}
	
//	@Test
//	public void testInsertDayoff() {
//		
//		int re = mapper.insertDayoff();
//		log.info("InsertDayoff : " + re);
//	}
	
	//----------------------------------------------------------------------------
	
//	@Test
//	public void testStatusAttendance() {
//		
//		mapper.statusAttendance(19362300).forEach(list -> log.info(list));
//	}
	
//	@Test
//	public void testListDept() {
//		mapper.listDept(19362300).forEach(list -> log.info(list));
//	}
	
//	@Test
//	public void testPrinToday() {
//		mapper.printToday();
//	}
	
//	@Test
//	public void testListDay() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(19362300);
//		vo.setAtDate("2022-06-05");
//		mapper.listDay(vo).forEach(list -> log.info(list));
//	}
	
//	@Test
//	public void testListMonth() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(19362300);
//		vo.setAtDate("2022-05");
//		mapper.listMonth(vo).forEach(list -> log.info(list));
//	}
	
//	@Test
//	public void testPrintSearchDate() {
//		log.info("검색 날짜 출력 : " + mapper.printSearchDate("2022-06-05"));
//	}
	
//	@Test
//	public void testCountOnTime() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(19362300);
//		vo.setAtDate("2022-05");
//		log.info("정상출근 일자 카운트: " + mapper.countOnTime(vo));
//	}
	
//	@Test
//	public void testCountLate() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(19362300);
//		vo.setAtDate("2022-06");
//		log.info("지각 일자 카운트 : " + mapper.countLate(vo));
//	}
	
//	@Test
//	public void testGetMonthLastDay() {
//		log.info("월 막날 구하기 : " + mapper.getMonthLastDay("2022-06"));
//	}
	
//	@Test
//	public void testCountDayoffDay() {
//		AttendanceVO vo = new AttendanceVO();
//		vo.setEmNo(45424411);
//		vo.setAtDate("2022-06");
//		log.info("월 사용 휴가 일수 카운트 : " + mapper.countDayoffDay(vo));
//	}

	
}
