package com.haroo.approval.mapper;

import org.apache.ibatis.annotations.Param;

import com.haroo.approval.domain.LeaveVO;

public interface LeaveMapper {

  public int insert(LeaveVO leave);
  public LeaveVO read(int apNo);
  public int updateStatus(@Param("apNo") int apNo, @Param("status") int status);
  public int takeback(int apNo);
}
