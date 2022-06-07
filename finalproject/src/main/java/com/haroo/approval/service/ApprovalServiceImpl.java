package com.haroo.approval.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haroo.approval.domain.ApprovalLineVO;
import com.haroo.approval.domain.ApprovalVO;
import com.haroo.approval.domain.EmpVO;
import com.haroo.approval.domain.LeaveVO;
import com.haroo.approval.mapper.ApprovalLineMapper;
import com.haroo.approval.mapper.ApprovalMapper;
import com.haroo.approval.mapper.ExpenseListMapper;
import com.haroo.approval.mapper.LeaveMapper;
import com.haroo.controller.HomeController;

@Service
public class ApprovalServiceImpl implements ApprovalService {
  
  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  
  @Autowired
  private ApprovalMapper mapper;
  
  @Autowired
  private ApprovalLineMapper lineMapper;
  
  @Autowired
  private LeaveMapper leaveMapper;
  
  @Autowired
  private ExpenseListMapper expenseMapper;

  @Transactional
  @Override
  public void insertApproval(ApprovalVO approval) { // 상신
    
    logger.info("insert approval...............");
    
    mapper.insert(approval);
    
    int foNo = approval.getFoNo();
    
    int apNo = approval.getApNo();
    
    approval.getLine().forEach(line -> {
      line.setApNo(apNo);
      lineMapper.insert(line);
    });
    
    
    if(foNo == 2) { // 품의서
      
      approval.getExpense().forEach(ex -> {
        ex.setApNo(apNo);
        expenseMapper.insert(ex);
      });
      
    } else if(foNo == 3) { // 휴가신청서
      
      LeaveVO leave = approval.getLeave();
      leave.setApNo(apNo);
      leave.setFoNo(3);
      leave.setLeTitle(approval.getApTitle());
      
      leaveMapper.insert(leave);
    }
    
    
  }
  
  @Override
  public List<ApprovalVO> getReportList(int emNo, int status) { // 상신문서
    
    logger.info("get report list...............status: " + status);
    
    return mapper.getReportList(emNo, status);
  }

  @Override
  public List<ApprovalVO> getReceiveList(int emNo, int status) { // 수신문서
    
    logger.info("get receive list...............status: " + status);
    
    return mapper.getReceiveList(emNo, status);
  }
  
  @Override
  public List<ApprovalVO> getAllList() { // 전체문서
    
    logger.info("get All list...............");
    
    return mapper.getAllList();
  }
  
  @Override
  public ApprovalVO readApproval(int apNo) { // 읽기
    
    logger.info("read approval...............");
    
    ApprovalVO approval = mapper.read(apNo);
    approval.setLine(lineMapper.read(apNo));
    
    int foNo = approval.getFoNo();
    
    if(foNo == 2) {
      approval.setExpense(expenseMapper.read(apNo));
    } else if(foNo == 3) {
      approval.setLeave(leaveMapper.read(apNo));
    }
    
    
    return approval;
  }



  @Override
  public List<EmpVO> getEmpList() { // 사원목록
    
    logger.info("get employee list...............");
    
    return lineMapper.getEmpList();
  }

  @Transactional
  @Override
  public void sign(ApprovalLineVO apLine, int foNo) { // 결재하기
    
    logger.info("sign...............");
    
    lineMapper.sign(apLine);
    mapper.updateStatus(apLine);
    
    int apNo = apLine.getApNo();
    
    ApprovalVO approval = mapper.read(apNo);
    
    int status = approval.getApStatus();
    
    if(foNo == 3) {
      leaveMapper.updateStatus(apNo, status);
    }
    
    
  }

  @Transactional
  @Override
  public void takeback(int apNo, int foNo) { // 상신취소
    
    logger.info("takeback..............." + apNo);
    
    mapper.takeback(apNo);
    
    if(foNo == 3) {
      leaveMapper.takeback(apNo);
    }
    
  }



}
