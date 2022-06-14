package com.haroo.task.service;

import com.haroo.task.domain.TaskVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TaskService {

    //기존 일정 가져오기 서비스
    List<TaskVO> getTaskListService(int emNo);

    //일정 추가 서비스
    int insertTaskService(TaskVO taskVO);

    //일정 업데이트 서비스
    int updateTaskService(TaskVO taskVO);

    //일정 삭제 서비스
    int deleteTaskService(Integer id);
}
