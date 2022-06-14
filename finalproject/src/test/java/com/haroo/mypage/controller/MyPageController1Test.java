package com.haroo.mypage.controller;

import com.google.gson.Gson;
import com.haroo.mypage.domain.MyPageUserDTO;
import com.haroo.task.domain.TaskVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.inject.Inject;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*.xml")
@WebAppConfiguration
@Slf4j
public class MyPageController1Test {

    @Inject
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext)
                .build();

        log.info("Set up :) >>>>>>>>>>>>>>>>>>>>>>>>>>");
    }

    //마이 페이지 컨트롤러 Test OK
    @Test
    public void updateMyInfo() throws Exception{
        //given
        MyPageUserDTO myPageUserDTO = new MyPageUserDTO();

        myPageUserDTO.setEm_no(19362300);
        myPageUserDTO.setEm_phone("010-9999-9999");
        myPageUserDTO.setEm_email("rlaghdrl333@naver.com");
        myPageUserDTO.setEm_pw("1");

        //when
        String json = new Gson().toJson(myPageUserDTO);

        //then
        log.info("{}", json);

        log.info("{}",mockMvc.perform(MockMvcRequestBuilders.patch("/haroo/mypage/update-information")));
    }
}