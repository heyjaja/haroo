package com.haroo.newsfeed.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haroo.newsfeed.domain.NewsfeedVO;
import com.haroo.newsfeed.mapper.NewsfeedMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NewsfeedServiceImpl implements NewsfeedService {
  
  
  @Autowired
  NewsfeedMapper mapper;

  @Override
  public int insert(NewsfeedVO newsfeed) {
    log.info("insert newsfeed......" + newsfeed);
    
    return mapper.insert(newsfeed);
  }

  @Override
  public int remove(int neNo) {
    log.info("remove newsfeed......" + neNo);
    
    return mapper.remove(neNo);
  }

  @Override
  public List<NewsfeedVO> getList() {
    log.info("get newfeed list......");
    
    return mapper.getList();
  }

  @Override
  public List<NewsfeedVO> getListPlus(Integer page) {
    log.info("get newfeed list plus......"+page);
    
    return mapper.getListPlus(page);
  }

}
