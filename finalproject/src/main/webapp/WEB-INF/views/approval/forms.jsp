<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@include file="./includes/header.jsp" %>

<div class="p-3 container-sm" id="ap-contents">
<h3>양식 목록</h3>
<div class="list-group mt-3">

  <c:forEach var="form" items="${forms }">
    <c:if test="${form.foStatus == 0 }">
        <div class="list-group-item list-group-item-action d-flex justify-content-between align-items-start">
          <div>
            <a href="/approval/report/${form.foNo }" style="text-decoration: none; color:black;">
              <span class="badge bg-light rounded-pill text-dark">${form.foNo }</span> ${form.foKind }
            </a>
            <div><small class="ps-4">${form.foTitle }</small></div>
          </div>
          <c:if test="${form.foNo > 3 }">
            <a href="/approval/form/${form.foNo }">
              <span class="badge bg-light text-dark">수정</span>
            </a>
          </c:if>
        </div>
    </c:if>
    <c:if test="${form.foStatus == 1 }">
        <div class="list-group-item list-group-item-action d-flex justify-content-between align-items-start">
          <div style="color: gray;">
            <span class="badge bg-light rounded-pill text-dark">${form.foNo }</span> ${form.foKind }
            <div><small class="ps-4">${form.foTitle }</small></div>
          </div>
          <a href="/approval/form/${form.foNo }">
              <span class="badge bg-light text-dark">수정</span>
          </a>
        </div>
    </c:if>
  </c:forEach>
  <a href="/approval/form" style="text-decoration: none">
    <button type="button" class="list-group-item list-group-item-action mt-2">
      <span class="badge bg-light rounded-pill text-dark">+</span>양식추가
    </button>
  </a>
</div>
</div>

<%@include file="./includes/footer.jsp" %>