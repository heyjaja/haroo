package com.haroo.approval.controller;

import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.haroo.approval.domain.ApprovalAttachVO;
import com.haroo.approval.domain.ApprovalLineVO;
import com.haroo.approval.domain.ApprovalVO;
import com.haroo.approval.domain.Criteria;
import com.haroo.approval.domain.EmpVO;
import com.haroo.approval.domain.FormVO;
import com.haroo.approval.domain.PageDTO;
import com.haroo.approval.service.ApprovalService;
import com.haroo.login.domain.EmployeeVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/haroo/approval")
@Log4j
public class ApprovalController {
  
  private final String uploadFolder = "/Users/macbook/Documents/236/project/upload";

  @Autowired
  ApprovalService service;
  
  @GetMapping
  public String main() { // 메인
    log.info("approval main..........");
    
//    EmpVO employeeVO = new EmpVO();
//    employeeVO.setEmNo(45424411);
//    employeeVO.setEmName("백민주");
//    
//    session.setAttribute("employeeVO", employeeVO);
    return "/approval/main";
  }
  
  @GetMapping("/forms")
  public String forms(Model model) { // 양식 목록
    log.info("form list.............");
    
    List<FormVO> list = service.getFormList();
    
    model.addAttribute("forms", list);
    
    return "/approval/forms";
  }
  
  @GetMapping("/report/{foNo}")
  public String getReportForm(@PathVariable("foNo") int foNo, Model model) { // 양식 선택
    
    log.info("form..................");
    String formName="draft-form";
    
    if(foNo == 2) {
      formName="expense-form";
    } else if(foNo == 3) {
      formName="leave-form";
    }
    
      FormVO form = service.readForm(foNo);
      
      model.addAttribute("form", form);
    
    return "/approval/"+formName;
  }
  
  @PostMapping("/report/{foNo}")
  public String postReportForm(ApprovalVO approval) { // 상신하기
    
    log.info("==========================");
    log.info("resister: " + approval);
    
    
    service.insertApproval(approval);
    
    
    return "redirect:/haroo/approval";
  }
  
  @GetMapping("/form")
  public String getInsertForm() {
    return "/approval/form";
  }
  
  @PostMapping("/form")
  public String insertForm(FormVO form) {
    
    log.info("insert form..................");
    
    service.insertForm(form);
    
    return "redirect:/haroo/approval/forms";
  }
  
  @GetMapping("/form/{foNo}")
  public String getForm(@PathVariable("foNo") int foNo, Model model) {
    
    log.info("get form......");
    
    FormVO form = service.readForm(foNo);
    
    model.addAttribute("form", form);
    
    return "/approval/form";
  }
 
  @PostMapping("/form/{foNo}")
  public String postForm(FormVO form) {
    
    log.info("modify form...");
    
    service.modifyForm(form);
    
    return "redirect:/haroo/approval/forms";
  }
  
  @GetMapping("/process")
  public String processList(HttpSession session, Criteria cri, Model model) { // 상신-진행
    
    log.info("get Process List");
    
    int emNo = ((EmployeeVO) session.getAttribute("employee")).getEm_no();
    int status = 0;
    
    model.addAttribute("list", service.getReportList(cri, emNo, status));
    
    int total = service.getReportTotal(cri, emNo, status);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    
    return "/approval/approval-list";
  }
  
  @GetMapping("/done")
  public String doneList(HttpSession session, Criteria cri, Integer status, Model model) { // 상신-완료
    
    log.info("get done List");
    
    int emNo = ((EmployeeVO) session.getAttribute("employee")).getEm_no();
    
    if(status == null) {
      status = 9;
    }
    
    model.addAttribute("list", service.getReportList(cri, emNo, status));
    
    int total = service.getReportTotal(cri, emNo, status);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    model.addAttribute("status", status);
    
    return "/approval/approval-list";
  }
  
  @GetMapping("/takeback")
  public String takebacksList(HttpSession session, Criteria cri, Model model) { // 상신-취소
    
    log.info("get takeback List");
    
    int emNo = ((EmployeeVO) session.getAttribute("employee")).getEm_no();
    int status = -1;
    
    model.addAttribute("list", service.getReportList(cri, emNo, status));
    
    int total = service.getReportTotal(cri, emNo, status);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    
    return "/approval/approval-list";
  }
  
  @GetMapping({ "/process/{apNo}", "/done/{apNo}", "/takeback/{apNo}", "/all/{apNo}" })
  public String getReport(@PathVariable("apNo") int apNo, Model model) {
    
    log.info("get Report");
    
    ApprovalVO approval = service.readApproval(apNo);
    
    model.addAttribute("ap", approval);
    
    log.info("read approval: " + approval);
    
    return "/approval/approval-detail";
  }
  
  @GetMapping("/wait")
  public String waitList(HttpSession session, Criteria cri, Model model) { // 수신-대기
    
    log.info("get wait list");
    
    int emNo = ((EmployeeVO) session.getAttribute("employee")).getEm_no();
    int status = 0;
    
    model.addAttribute("list", service.getReceiveList(cri, emNo, status));
    
    int total = service.getReceiveTotal(cri, emNo, status);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    
    return "/approval/receive-list";
    
  }
  
  @GetMapping("/sign")
  public String signList(HttpSession session, Criteria cri, Model model) { // 수신-완료
    
    log.info("get wait list");
    
    int emNo = ((EmployeeVO) session.getAttribute("employee")).getEm_no();
    int status = 1;
    
    model.addAttribute("list", service.getReceiveList(cri, emNo, status));
    
    int total = service.getReceiveTotal(cri, emNo, status);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total)); 
    
    return "/approval/receive-list";
    
  }
  
  @GetMapping({"/wait/{apNo}", "/sign/{apNo}"})
  public String getReceive(@PathVariable("apNo") int apNo, Model model) {
    
    log.info("get Receive");
    
    ApprovalVO approval = service.readApproval(apNo);
    
    model.addAttribute("ap", approval);
    
    return "/approval/receive-detail";
  }
  
  
  @GetMapping("/all")
  public String allList(Criteria cri, Model model) { // 전체 문서
    
    log.info("get all list");
    
    model.addAttribute("list", service.getAllList(cri));
    
    int total = service.getAllTotal(cri);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total)); 
    
    return "/approval/approval-list";
  }
  
  @PostMapping("/process/{apNo}")
  public String postProcess(int apNo, int foNo) {
    
    log.info("takeback: " +apNo);
    
    List<ApprovalAttachVO> attachList = service.getAttachList(apNo);
    
    if(service.takeback(apNo, foNo)) {
      deleteFiles(attachList);
    };
    
    return "redirect:/haroo/approval/process";
  }
  
  @PostMapping("/wait/{apNo}")
  public String postWait(ApprovalLineVO apLine, int foNo) {
    
    log.info("sign: " +apLine.getApNo());
    
    List<ApprovalAttachVO> attachList = service.getAttachList(apLine.getApNo());
    
    if(service.sign(apLine, foNo)) {
      deleteFiles(attachList);
    }
    
    return "redirect:/haroo/approval/wait";
  }
  
  @GetMapping("/re/{apNo}")
  public String getRe(@PathVariable("apNo") int apNo, Model model) {
  
    log.info("rereport: " + apNo);
    
    ApprovalVO approval = service.readApproval(apNo);
    
    model.addAttribute("ap", approval);
    
    return "/approval/draft-form";
  }
  
  
  @GetMapping("/line")
  public String getEmployeeList(Model model) { // 결재자 목록 창
    Map<String, List<EmpVO>> map = service.getEmpList();
    
    model.addAttribute("map", map);
    
    return "/approval/line";
  }
  
  
  // 첨부파일 처리
  // upload
  @PostMapping(value = "/file", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  @ResponseBody
  public ResponseEntity<List<ApprovalAttachVO>> uploadFile(MultipartFile[] uploadFile) {
    
    log.info("upload file ajax..............");
    
    List<ApprovalAttachVO> list = new ArrayList<>();
    
    String uploadFolderPath = getFolder();
    
    // 폴더 생성
    File uploadPath = new File(uploadFolder, uploadFolderPath);
    log.info("upload path: " + uploadPath);
    
    if(uploadPath.exists() == false) { // 년/월/일 폴더 경로가 존재하지 않을 때
      uploadPath.mkdirs(); // yyyy/MM/dd 폴더 생성
    }
    
    for(MultipartFile multipartFile : uploadFile) {
      
      ApprovalAttachVO attach = new ApprovalAttachVO();
      
      log.info("----------------------------------------");
      log.info("upload File name: " + multipartFile.getOriginalFilename());
      log.info("upload File size: " + multipartFile.getSize());
      
      String uploadFileName = multipartFile.getOriginalFilename();
      
      attach.setFname(uploadFileName);
      
      UUID uuid = UUID.randomUUID(); // uuid 생성
      
      uploadFileName = uuid.toString() + "_" + uploadFileName; // uuid_fileName
      
      try {
        File saveFile = new File(uploadPath, uploadFileName);
        multipartFile.transferTo(saveFile);
        
        attach.setAaNo(uuid.toString());
        attach.setPath(uploadFolderPath);
        
        list.add(attach);
        
      } catch (Exception e) {
        log.error(e.getMessage());
      }
    }// end for
    
    return new ResponseEntity<List<ApprovalAttachVO>>(list, HttpStatus.OK);
  }
  
  // download
  @GetMapping(value = "/file", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
  @ResponseBody
  public ResponseEntity<Resource> downloadFile(String fname) {
    
    log.info("download file: " + fname);
    
    FileSystemResource resource = new FileSystemResource(uploadFolder + "/" + fname);
    
    log.info("resource" + resource);
    
    if(resource.exists() == false) {
      return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
    }
    
    String resourceName = resource.getFilename();
    
    // remove uuid
    String resourceOriginalName = 
        resourceName.substring(resourceName.indexOf("_") + 1);
    
    HttpHeaders headers = new HttpHeaders();
    
    try {
      
      String downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
      
      log.info("downloadName: " + downloadName);
      
      headers.add("Content-Disposition", "attachment; filename=" + downloadName);
      
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
  }
  
  //delete
  @PostMapping("/file/delete")
  @ResponseBody
  public ResponseEntity<String> deleteFile(String fname) {
    
    log.info("delete file: " + fname);
    
    File file;
    
    try {
      file = new File(uploadFolder + "/" + URLDecoder.decode(fname, "UTF-8"));
      
      file.delete();
      
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
    }
    
    return new ResponseEntity<String>("deleted", HttpStatus.OK);
  }
  
  private String getFolder() { // 년/월/일 폴더 경로 문자열 만들기
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    Date date = new Date();
    
    String str = sdf.format(date);
    
    return str.replace("-", File.separator);
  }
  
  private void deleteFiles(List<ApprovalAttachVO> attachList) {
    
    if(attachList == null || attachList.size() == 0) {
      return;
    }
    
    log.info("delete attach files");
    log.info("delete: "+attachList);
    
    attachList.forEach(attach -> {
      try {
        Path file = Paths.get(uploadFolder+"/"+attach.getPath()+"/"+attach.getAaNo()+"_"+attach.getFname());
        
        Files.deleteIfExists(file);
        
      } catch (Exception e) {
        e.printStackTrace();
      }
    });//end for each
  }
  
  
}
