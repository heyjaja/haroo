package com.haroo.mypage.mapper;

import com.haroo.login.domain.EmployeeVO;
import com.haroo.mypage.domain.MyPageUserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageMapper {
    //사원 마이페이지 서비스 로직
    int updateEmployee(MyPageUserDTO myPageUserDTO);
}
