package com.haroo.approval.mapper;

import java.util.List;

import com.haroo.approval.domain.ExpenseListVO;

public interface ExpenseListMapper {

  public int insert(ExpenseListVO expense);
  public List<ExpenseListVO> read(int apNo);
}
