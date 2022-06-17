package com.haroo.newsfeed.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class NewsfeedVO implements Serializable {

  private int neNo;
  private String writer;
  private String content;
  private Date regdate;
  private int emNo;
}
