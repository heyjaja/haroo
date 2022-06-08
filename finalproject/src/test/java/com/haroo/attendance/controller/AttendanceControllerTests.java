package com.haroo.attendance.controller;

import static org.junit.Assert.fail;

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

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class AttendanceControllerTests {
	
	@Autowired
	private WebApplicationContext ctx; // 스프링 컨테이너
	private MockMvc mockMvc; 			 // 가상 WAS(톰캣)
	
	@Before //모든 테스트 전 매번 실행되는 메소드
	public void setup() { //가상 WAS 생성 메소드
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testStatus() throws Exception{ //로그인한 사원의 부서 출근 목록 출력
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/attendance/status")
				.param("emNo", "19362306"))
				.andReturn().getModelAndView().getModelMap());
	}
	
//	@Test
//	public void testStart() throws Exception{ //출근 입력 + 휴가자 입력
//		
//		String result = mockMvc.perform(MockMvcRequestBuilders.post("/attendance/start")
//				.param("emNo", "19362306"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("result");
//	}
	
//	@Test
//	public void testOutside() throws Exception{ //외근 입력
//		
//		String result = mockMvc.perform(MockMvcRequestBuilders.post("/attendance/outside")
//				.param("emNo", "19362307"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("result");
//	}
	
//	@Test
//	public void testEnd() throws Exception{ //퇴근 입력
//		
//		String result = mockMvc.perform(MockMvcRequestBuilders.post("/attendance/end")
//				.param("emNo", "19362306"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("result");
//	}

}
