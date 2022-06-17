<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="./includes/header.jsp" %>

<div class="p-3 container-sm" id="ap-contents">
<h3>양식 목록</h3>
<div class="list-group">
  <a href="/approval/form/1" class="ap-link list-group-item list-group-item-action">
  <span class="badge bg-light rounded-pill text-dark">1</span> 기안서</a>
  <a href="/approval/form/2" class="ap-link list-group-item list-group-item-action">
  <span class="badge bg-light rounded-pill text-dark">2</span> 품의서</a>
  <a href="/approval/form/3" class="ap-link list-group-item list-group-item-action">
  <span class="badge bg-light rounded-pill text-dark">3</span> 휴가신청서</a>
</div>
</div>

<%@include file="./includes/footer.jsp" %>