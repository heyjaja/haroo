package com.haroo.dayoff.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.haroo.dayoff.domain.DayoffUsageVO;
import com.haroo.dayoff.domain.DayoffVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DayoffMapperTests {
	
	@Autowired
	private DayoffMapper mapper;

//	@Test
//	public void testStatusDayoff() {
//		log.info(mapper.statusDayoff(45424411));
//	}
	
//	@Test
//	public void testUpdateUse() {
//		log.info("휴가 사용됐다면 1 : " + mapper.updateUse(45424411));
//	}
	
//	@Test
//	public void testPrintUsageList() {
//		log.info("휴가 사용내역 : " + mapper.printUsageList(45424411));
//	}

}
