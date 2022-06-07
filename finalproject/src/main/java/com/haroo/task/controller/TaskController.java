package com.haroo.task.controller;

import com.google.gson.Gson;
import com.haroo.login.domain.EmployeeVO;
import com.haroo.task.domain.TaskVO;
import com.haroo.task.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/haroo/task")
public class TaskController {

    private final TaskService taskService;

    @Autowired
    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping
    public ModelAndView getTaskPage(HttpSession httpSession) {

        ModelAndView modelAndView = new ModelAndView();

        //현재 사원번호 설정
        int emNo = ((EmployeeVO) httpSession.getAttribute("employee")).getEm_no();

        try {
            List<TaskVO> taskVOList = taskService.getTaskListService(emNo);
            String json = new Gson().toJson(taskVOList);

            //console test
            System.out.println(json);

            modelAndView.setViewName("/task/task_form");
            modelAndView.addObject("json", json);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return modelAndView;
    }


    @PostMapping(value = "/new",
            consumes = "application/json; charset=utf-8")
    public ResponseEntity<String> insertTask(@RequestBody TaskVO taskVO) {

        int insertResult = taskService.insertTaskService(taskVO);

        //success를 보내면 ajax에서 controller 다시 부를 거
        return insertResult == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
