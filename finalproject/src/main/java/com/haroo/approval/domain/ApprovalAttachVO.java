package com.haroo.approval.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ApprovalAttachVO implements Serializable {

  private String aaNo; // 파일번호: uuid
  private String path; // 경로
  private String fname; // 파일명
  private int apNo; // 전자결재 번호
}
