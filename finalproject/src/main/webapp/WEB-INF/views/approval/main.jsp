<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="./includes/header.jsp" %>

  <!-- 사이드메뉴 제외한 영역 -->
  <div class="p-3 container-sm" id="ap-contents">
<div class="row row-cols-1 row-cols-md-4 g-4">
  <div class="col">
    <div class="card ap-hover">
      <div class="card-body">
        <h5 class="card-title">결재문서작성</h5>
        <p class="card-text ap-line-date"><a href="/approval/forms" class="ap-link stretched-link link-secondary">양식선택</a></p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card ap-hover">
      <div class="card-body">
        <h5 class="card-title">기안서</h5>
        <p class="card-text ap-line-date"><a href="/approval/form/1" class="ap-link stretched-link link-secondary">작성하기</a></p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card ap-hover">
      <div class="card-body">
        <h5 class="card-title">품의서</h5>
        <p class="card-text ap-line-date"><a href="/approval/form/2" class="ap-link stretched-link link-secondary">작성하기</a></p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card ap-hover">
      <div class="card-body">
        <h5 class="card-title">휴가신청서</h5>
        <p class="card-text ap-line-date"><a href="/approval/form/3" class="ap-link stretched-link link-secondary">작성하기</a></p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card ap-hover">
      <div class="card-body">
        <h5 class="card-title">수신 미결재 문서 <span class="badge rounded-pill bg-secondary">12</span></h5>
        <p class="card-text ap-line-date"><a href="/approval/wait" class="ap-link stretched-link link-secondary">미결재 문서로 이동</a></p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card ap-hover">
      <div class="card-body">
        <h5 class="card-title">결재 진행 중인 문서 <span class="badge rounded-pill bg-secondary">12</span></h5>
        <p class="card-text ap-line-date"><a href="/approval/process" class="ap-link stretched-link link-secondary">진행 문서로 이동</a></p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card ap-hover">
      <div class="card-body">
        <h5 class="card-title">7일 이상 미결재 문서 <span class="badge rounded-pill bg-danger">12</span></h5>
        <p class="card-text ap-line-date"><a href="/approval/wait" class="ap-link stretched-link link-secondary">미결재 문서로 이동</a></p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card ap-hover">
      <div class="card-body">
        <h5 class="card-title">7일 이상 진행 중 문서 <span class="badge rounded-pill bg-danger">12</span></h5>
        <p class="card-text ap-line-date"><a href="/approval/process" class="ap-link stretched-link link-secondary">진행 문서로 이동</a></p>
      </div>
    </div>
  </div>
</div>

    
    
  </div>
  
<%@include file="./includes/footer.jsp" %>