package com.haroo.mypage.service;

import com.haroo.login.domain.EmployeeVO;
import com.haroo.mypage.domain.MyPageUserDTO;
import com.haroo.mypage.mapper.MyPageMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService{

    private MyPageMapper myPageMapper;

    @Override
    public int updateEmployeeService(MyPageUserDTO myPageUserDTO) {
        return myPageMapper.updateEmployee(myPageUserDTO);
    }
}
