package com.haroo.approval.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ExpenseListVO implements Serializable {
  
  private int elNo; // 품의목록번호
  private int apNo; // 결재번호
  private String elItem; // 품목
  private int elQuantity; // 수량
  private int elPrice; // 가격
  private String elCost; // 소계
  private String elTotal; // 총금액
  
}
