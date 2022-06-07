package com.haroo.mypage.service;

import com.haroo.login.domain.EmployeeVO;
import com.haroo.mypage.domain.MyPageUserDTO;

public interface MyPageService {

    //사원 마이페이지 서비스 로직
    int updateEmployeeService(MyPageUserDTO myPageUserDTO);
}
