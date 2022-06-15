<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="./includes/header.jsp"%>

<!-- 사이드메뉴 제외한 영역 -->
<div class="p-3 container-sm" id="ap-contents">

  <c:set var="url"
    value="${requestScope['javax.servlet.forward.request_uri']}" />
  <c:choose>
    <c:when test="${fn:contains(url, 'done')  }">
      <h3 class="float-start">완료 문서</h3>
      <div class="btn-group btn-group-sm float-end ap-status" role="group" aria-label="done">
        <input type="radio" class="btn-check" name="status" 
          id="btnradio1" value="9" autocomplete="off" ${status == 9 ? "checked" : "" }>
        <label class="btn btn-outline-primary" for="btnradio1">전체</label>
        
        <input type="radio" class="btn-check" name="status" 
          id="btnradio2" value="1" autocomplete="off" ${status == 1 ? "checked" : "" }>
        <label class="btn btn-outline-success" for="btnradio2">승인</label>

        <input type="radio" class="btn-check" name="status" 
          id="btnradio3" value="2" autocomplete="off" ${status == 2 ? "checked" : "" }>
        <label class="btn btn-outline-secondary" for="btnradio3">반려</label>
      </div>
    </c:when>
    <c:when test="${fn:contains(url, 'process') }">
      <h3>진행 문서</h3>
    </c:when>
    <c:when test="${fn:contains(url, 'takeback') }">
      <h3>취소 문서</h3>
    </c:when>
    <c:when test="${fn:contains(url, 'all') }">
      <h3>전체 문서</h3>
    </c:when>
  </c:choose>
  <table class="table table-hover mt-3">
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
          <c:when test="${ap.apStatus == 0 }">
            <tr>
              <th scope="row">${ap.foKind }</th>
              <td><a class="ap-list-title ap-link"
                href="/haroo/approval/process/${ap.apNo }">${ap.apTitle }</a></td>
              <td>${ap.emName }</td>
              <td>${ap.apDate }</td>
              <td>진행중</td>
            </tr>
          </c:when>
          <c:when test="${ap.apStatus > 0 }">
            <tr>
              <th scope="row">${ap.foKind }</th>
              <td><a class="ap-list-title ap-link"
                href="/haroo/approval/done/${ap.apNo }">${ap.apTitle }</a></td>
              <td>${ap.emName }</td>
              <td>${ap.apDate }</td>
              <c:if test="${ap.apStatus == 1 }">
                <td>승인</td>
              </c:if>
              <c:if test="${ap.apStatus == 2 }">
                <td>반려</td>
              </c:if>
            </tr>
          </c:when>
          <c:when test="${ap.apStatus == -1 }">
            <tr>
              <th scope="row">${ap.foKind }</th>
              <td><a class="ap-list-title ap-link"
                href="/haroo/approval/takeback/${ap.apNo }">${ap.apTitle }</a></td>
              <td>${ap.emName }</td>
              <td>${ap.apDate }</td>
              <td>취소</td>
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
      <input type='hidden' name='status' value='${status }' />
    </div>
    <div class="col-auto">
      <button class="btn btn-outline-secondary btn-sm">검색</button>
    </div>
  </form>
  
  <form id='ap-action-form' action="" method='get'>
    <input type='hidden' name='page' value = '${pageMaker.cri.page}'/>
    <input type='hidden' name='amount' value='${pageMaker.cri.amount }' />
    <input type='hidden' name='status' value='${status }' />
    <input type='hidden' name='type' value='${pageMaker.cri.type }' />
    <input type='hidden' name='keyword' value='${pageMaker.cri.keyword }' />
    
  </form>
</div>



<%@include file="./includes/footer.jsp"%>