package com.haroo.approval.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class EmpVO implements Serializable{

  private int emNo; // 사원번호
  private String emName; // 사원이름 
  private String poName; // 직책이름
  private String deName; // 부서이름
}
