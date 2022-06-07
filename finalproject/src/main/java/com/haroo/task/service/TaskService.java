package com.haroo.task.service;

import com.haroo.task.domain.TaskVO;

import java.util.List;

public interface TaskService {

    //기존 일정 가져오기 서비스
    List<TaskVO> getTaskListService(int em_no);

    //일정 추가 서비스
    int insertTaskService(TaskVO taskVO);
}
