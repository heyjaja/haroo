package com.haroo.approval.service;

import java.util.List;

import com.haroo.approval.domain.ApprovalAttachVO;
import com.haroo.approval.domain.ApprovalLineVO;
import com.haroo.approval.domain.ApprovalVO;
import com.haroo.approval.domain.Criteria;
import com.haroo.approval.domain.EmpVO;

public interface ApprovalService {

  public void insertApproval(ApprovalVO approval); // 상신하기
  
  public List<ApprovalVO> getReportList(int emNo, int status); // 상신문서 목록
  
  public List<ApprovalVO> getReportList(Criteria cri, int emNo, int status); // 상신문서 페이징
  
  public int getReportTotal(Criteria cri, int emNo, int status); // 상신문서 데이터 개수
  
  public List<ApprovalVO> getReceiveList(int emNo, int status); // 수신문서
  
  public List<ApprovalVO> getReceiveList(Criteria cri, int emNo, int status); // 수신문서 페이징
  
  public int getReceiveTotal(Criteria cri, int emNo, int status); // 수신문서 데이터 개수
  
  public List<ApprovalVO> getAllList(); // 전체문서
  
  public List<ApprovalVO> getAllList(Criteria cri); // 전체문서 페이징
  
  public int getAllTotal(Criteria cri); // 전체문서 데이터 개수 
  
  public ApprovalVO readApproval(int apNo); // 결재문서 읽기
  
  public boolean sign(ApprovalLineVO apLine, int foNo); // 결재하기
  
  public boolean takeback(int apNo, int foNo); // 상신취소
  
  public List<ApprovalAttachVO> getAttachList(int apNo); // 첨부파일목록
  
  public List<EmpVO> getEmpList(); // 결재선 목록
  
}