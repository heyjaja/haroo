package com.haroo.task.mapper;

import com.haroo.task.domain.TaskVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TaskMapper {
    //일정 가져오기
    List<TaskVO> getTaskList(int emNo);

    //일정 추가
    int insertTask(TaskVO taskVO);

    //일정 업데이트
    int updateTask(TaskVO taskVO);

    //일정 삭제
    int deleteTask(@Param("id") Integer id);
}
