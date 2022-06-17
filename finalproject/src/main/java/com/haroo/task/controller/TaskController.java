package com.haroo.task.controller;

import com.google.gson.Gson;
import com.haroo.login.domain.EmployeeVO;
import com.haroo.task.domain.TaskVO;
import com.haroo.task.service.TaskService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/task")
@Log4j
public class TaskController {

    private final TaskService taskService;

    @Autowired
    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    //캘린더 로드
    @GetMapping
    public ModelAndView getTaskPage(HttpSession httpSession) {

        ModelAndView modelAndView = new ModelAndView();

        //현재 사원번호 설정
        int emNo = ((EmployeeVO) httpSession.getAttribute("employee")).getEmNo();

        try {
            List<TaskVO> taskVOList = taskService.getTaskListService(emNo);
            String json = new Gson().toJson(taskVOList);

            System.out.println(json);

            modelAndView.setViewName("/task/task_form");
            modelAndView.addObject("json", json);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return modelAndView;
    }

    //새로운 일정 생성
    @PostMapping("/new")
    public ResponseEntity<String> insertTask(@RequestBody TaskVO taskVO) {

        int insertResult = taskService.insertTaskService(taskVO);

        return insertResult == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //일정 업데이트
    @PatchMapping("")
    public ResponseEntity<String> updateTask(@RequestBody TaskVO taskVO) {

        int updateResult = taskService.updateTaskService(taskVO);

        return updateResult == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //일정 업데이트
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteTask(@PathVariable("id") Integer id) {

        int deleteResult = taskService.deleteTaskService(id);

        return deleteResult == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}