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
    public List<TaskVO> getTaskListService(int emNo) {
        return taskMapper.getTaskList(emNo);
    }

    @Override
    public int insertTaskService(TaskVO taskVO) {
        return taskMapper.insertTask(taskVO);
    }

    @Override
    public int updateTaskService(TaskVO taskVO) {
        return taskMapper.updateTask(taskVO);
    }

    @Override
    public int deleteTaskService(Integer id) {
        return taskMapper.deleteTask(id);
    }
}
