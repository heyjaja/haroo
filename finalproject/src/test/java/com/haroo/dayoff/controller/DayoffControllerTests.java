package com.haroo.dayoff.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.haroo.attendance.controller.AttendanceControllerTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //test for controller
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class DayoffControllerTests {
	
	@Autowired
	private WebApplicationContext ctx; // 스프링 컨테이너
	private MockMvc mockMvc; 			 // 가상 WAS(톰캣)
	
	@Before //모든 테스트 전 매번 실행되는 메소드
	public void setup() { //가상 WAS 생성 메소드
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testStatus() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/dayoff/status")
				.param("emNo", "19362300"))
				.andReturn().getModelAndView().getModelMap());
	}

}
