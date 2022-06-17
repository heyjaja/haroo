package com.haroo.approval.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class FormVO implements Serializable{

  private int foNo; // 번호
  private String foKind; // 종류
  private String foTitle; // 이름
  private String foContent; // 내용
  private String foInfo; // 설명
  private int foStatus; // 활성화
  
}
