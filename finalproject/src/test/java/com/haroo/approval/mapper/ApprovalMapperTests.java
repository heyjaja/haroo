package com.haroo.approval.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.haroo.approval.domain.ApprovalLineVO;
import com.haroo.approval.domain.ApprovalVO;
import com.haroo.approval.domain.Criteria;
import com.haroo.approval.domain.ExpenseListVO;
import com.haroo.approval.domain.LeaveVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ApprovalMapperTests {
  
  @Autowired
  private ApprovalMapper mapper;
  
  @Autowired
  private ApprovalLineMapper apLineMapper;
  
  @Autowired
  private LeaveMapper leaveMapper;
  
  @Autowired
  private ExpenseListMapper elMapper;

  @Test
  public void test() {

    log.info(mapper.getClass().getName());
    log.info(mapper.selectTest());
  }
  
  @Test
  public void testInsert() { // 등록
    
    ApprovalVO approval = new ApprovalVO();
    approval.setFoNo(1);
    approval.setEmNo(45424411);
    approval.setApTitle("test approval leave");
    approval.setApContent("test approval leave content");
    approval.setApPublic(1);
    
    log.info("INSERT COUNT: "+mapper.insert(approval));
    
    log.info(approval);
    
    ApprovalLineVO apLine = new ApprovalLineVO();
    
    apLine.setApNo(approval.getApNo());
    
    for(int i=1; i<=3; i++) {
      apLine.setAlNo(45424411 - i);
      apLine.setAlOrder(i);
      
      log.info(apLine);
      log.info(apLineMapper.insert(apLine));
    }
    
  }
  
  @Test
  public void testInsertLeave() { // 등록
    
    ApprovalVO approval = new ApprovalVO();
    approval.setFoNo(3);
    approval.setEmNo(45424411);
    approval.setApTitle("test approval leave");
    approval.setApContent("test approval leave content");
    approval.setApPublic(1);
    
    log.info("INSERT COUNT: "+mapper.insert(approval));

    log.info(approval);
    
    ApprovalLineVO apLine = new ApprovalLineVO();
    
    apLine.setApNo(approval.getApNo());
    
    for(int i=1; i<=3; i++) {
      apLine.setAlNo(45424411 - i);
      apLine.setAlOrder(i);
      
      log.info(apLine);
      log.info(apLineMapper.insert(apLine));
    }
    
    LeaveVO leave = new LeaveVO();
    
    leave.setApNo(approval.getApNo());
    leave.setEmNo(approval.getEmNo());
    leave.setFoNo(3);
    leave.setLeTitle(approval.getApTitle());
    leave.setLeKind(1);
    leave.setLeStart("2022-06-07");
    leave.setLeEnd("2022-06-08");
    
    log.info(leave);
    log.info("INSERT LEAVE:" + leaveMapper.insert(leave));
    
    
    
    
  }
  
  @Test
  public void testInsertExpense() { // 등록
    
    ApprovalVO approval = new ApprovalVO();
    approval.setFoNo(2);
    approval.setEmNo(45424411);     
    approval.setApTitle("test approval expense");
    approval.setApContent("test approval expense content");
    approval.setApPublic(1);
    
    log.info("INSERT COUNT: "+mapper.insert(approval));
    
    log.info(approval);
    
    ApprovalLineVO apLine = new ApprovalLineVO();
    
    apLine.setApNo(approval.getApNo());
    
    for(int i=1; i<=3; i++) {
      apLine.setAlNo(45424411 - i);
      apLine.setAlOrder(i);
      
      log.info(apLine);
      log.info(apLineMapper.insert(apLine));
    }
    
    List<ExpenseListVO> list = new ArrayList<>();
    
    ExpenseListVO expense = new ExpenseListVO();
    
    expense.setApNo(approval.getApNo());
    
    
    
    for(int i=1; i<=3; i++) {
      int quantity = i;
      int price = i+1000;
      int cost = quantity * price;
      
      expense.setElNo(i);
      expense.setElItem("품목"+i);
      expense.setElQuantity(quantity);
      expense.setElPrice(price);
      expense.setElCost(""+cost);
      expense.setElTotal("6014");
      
      log.info(expense);
      elMapper.insert(expense);
      
    }

    
  }
  
  @Test
  public void testReportList() {
    
    log.info("get process list");
    
    List<ApprovalVO> list =  mapper.getReportList(45424411, 9);
    
    list.forEach(ap -> log.info(ap));
  }
  
  @Test
  public void testRead() {
    
    log.info("get Leave");
    
    LeaveVO leave = leaveMapper.read(187);
    
    log.info(leave);
  }
  
  @Test
  public void testPaging() {
    log.info("get list with paging");
    
    Criteria cri = new Criteria(3, 10);
    
    List<ApprovalVO> list = mapper.getReportListWithPaging(cri, 45424411, 0);
    
    list.forEach(ap -> log.info(ap));
  }
  
}
