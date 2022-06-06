package com.haroo.approval.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class LeaveVO implements Serializable {

  private int apNo; // 결재번호
  private int foNo; // 양식번호
  private int emNo; // 사원번호
  private String leTitle; // 제목
  private int leKind; // 휴가종류
  private String leStart; // 휴가시작일
  private String leEnd; // 휴가종료일
  private String leDate; // 신청날짜
  private String leStatus; // 승인여부
  
  public int leDays;
  
}
