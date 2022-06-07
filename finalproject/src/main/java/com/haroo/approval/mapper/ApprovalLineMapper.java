package com.haroo.approval.mapper;

import java.util.List;

import com.haroo.approval.domain.ApprovalLineVO;
import com.haroo.approval.domain.EmpVO;

public interface ApprovalLineMapper {

  public String selectTest();
  public int insert(ApprovalLineVO apLine); // 결재선 저장
  public List<EmpVO> getEmpList(); // 결재선택 사원목록
  public List<ApprovalLineVO> read(int apNo); // 결재선 목록 
  public int sign(ApprovalLineVO apLine); // 결재하기
}
