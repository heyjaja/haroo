package com.haroo.dayoff.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DayoffServiceTests {
	
	@Autowired
	private DayoffService service;

	@Test
	public void testStatusDayoff() {
		log.info(service.statusDayoff(19362300));
	}
	
//	@Test
//	public void testUpdateUse() {
//		log.info(service.updateUse(45424411));
//	}
	
//	@Test
//	public void testUpdateRemainder() {
//		log.info(service.updateRemainder(45424411));
//	}

}
