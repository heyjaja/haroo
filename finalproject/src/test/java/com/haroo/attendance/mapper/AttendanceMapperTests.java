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

}
