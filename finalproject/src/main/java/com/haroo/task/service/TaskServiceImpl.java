package com.haroo.task.service;

import com.haroo.task.domain.TaskVO;
import com.haroo.task.mapper.TaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService{

    private final TaskMapper taskMapper;

    @Autowired
    public TaskServiceImpl(TaskMapper taskMapper) {
        this.taskMapper = taskMapper;
    }

    @Override
    public List<TaskVO> getTaskListService(int em_no) {
        return taskMapper.getTaskList(em_no);
    }

    @Override
    public int insertTaskService(TaskVO taskVO) {
        return taskMapper.insertTask(taskVO);
    }
}
