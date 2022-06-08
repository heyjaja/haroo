package com.haroo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class LoginController {

    @GetMapping("/login")
    public String joinLogin() {
        return "index";
    }

    @PostMapping("/main")
    public String doMain() {
        return "login/login_example";
    }
}
