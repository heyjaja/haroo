<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>

<div class="haroo-body">
  <main class="container">
  <div class="d-flex align-items-center p-3 my-3 text-white bg-info rounded shadow-sm">
    <div class="me-2 text-white">
      <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-cloud-fill" viewBox="0 0 16 16">
        <path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z"/>
      </svg>
    </div>
    <div class="lh-1">
      <h1 class="h6 mb-0 text-white lh-1 text-start">haroo</h1>
      <small>Since 2021</small>
    </div>
  </div>
  <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">뉴스피드 쓰기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="modalForm">
          <div class="mb-3 text-start">
            <label for="newsfeedName" class="col-form-label">이름:</label>
            <input type="text" class="form-control" id="newsfeedName" name="writer">
            <input type="hidden" name="emNo" value="${employee.em_no }">
          </div>
          <div class="mb-3 text-start">
            <label for="message" class="col-form-label">내용:</label>
            <textarea class="form-control" id="message" name="content"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-info text-light" id="modalRegister">등록</button>
      </div>
    </div>
  </div>
</div>
<!-- end .modal -->
  <div class="my-3 p-3 bg-body rounded shadow-sm list-group list-group-flush" id="newsfeedBody">
    <h6 class="border-bottom pb-2 mb-0 text-start">뉴스피드
      <span class="badge bg-light rounded-pill text-dark" id="addBtn" style="cursor: pointer;" 
        data-bs-toggle="modal" data-bs-target="#my-modal">쓰기</span>
    </h6>
    
    
  </div>
  <!-- end newsfeed body -->
</main>
</div>

<script type="text/javascript" src="/resources/js/newsfeed.js" ></script>
<script type="text/javascript">

$(document).ready(function() {
  
  showList(1); // 맨처음 불러오기
  
});

const emNo = '<c:out value="${employee.em_no}"/>';

</script>
<%@ include file="includes/footer.jsp" %>