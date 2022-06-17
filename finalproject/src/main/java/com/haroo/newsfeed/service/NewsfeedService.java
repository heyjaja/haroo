package com.haroo.newsfeed.service;

import java.util.List;

import com.haroo.newsfeed.domain.NewsfeedVO;

public interface NewsfeedService {

  public int insert(NewsfeedVO newsfeed);
  
  public int remove(int neNo);
  
  public List<NewsfeedVO> getList();
  
  public List<NewsfeedVO> getListPlus(Integer page);
}
