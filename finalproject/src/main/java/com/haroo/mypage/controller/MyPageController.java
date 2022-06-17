package com.haroo.mypage.controller;

import com.haroo.login.domain.EmployeeVO;
import com.haroo.mypage.domain.MyPageUserDTO;
import com.haroo.mypage.service.MyPageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/mypage")
@Slf4j
public class MyPageController {

    private final MyPageService myPageService;

    @Autowired
    public MyPageController(MyPageService myPageService) {
        this.myPageService = myPageService;
    }

    @GetMapping("")
    public ModelAndView getMyPage() {

        ModelAndView modelAndView = new ModelAndView("mypage/mypage_form");

        return modelAndView;
    }

    @PatchMapping("/update-information")
    public ResponseEntity<MyPageUserDTO> updateMyInfo(@RequestBody MyPageUserDTO myPageUserDTO,
                                                      HttpSession httpSession) {

        try{
            myPageService.updateEmployeeService(myPageUserDTO);

            ((EmployeeVO)httpSession.getAttribute("employee")).setEmPhone(myPageUserDTO.getEmPhone());
            ((EmployeeVO)httpSession.getAttribute("employee")).setEmEmail(myPageUserDTO.getEmEmail());
            ((EmployeeVO)httpSession.getAttribute("employee")).setEmPw(myPageUserDTO.getEmPw());

            return new ResponseEntity<>(myPageUserDTO, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
