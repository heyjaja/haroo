package com.haroo.approval.service;

import java.util.List;

import com.haroo.approval.domain.ApprovalVO;
import com.haroo.approval.domain.EmpVO;

public interface ApprovalService {

  public void insertApproval(ApprovalVO approval);
  public List<ApprovalVO> getReportList(int emNo, int status);
  public List<ApprovalVO> getReceiveList(int emNo, int status);
  public List<ApprovalVO> getAllList();
  public ApprovalVO readApproval(int apNo);
  public List<EmpVO> getEmpList();
  
}
