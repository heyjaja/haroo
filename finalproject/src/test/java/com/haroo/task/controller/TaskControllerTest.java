package com.haroo.task.controller;

import com.google.gson.Gson;
import com.haroo.login.mapper.EmployeeMapper;
import com.haroo.task.domain.TaskVO;
import com.haroo.task.mapper.TaskMapper;
import com.haroo.task.service.TaskService;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
public class TaskControllerTest {

    @Inject
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @Autowired
    private TaskService taskService;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext)
                .build();

        log.info("Set up :) >>>>>>>>>>>>>>>>>>>>>>>>>>");
    }

    @Test
    public void getTaskPage() throws Exception{
        //given
        int emNo = 19362300;

        //when
        List<TaskVO> taskVOList = taskService.getTaskListService(emNo);
        String json = new Gson().toJson(taskVOList);

        //then
        log.info("{}", json);

        log.info("{}",mockMvc.perform(MockMvcRequestBuilders.get("/haroo/task")));
    }
}