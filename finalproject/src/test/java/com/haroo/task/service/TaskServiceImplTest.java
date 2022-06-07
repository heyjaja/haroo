package com.haroo.task.service;

import com.google.gson.Gson;
import com.haroo.task.domain.TaskVO;
import com.haroo.task.mapper.TaskMapper;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*.xml")
@Slf4j
public class TaskServiceImplTest {

    @Setter(onMethod_ = @Autowired)
    private TaskMapper taskMapper;

    //일정 추가 Test OK
    @Test
    public void insertTaskServiceTest() {
        //given
        TaskVO taskVO = new TaskVO();

        //when
        taskVO.setId(2);
        taskVO.setEmNo(19362300);
        taskVO.setGroupId(0);
        taskVO.setTitle("하이 :)");
        taskVO.setWriter("김서윤");
        taskVO.setContent("테스트용");
        taskVO.setStart("2022-06-04");
        taskVO.setEnd("2022-06-05");
        taskVO.setAllDay(true);
        taskVO.setTextColor("Blue");
        taskVO.setBackgroundColor("Red");

        taskMapper.insertTask(taskVO);

        //then
        log.info("My Task = {}", taskVO);
    }
}