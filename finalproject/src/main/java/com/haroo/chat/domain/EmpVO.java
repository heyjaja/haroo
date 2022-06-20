package com.haroo.chat.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EmpVO {

  private Long em_no; // 사원번호
  private String em_name; // 사원이름 
  private String po_name; // 직책이름
  private String de_name; // 부서이름
  private int de_no;//부서번호
//  private String em_ext;
//  private String em_phone;
//  private Date em_first;
//  private Date em_last;
//  private int au_no;
//  private String em_pw;
}
