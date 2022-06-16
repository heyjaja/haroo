<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="./includes/header.jsp" %>

<div class="p-3 container-sm" id="ap-contents">
  <!-- 사이드메뉴 제외한 영역 -->
  <div class="d-flex justify-content-between">
  <c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
  <c:choose>
    <c:when test="${fn:contains(url, 'wait')  }">
      <h4>미결재 문서</h4>
    </c:when>
    <c:when test="${fn:contains(url, 'sign') }">
      <h4>결재 문서</h4>
    </c:when>
  </c:choose>
  </div>
  
  <div class="container rounded border mt-3 mb-4">
  
  <c:forEach var="ap" items="${list }">
  
    <div class="shadow p-3 mb-3 mt-3 bg-body rounded d-flex align-items-center position-relative ap-list-item">
    <div class="col-2 d-flex flex-column align-items-center">
      <div class="d-flex flex-column align-items-center text-muted">
        <svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
            <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
            <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/>
          </svg>
        <small class="fw-bold mb-0 mt-1">${ap.foKind }</small>
      </div>
    </div>
    <div class="col-5 d-flex flex-column">
      <div class="fw-bold">
        <c:choose>
          <c:when test="${ap.apStatus == 0 }">
            <a class="ap-list-title stretched-link text-dark" href="/approval/wait/${ap.apNo }">${ap.apTitle }</a>
          </c:when>
          <c:when test="${ap.apStatus > 0 }">
            <a class="ap-list-title stretched-link text-dark" href="/approval/sign/${ap.apNo }">${ap.apTitle }</a>
          </c:when>
        </c:choose>
        </div>
      <div><small class="text-muted">${ap.apDate }</small></div>
    </div>
    <div class="col-4 d-flex flex-column">
      <div class="fw-bold">${ap.emName } ${ap.poName }</div>
      <div><small class="text-muted">${ap.deName }</small></div>
    </div>
    <div class="col-1">
      <c:choose>
        <c:when test="${ap.apStatus == 0 }">
          <button type="button" class="btn btn-outline-primary btn-sm">진행중</button>
        </c:when>
        <c:when test="${ap.apStatus == 1 }">
          <button type="button" class="btn btn-success btn-sm">승인</button>
        </c:when>
        <c:when test="${ap.apStatus == 2 }">
          <button type="button" class="btn btn-secondary btn-sm">반려</button>
        </c:when>
      </c:choose>
    </div>
    </div>
    </c:forEach>
  </div>
      <nav aria-label="Page navigation mt-5">
    <ul class="pagination pagenation-sm justify-content-center ap-pagination">
      <c:if test="${pageMaker.prev }">
        <li class="page-item">
          <a class="page-link" href="${pageMaker.start - 1 }" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>  
          </a>  
        </li>
      </c:if>
      
      <c:forEach var="num" begin="${pageMaker.start }"
        end="${pageMaker.end }">
        <li class="page-item ${pageMaker.cri.page == num ? "active" : "" }">
          <a class="page-link" href="${num }">${num }</a></li>
      </c:forEach>
      
      <c:if test="${pageMaker.next }">
        <li class="page-item"><a class="page-link" href="${pageMaker.end + 1 }" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a></li>
      </c:if>
    </ul>
  </nav>
  <!-- end pagination -->
  
  <form class="row g-3" id="ap-search-form" action="" method='get'>
    <div class="col-auto">
      <select class="form-select form-select-sm" aria-label="search" name="type">
        <option value="T" selected>제목</option>
        <option value="C">내용</option>
        <option value="TC">제목+내용</option>
        <option value="W">기안자</option>
        <option value="F">양식</option>
      </select>
    </div>
    <div class="col-auto">
      <input type="text" class="form-control form-control-sm" name="keyword"/>
      <input type='hidden' name='page' value='${pageMaker.cri.page }' />
      <input type='hidden' name='amount' value='${pageMaker.cri.amount }' />
    </div>
    <div class="col-auto">
      <button class="btn btn-outline-secondary btn-sm">검색</button>
    </div>
  </form>
  
  <form id='ap-action-form' action="" method='get'>
    <input type='hidden' name='page' value = '${pageMaker.cri.page}'/>
    <input type='hidden' name='amount' value='${pageMaker.cri.amount }' />
    <input type='hidden' name='type' value='${pageMaker.cri.type }' />
    <input type='hidden' name='keyword' value='${pageMaker.cri.keyword }' />
    
  </form>
  
</div>

<%@include file="./includes/footer.jsp" %>