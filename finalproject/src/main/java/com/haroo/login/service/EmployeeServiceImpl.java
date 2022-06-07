package com.haroo.login.service;

import com.haroo.login.domain.EmployeeVO;
import com.haroo.login.mapper.EmployeeMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {

    private EmployeeMapper employeeMapper;

    @Override
    public EmployeeVO loginEmployeeService(EmployeeVO employeeVO) {
        return employeeMapper.loginEmployee(employeeVO);
    }
}
