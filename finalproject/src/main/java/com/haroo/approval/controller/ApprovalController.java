package com.haroo.approval.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haroo.approval.domain.ApprovalLineVO;
import com.haroo.approval.domain.ApprovalVO;
import com.haroo.approval.domain.EmpVO;
import com.haroo.approval.service.ApprovalService;
import com.haroo.controller.HomeController;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
  
  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

  @Autowired
  ApprovalService service;
  
  @GetMapping("/main")
  public void main(HttpServletRequest request) { // 메인
    logger.info("approval main..........");
    
    HttpSession session = request.getSession();
    
    EmpVO employeeVO = new EmpVO();
    employeeVO.setEmNo(45424411);
    employeeVO.setEmName("백민주");
    
    session.setAttribute("employeeVO", employeeVO);
  }
  
  @GetMapping("/forms")
  public void forms() { // 양식 목록
    logger.info("form list.............");
  }
  
  @GetMapping("/form/{foNo}")
  public String getFormList(@PathVariable("foNo") int foNo) { // 양식 선택
    
    logger.info("form..................");
    String formName="draft-form";
    
    if(foNo == 2) {
      formName="expense-form";
    } else if(foNo == 3) {
      formName="leave-form";
    }
    
    return "/approval/"+formName;
  }
  
  @PostMapping("/form/{foNo}")
  public String postForm(ApprovalVO approval, @PathVariable("foNo") int foNo) { // 상신하기
    
    approval.setFoNo(foNo);
    
    logger.info("==========================");
    logger.info("resister: " + approval);
    
    
    service.insertApproval(approval);
    
    
    return "redirect:/approval/main";
  }
  
  @GetMapping("/process")
  public String processList(Model model) { // 상신-진행
    
    logger.info("get Process List");
    
    int emNo = 45424411;
    int status = 0;
    
    model.addAttribute("list", service.getReportList(emNo, status));
    
    return "/approval/approval-list";
  }
  
  @GetMapping("/done")
  public String doneList(Model model) { // 상신-완료
    
    logger.info("get done List");
    
    int emNo = 45424411;
    int status = 9;
    
    model.addAttribute("list", service.getReportList(emNo, status));
    
    return "/approval/approval-list";
  }
  
  @GetMapping("/takeback")
  public String takebacksList(Model model) { // 상신-취소
    
    logger.info("get takeback List");
    
    int emNo = 45424411;
    int status = -1;
    
    model.addAttribute("list", service.getReportList(emNo, status));
    
    return "/approval/approval-list";
  }
  
  @GetMapping({ "/process/{apNo}", "/done/{apNo}", "/takeback/{apNo}", "/all/{apNo}" })
  public String getReport(@PathVariable("apNo") int apNo, Model model) {
    
    logger.info("get Report");
    
    ApprovalVO approval = service.readApproval(apNo);
    
    model.addAttribute("ap", approval);
    
    return "/approval/approval-detail";
  }
  
  @GetMapping("/wait")
  public String waitList(Model model) { // 수신-대기
    
    logger.info("get wait list");
    
    int emNo = 45424411;
    int status = 0;
    
    model.addAttribute("list", service.getReceiveList(emNo, status));
    
    return "/approval/receive-list";
    
  }
  
  @GetMapping("/sign")
  public String signList(Model model) { // 수신-완료
    
    logger.info("get wait list");
    
    int emNo = 45424411;
    int status = 1;
    
    model.addAttribute("list", service.getReceiveList(emNo, status));
    
    return "/approval/receive-list";
    
  }
  
  @GetMapping({"/wait/{apNo}", "/sign/{apNo}"})
  public String getReceive(@PathVariable("apNo") int apNo, Model model) {
    
    logger.info("get Receive");
    
    ApprovalVO approval = service.readApproval(apNo);
    
    model.addAttribute("ap", approval);
    
    return "/approval/receive-detail";
  }
  
  
  @GetMapping("/all")
  public String allList(Model model) { // 전체 문서
    
    logger.info("get all list");
    
    model.addAttribute("list", service.getAllList());
    
    return "/approval/approval-list";
  }
  
  @PostMapping("/process/{apNo}")
  public String postProcess(int apNo, int foNo) {
    
    logger.info("takeback: " +apNo);
    
    service.takeback(apNo, foNo);
    
    return "redirect:/approval/process";
  }
  
  @PostMapping("/wait/{apNo}")
  public String postWait(ApprovalLineVO apLine, int foNo) {
    
    logger.info("sign: " +apLine.getApNo());
    
    service.sign(apLine, foNo);
    
    return "redirect:/approval/wait";
  }
  
  
  @GetMapping("/line")
  public void getEmployeeList(Model model) { // 결재자 목록 창
    List<EmpVO> list = service.getEmpList();
    
    model.addAttribute("list", list);
  }
}
