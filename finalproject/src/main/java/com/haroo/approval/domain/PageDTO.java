package com.haroo.approval.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
  
  private int start;
  private int end;
  private boolean prev, next;
  
  private int total;
  private Criteria cri;

  public PageDTO(Criteria cri, int total) {
    this.cri = cri;
    this.total = total;
    
    this.end = (int) (Math.ceil(cri.getPage() / 5.0)) * 5;
    this.start = this.end - 4;
    
    int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
    
    if(realEnd < this.end) {
      this.end = realEnd;
    }
    
    this.prev = this.start > 1;
    this.next = this.end < realEnd;
  }
}
