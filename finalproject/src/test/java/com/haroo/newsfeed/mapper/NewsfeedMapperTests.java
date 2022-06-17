package com.haroo.newsfeed.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.haroo.newsfeed.domain.NewsfeedVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NewsfeedMapperTests {
  
  @Autowired
  NewsfeedMapper mapper;

  @Test
  public void testInsert() {
    NewsfeedVO news = new NewsfeedVO();
    
    news.setContent("오늘도 화이팅!");
    news.setWriter("백사원");
    news.setEmNo(45424411);

    mapper.insert(news);
  }
  
  @Test
  public void testRemove() {
    
    mapper.remove(1);
  }
  
  @Test
  public void testGetList() {
    mapper.getList();
  }

}
