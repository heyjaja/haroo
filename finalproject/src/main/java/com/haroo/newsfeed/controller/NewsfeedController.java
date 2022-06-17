package com.haroo.newsfeed.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.haroo.newsfeed.domain.NewsfeedVO;
import com.haroo.newsfeed.service.NewsfeedService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/newsfeed")
@Log4j
public class NewsfeedController {
  
  @Autowired
  NewsfeedService service;

  @GetMapping
  public ResponseEntity<List<NewsfeedVO>> getList() {
    return new ResponseEntity<List<NewsfeedVO>>(service.getList(), HttpStatus.OK);
  }
  
  @GetMapping("/{page}")
  public ResponseEntity<List<NewsfeedVO>> getListPlus(@PathVariable("page") Integer page) {
    return new ResponseEntity<List<NewsfeedVO>>(service.getListPlus(page), HttpStatus.OK);
  }
  
  @PostMapping
  public ResponseEntity<String> create(@RequestBody NewsfeedVO feed) {
    log.info("NewsfeedVO: "+feed);
    
    int result = service.insert(feed);
    
    return result == 1 
        ? new ResponseEntity<String>("등록 완료", HttpStatus.OK)
        : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
        
  }
 
  
  @DeleteMapping("/{neNo}")
  public ResponseEntity<String> remove(@PathVariable("neNo") Integer neNo) {
    log.info("remove newsfeed: "+neNo);
    
    int result = service.remove(neNo);
    
    return result == 1 
        ? new ResponseEntity<String>("삭제 완료", HttpStatus.OK)
        : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
  }
}
