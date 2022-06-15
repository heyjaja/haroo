package com.haroo.approval.controller;

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
public class ApprovalControllerTests {

  @Autowired
  private WebApplicationContext ctx; // 스프링 컨테이너
  
  private MockMvc mockMvc; // 가상의 톰캣 역할
  
  @Before
  public void setup() {
    this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
  }
  
  @Test
  public void testList() throws Exception {
    
    log.info(mockMvc.perform(
        MockMvcRequestBuilders.get("/haroo/approval/process")
        .param("page", "3")
        .param("amount", "10")
        ).andReturn().getModelAndView().getModelMap());
  }
  
  @Test
  public void testInsertForm() throws Exception {
    log.info(mockMvc.perform(MockMvcRequestBuilders.post("/haroo/approval/form")
        .param("foKind", "테스트")
        .param("foTitle", "테스트 문서 양식 2")
        .param("foContent", "테스트2: ")
        .param("foInfo", "테스트를 위한 양식 2")
        .param("FoStatus", "0"))
        .andReturn().getModelAndView().getViewName());
  }
  
  @Test
  public void testFormList() throws Exception {
    
    log.info(mockMvc.perform(
        MockMvcRequestBuilders.get("/haroo/approval/forms")
        ).andReturn().getModelAndView().getModelMap());
  }
  
  @Test
  public void testGetForm() throws Exception {
    
    log.info(mockMvc.perform(
        MockMvcRequestBuilders.get("/haroo/approval/form/4")
        ).andReturn().getModelAndView().getModelMap());
  }

}
