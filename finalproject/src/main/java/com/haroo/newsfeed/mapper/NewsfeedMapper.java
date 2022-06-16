package com.haroo.newsfeed.mapper;

import java.util.List;

import com.haroo.newsfeed.domain.NewsfeedVO;

public interface NewsfeedMapper {
  
  public int insert(NewsfeedVO newsfeed);
  public int remove(int neNo);
  public List<NewsfeedVO> getList();
  public List<NewsfeedVO> getListPlus(Integer page);
}
