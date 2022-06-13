package com.haroo.approval.service;

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
import com.haroo.approval.domain.EmpVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ApprovalServiceTests {
  
  @Autowired
  ApprovalService service;

  @Test
  public void testInsert() { // 기안서 테스트
    
    ApprovalVO approval = new ApprovalVO();
    approval.setFoNo(1);
    approval.setEmNo(45424411);
    approval.setApTitle("test approval service test");
    approval.setApContent("test approval service test content");
    approval.setApPublic(1);

    List<ApprovalLineVO> list = new ArrayList<ApprovalLineVO>();
    
    for(int i=1; i<=3; i++) {
      
      ApprovalLineVO apLine = new ApprovalLineVO();
      
      apLine.setApNo(approval.getApNo());
      apLine.setAlNo(45424411 - i);
      apLine.setAlOrder(i);
      
      list.add(apLine);
      
      log.info(apLine);
    }
    
    approval.setLine(list);
    
    log.info(approval);
    
    service.insertApproval(approval);
  }
  
  @Test
  public void testInsertExpense() { // 품의서 테스트
    
    ApprovalVO approval = new ApprovalVO();
    approval.setFoNo(2);
    approval.setEmNo(45424411);
    approval.setApTitle("test approval service expense");
    approval.setApContent("test approval service expense content");
    approval.setApPublic(1);
    
    log.info(approval);

    List<ApprovalLineVO> list = new ArrayList<ApprovalLineVO>();
    
    for(int i=1; i<=3; i++) {
      
      ApprovalLineVO apLine = new ApprovalLineVO();
      
      apLine.setApNo(approval.getApNo());
      apLine.setAlNo(45424411 - i);
      apLine.setAlOrder(i);
      
      list.add(apLine);
      
      log.info(apLine);
    }
    
    approval.setLine(list);
    
    List<ExpenseListVO> exList = new ArrayList<>();
    
    
    for(int i=1; i<=3; i++) {
      int quantity = i;
      int price = i+1000;
      int cost = quantity * price;
      
      ExpenseListVO expense = new ExpenseListVO();
      
      expense.setApNo(approval.getApNo());
      
      expense.setElNo(i);
      expense.setElItem("품목"+i);
      expense.setElQuantity(quantity);
      expense.setElPrice(price);
      expense.setElCost(""+cost);
      expense.setElTotal("6014");
      
      exList.add(expense);
      
      log.info(expense);
      
    }
    
    approval.setExpense(exList);
    
    log.info(approval);
    
    service.insertApproval(approval);
  }
  
  @Test
  public void testInsertLeave() { // 휴가신청서 테스트
    
    ApprovalVO approval = new ApprovalVO();
    approval.setFoNo(3);
    approval.setEmNo(45424411);
    approval.setApTitle("test approval service leave test");
    approval.setApContent("test approval service leave test content");
    approval.setApPublic(1);

    List<ApprovalLineVO> list = new ArrayList<ApprovalLineVO>();
    
    for(int i=1; i<=3; i++) {
      
      ApprovalLineVO apLine = new ApprovalLineVO();
      
      apLine.setApNo(approval.getApNo());
      apLine.setAlNo(45424411 - i);
      apLine.setAlOrder(i);
      
      list.add(apLine);
      
      log.info(apLine);
    }
    
    approval.setLine(list);
    
    LeaveVO leave = new LeaveVO();
    
    leave.setApNo(approval.getApNo());
    leave.setEmNo(approval.getEmNo());
    leave.setFoNo(3);
    leave.setLeTitle(approval.getApTitle());
    leave.setLeKind(1);
    leave.setLeStart("2022-06-07");
    leave.setLeEnd("2022-06-08");
    
    log.info(leave);
    
    approval.setLeave(leave);
    
    log.info(approval);
    
    service.insertApproval(approval);
  }
  
  @Test
  public void testTxInsert() {
    ApprovalVO approval = new ApprovalVO();
    approval.setFoNo(1);
    approval.setEmNo(45424411);
    approval.setApTitle("test approval service tx test");
    approval.setApContent("test approval service leave tx content");
    approval.setApPublic(1);
    
    ApprovalLineVO apLine = new ApprovalLineVO();
    
    apLine.setApNo(171);
    apLine.setAlNo(4);
    apLine.setAlOrder(1);
    
    List<ApprovalLineVO> list = new ArrayList<ApprovalLineVO>();
    
    list.add(apLine);
    approval.setLine(list);
    
    log.info(apLine);
    
    service.insertApproval(approval);
    
  }
  
  @Test
  public void testAllList() {
    List<ApprovalVO> list = service.getAllList();
    
    list.forEach(ap -> log.info(ap));
  }
  
  @Test
  public void testRead() {
    ApprovalVO approval = service.readApproval(178);
    
    log.info(approval);
  }
  
  @Test
  public void testTakeback() {
    
    service.takeback(177, 3);
    service.takeback(176, 1);
  }
  
  
  @Test
  public void testGetEmpList() {
    List<EmpVO> list = new ArrayList<EmpVO>();
    list = service.getEmpList();
    
    list.forEach(emp -> log.info(emp));
  }
  
  @Test
  public void testGetPagingList() {
    
    log.info("get list with paging");
    
    Criteria cri = new Criteria(3, 10);
    
    List<ApprovalVO> list = service.getReportList(cri, 45424411, 0);
    
    list.forEach(ap -> log.info(ap));
  }
 
  

}
