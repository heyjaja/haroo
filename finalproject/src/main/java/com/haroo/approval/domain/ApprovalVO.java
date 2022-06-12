package com.haroo.approval.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ApprovalVO implements Serializable {
  private int apNo; // 전자결재번호
  private int foNo; // 양식번호
  private int emNo; // 사원번호
  private String apTitle; // 결재제목
  private String apContent; // 결재내용
  private String apDate; // 상신날짜
  private int apPublic; // 공개여부
  private int apStatus; // 결재상태
  
  private LeaveVO leave;
  private List<ExpenseListVO> expense;
  private List<ApprovalLineVO> line;
  private List<ApprovalAttachVO> attachList;
  
  private String emName;
  private String foKind;
  
  private String alStatus;
  
}
