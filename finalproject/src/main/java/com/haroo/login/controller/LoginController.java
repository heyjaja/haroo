package com.haroo.login.controller;

import com.haroo.login.domain.EmployeeVO;
import com.haroo.login.service.EmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/haroo")
@Slf4j
public class LoginController {

    private final EmployeeService employeeService;

    @Autowired
    public LoginController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/login")
    public ModelAndView doLogin(@ModelAttribute EmployeeVO employeeVO) {

        ModelAndView modelAndView = new ModelAndView("/login/login_form");

        return modelAndView;
    }

    @PostMapping("/main")
    public ModelAndView doMain(@ModelAttribute EmployeeVO employeeVO,
                               HttpSession httpSession) {

        ModelAndView modelAndView = new ModelAndView();

        employeeVO = employeeService.loginEmployeeService(employeeVO);

        //console test
        log.info("Join Employee = {}", employeeVO);

        if (employeeVO == null) modelAndView.setViewName("/login/login_form");
        else {
            httpSession.setAttribute("employee", employeeVO);
            modelAndView.setViewName("home");
        }

        return modelAndView;
    }
    
    @GetMapping("/main")
    public ModelAndView getMain(HttpSession httpSession) {
      
      ModelAndView modelAndView = new ModelAndView();
      
      EmployeeVO employeeVO = (EmployeeVO) httpSession.getAttribute("employee");

      if (employeeVO == null) modelAndView.setViewName("/login/login_form");
      else {
          httpSession.setAttribute("employee", employeeVO);
          modelAndView.setViewName("home");
      }

      return modelAndView;
      
    }
    
}


