package com.haroo.task.service;

import com.haroo.task.domain.TaskVO;
import com.haroo.task.mapper.TaskMapper;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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

    //일정 업데이트 Test OK
    @Test
    public void updateTaskService() {
        //given
        TaskVO taskVO = new TaskVO();

        taskVO.setId(27);
        taskVO.setEmNo(19362300);
        taskVO.setGroupId(0);

        //when
        taskVO.setTitle("바이");
        taskVO.setWriter("김서윤");
        taskVO.setContent("업데이트용");
        taskVO.setStart("2022-06-05");
        taskVO.setEnd("2022-06-06");
        taskVO.setAllDay(true);
        taskVO.setTextColor("Purple");
        taskVO.setBackgroundColor("White");

        taskMapper.updateTask(taskVO);

        //then
        System.out.println("My Task = " + taskVO);

    }

    @Test
    public void deleteTaskService() {
        //given
        TaskVO taskVO = new TaskVO();

        //when
        taskMapper.deleteTask(33);

        //then db checking
    }
}