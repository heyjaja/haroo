package com.haroo.approval.mapper;

import java.util.List;

import com.haroo.approval.domain.ApprovalAttachVO;

public interface ApprovalAttachMapper {

  public int insert(ApprovalAttachVO attach);
  public int delete(int aaNo);
  public List<ApprovalAttachVO> findByApNo(int apNo);
  public int deleteAll(int apNo);
  
}
