package com.haroo.login.service;

import com.haroo.login.domain.EmployeeVO;
import com.haroo.login.mapper.EmployeeMapper;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*.xml")
@Slf4j
public class EmployeeServiceImplTest {

    @Setter(onMethod_ = @Autowired)
    private EmployeeMapper employeeMapper;


    //Test OK
    @Test
    public void loginEmployeeServiceTest() {
        //given
        EmployeeVO employeeVO = new EmployeeVO();

        //when
        employeeVO.setEmNo(19362300);
        employeeVO.setEmPw("1");

        employeeVO = employeeMapper.loginEmployee(employeeVO);

        //then
        log.info("Current Join Employee = {}", employeeVO);
    }
}