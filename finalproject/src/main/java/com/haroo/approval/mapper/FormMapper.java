package com.haroo.approval.mapper;

import java.util.List;

import com.haroo.approval.domain.FormVO;

public interface FormMapper {

  public int insert(FormVO form);
  public FormVO read(int foNo);
  public List<FormVO> getList();
  public int modify(FormVO form);
}
