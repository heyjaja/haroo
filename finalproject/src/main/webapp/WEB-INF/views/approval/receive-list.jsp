<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="./includes/header.jsp" %>

<div class="p-3 container-sm" id="ap-contents">
  <!-- 사이드메뉴 제외한 영역 -->
  <c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
  <c:choose>
    <c:when test="${fn:contains(url, 'wait')  }">
      <h3>미결재 문서</h3>
      <form id='ap-action-form' action="/approval/wait" method='get'>
        <input type='hidden' name='page' value = '${pageMaker.cri.page}'/>
        <input type='hidden' name='amount' value='${pageMaker.cri.amount }' />
      </form>
    </c:when>
    <c:when test="${fn:contains(url, 'sign') }">
      <h3>결재 문서</h3>
      <form id='ap-action-form' action="/approval/sign" method='get'>
        <input type='hidden' name='page' value = '${pageMaker.cri.page}'/>
        <input type='hidden' name='amount' value='${pageMaker.cri.amount }' />
      </form>
    </c:when>
  </c:choose>
  
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">양식</th>
          <th scope="col">제목</th>
          <th scope="col">기안자</th>
          <th scope="col">상신날짜</th>
          <th scope="col">결재상태</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="ap" items="${list }">
          <c:choose>
          <c:when test="${ap.alStatus == 0 }">
          <tr>
            <th scope="row">${ap.foKind }</th>
            <td><a class="ap-list-title ap-link" href="/approval/wait/${ap.apNo }">${ap.apTitle }</a></td>
            <td>${ap.emName }</td>
            <td>${ap.apDate }</td>
            <td>진행중</td>
          </tr>
          </c:when>
          <c:when test="${ap.alStatus > 0 }">
          <tr>
            <th scope="row">${ap.foKind }</th>
            <td><a class="ap-list-title ap-link" href="/approval/sign/${ap.apNo }">${ap.apTitle }</a></td>
            <td>${ap.emName }</td>
            <td>${ap.apDate }</td>
            <c:choose>
              <c:when test="${ap.apStatus == 1 }">
                <td>승인</td>
              </c:when>
              <c:when test="${ap.apStatus == 2 }">
                <td>반려</td>
              </c:when>
              <c:otherwise>
                <td>진행중</td>
              </c:otherwise>
            </c:choose>
          </tr>
          </c:when>
          </c:choose>
        </c:forEach>
      </tbody>
    </table>
    
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
  
  <form class="row g-3">
    <div class="col-auto">
      <select class="form-select form-select-sm" aria-label="search">
        <option selected>제목</option>
        <option value="1">내용</option>
        <option value="2">제목+내용</option>
        <option value="3">기안자</option>
        <option value="4">양식</option>
      </select>
    </div>
    <div class="col-auto">
      <input type="text" class="form-control form-control-sm" name="keyword"/>
    </div>
    <div class="col-auto">
      <button class="btn btn-outline-secondary btn-sm" type="button">검색</button>
    </div>
  </form>
  
</div>

<%@include file="./includes/footer.jsp" %>