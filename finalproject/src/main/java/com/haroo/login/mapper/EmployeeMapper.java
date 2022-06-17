package com.haroo.login.mapper;

import com.haroo.login.domain.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeMapper {
    EmployeeVO loginEmployee(EmployeeVO employeeVO);
}