package com.haroo.approval.mapper;

import com.haroo.approval.domain.LeaveVO;

public interface LeaveMapper {

  public int insert(LeaveVO leave);
  public LeaveVO read(int apNo);
}
