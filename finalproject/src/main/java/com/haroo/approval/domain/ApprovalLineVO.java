package com.haroo.approval.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ApprovalLineVO implements Serializable {

  private int apNo; // 전자결재번호
  private int alNo; // 결재권자번호
  private int alOrder; // 결재순서
  private int alStatus; // 결재상태
  private String alDate; // 결재일
  private String alComment; // 결재의견
  
  private String emName;
  private String poName;
  private String deName;
}
