package com.haroo.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haroo.approval.domain.ApprovalVO;

public interface ApprovalMapper {
  
  public String selectTest();
  public int insert(ApprovalVO approval); // 결재문서 저장
  public List<ApprovalVO> getReportList(@Param("emNo") int emNo, 
      @Param("status") int status); // 상신문서 목록
  public List<ApprovalVO> getReceiveList(@Param("emNo") int emNo, 
      @Param("status") int status); // 수신문서 목록
  public List<ApprovalVO> getAllList();
  public ApprovalVO read(int apNo); // 읽기
}
