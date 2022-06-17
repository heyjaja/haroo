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
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.haroo.approval.domain.PageDTO;
import com.haroo.approval.service.ApprovalService;
import com.haroo.controller.HomeController;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
  
  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  private final String uploadFolder = "/Users/macbook/Documents/236/project/upload";

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
  public String processList(Criteria cri, Model model) { // 상신-진행
    
    logger.info("get Process List");
    
    int emNo = 45424411;
    int status = 0;
    
    model.addAttribute("list", service.getReportList(cri, emNo, status));
    
    int total = service.getReportTotal(cri, emNo, status);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    
    return "/approval/approval-list";
  }
  
  @GetMapping("/done")
  public String doneList(Criteria cri, Integer status, Model model) { // 상신-완료
    
    logger.info("get done List");
    
    int emNo = 45424411;
    
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
  public String takebacksList(Criteria cri, Model model) { // 상신-취소
    
    logger.info("get takeback List");
    
    int emNo = 45424411;
    int status = -1;
    
    model.addAttribute("list", service.getReportList(cri, emNo, status));
    
    int total = service.getReportTotal(cri, emNo, status);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    
    return "/approval/approval-list";
  }
  
  @GetMapping({ "/process/{apNo}", "/done/{apNo}", "/takeback/{apNo}", "/all/{apNo}" })
  public String getReport(@PathVariable("apNo") int apNo, Model model) {
    
    logger.info("get Report");
    
    ApprovalVO approval = service.readApproval(apNo);
    
    model.addAttribute("ap", approval);
    
    logger.info("read approval: " + approval);
    
    return "/approval/approval-detail";
  }
  
  @GetMapping("/wait")
  public String waitList(Criteria cri, Model model) { // 수신-대기
    
    logger.info("get wait list");
    
    int emNo = 45424411;
    int status = 0;
    
    model.addAttribute("list", service.getReceiveList(cri, emNo, status));
    
    int total = service.getReceiveTotal(cri, emNo, status);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    
    return "/approval/receive-list";
    
  }
  
  @GetMapping("/sign")
  public String signList(Criteria cri, Model model) { // 수신-완료
    
    logger.info("get wait list");
    
    int emNo = 45424411;
    int status = 1;
    
    model.addAttribute("list", service.getReceiveList(cri, emNo, status));
    
    int total = service.getReceiveTotal(cri, emNo, status);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total)); 
    
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
  public String allList(Criteria cri, Model model) { // 전체 문서
    
    logger.info("get all list");
    
    model.addAttribute("list", service.getAllList(cri));
    
    int total = service.getAllTotal(cri);
    
    model.addAttribute("pageMaker", new PageDTO(cri, total)); 
    
    return "/approval/approval-list";
  }
  
  @PostMapping("/process/{apNo}")
  public String postProcess(int apNo, int foNo) {
    
    logger.info("takeback: " +apNo);
    
    List<ApprovalAttachVO> attachList = service.getAttachList(apNo);
    
    if(service.takeback(apNo, foNo)) {
      deleteFiles(attachList);
    };
    
    return "redirect:/approval/process";
  }
  
  @PostMapping("/wait/{apNo}")
  public String postWait(ApprovalLineVO apLine, int foNo) {
    
    logger.info("sign: " +apLine.getApNo());
    
    List<ApprovalAttachVO> attachList = service.getAttachList(apLine.getApNo());
    
    if(service.sign(apLine, foNo)) {
      deleteFiles(attachList);
    }
    
    return "redirect:/approval/wait";
  }
  
  @GetMapping("/re/{apNo}")
  public String getRe(@PathVariable("apNo") int apNo, Model model) {
  
    logger.info("rereport: " + apNo);
    
    ApprovalVO approval = service.readApproval(apNo);
    
    model.addAttribute("ap", approval);
    
    return "/approval/draft-form";
  }
  
  
  @GetMapping("/line")
  public void getEmployeeList(Model model) { // 결재자 목록 창
    List<EmpVO> list = service.getEmpList();
    
    model.addAttribute("list", list);
  }
  
  
  // 첨부파일 처리
  // upload
  @PostMapping(value = "/file", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  @ResponseBody
  public ResponseEntity<List<ApprovalAttachVO>> uploadFile(MultipartFile[] uploadFile) {
    
    logger.info("upload file ajax..............");
    
    List<ApprovalAttachVO> list = new ArrayList<>();
    
    String uploadFolderPath = getFolder();
    
    // 폴더 생성
    File uploadPath = new File(uploadFolder, uploadFolderPath);
    logger.info("upload path: " + uploadPath);
    
    if(uploadPath.exists() == false) { // 년/월/일 폴더 경로가 존재하지 않을 때
      uploadPath.mkdirs(); // yyyy/MM/dd 폴더 생성
    }
    
    for(MultipartFile multipartFile : uploadFile) {
      
      ApprovalAttachVO attach = new ApprovalAttachVO();
      
      logger.info("----------------------------------------");
      logger.info("upload File name: " + multipartFile.getOriginalFilename());
      logger.info("upload File size: " + multipartFile.getSize());
      
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
        logger.error(e.getMessage());
      }
    }// end for
    
    return new ResponseEntity<List<ApprovalAttachVO>>(list, HttpStatus.OK);
  }
  
  // download
  @GetMapping(value = "/file", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
  @ResponseBody
  public ResponseEntity<Resource> downloadFile(String fname) {
    
    logger.info("download file: " + fname);
    
    FileSystemResource resource = new FileSystemResource(uploadFolder + "/" + fname);
    
    logger.info("resource" + resource);
    
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
      
      logger.info("downloadName: " + downloadName);
      
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
    
    logger.info("delete file: " + fname);
    
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
    
    logger.info("delete attach files");
    logger.info("delete: "+attachList);
    
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