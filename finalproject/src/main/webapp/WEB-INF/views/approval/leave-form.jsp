<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="./includes/header.jsp" %>

<div class="p-3 container-sm" id="ap-contents">
  <div class="ap-form-container">
    
    <form class="ap-form row" action="/approval/form/3" method="post">
    <div class="ap-report-body col-9">
    <div class="text-center">
      <h1 class="fs-2 ap-form-name">휴가신청서</h1>
    </div>
<!--     <input type="hidden" name="foNo" value="3" /> -->
    <table class="table table-bordered">
      <tbody>
        <tr>
          <th class="text-center" scope="row">신청자</th>
          <td><input type="hidden" name="emNo" value="45424411" />
          <input type="hidden" name="leave.emNo" value="45424411" />
          백민주</td>
        </tr>
        <tr>
          <th class="text-center" scope="row">제목</th>
          <td><div class="input-group input-group-sm">
            <input class="form-control" type="text" name="apTitle"/>
          </div></td>
        </tr>
        <tr>
          <th class="text-center" scope="row">휴가종류</th>
          <td>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="inlineRadio1" name="leave.leKind" value="1" checked="checked">
              <label class="form-check-label" for="inlineRadio1">연차</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="inlineRadio2" name="leave.leKind" value="2" disabled>
              <label class="form-check-label" for="inlineRadio2">반차</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="inlineRadio3" name="leave.leKind" value="3">
              <label class="form-check-label" for="inlineRadio3">병가</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="inlineRadio4" name="leave.leKind" value="4">
              <label class="form-check-label" for="inlineRadio4">경조사</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="inlineRadio5" name="leave.leKind" value="9">
              <label class="form-check-label" for="inlineRadio5">기타</label>
            </div>
          </td>
        </tr>
        <tr>
          <th class="text-center" scope="row">휴가일정</th>
          <td>
            <div class="input-group input-group-sm">
              <span class="input-group-text">시작일</span>
              <input type="text" class="form-control" pattern="^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$" name="leave.leStart" placeholder="예)2022-11-01">
              <span class="input-group-text">종료일</span>
              <input type="text" class="form-control" pattern="^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$" name="leave.leEnd" placeholder="예)2022-11-01">
            </div>
          </td>
        </tr>
        <tr>
          <th class="text-center" scope="row">내용</th>
          <td><textarea id="summernote" name="apContent"></textarea></td>
        </tr>
        <tr>
          <th class="text-center" scope="row">공개범위</th>
          <td>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="apPublic1" name="apPublic" value="1" checked="checked">
              <label class="form-check-label" for="apPublic1">공개</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="apPublic2" name="apPublic" value="0">
              <label class="form-check-label" for="apPublic2">비공개</label>
            </div>
          </td>
        </tr>
      </tbody>   
      </table> 
      <div class="text-end">
        <div class="btn-group-sm" role="group">
          <button class="btn btn-outline-secondary ap-form-submit" type="submit">상신하기</button>
          <button class="btn btn-outline-secondary ap-form-reset" type="reset">다시작성</button>
        </div>
      </div>
      </div>
      <div class="ap-report-line col-3">
        <div class="card border-secondary mb-3" style="max-width: 18rem;">
        <div class="card-header">결재</div>
          <div class="card-body text-dark">
          <h5 class="card-title"><button class="btn btn-outline-secondary btn-sm ap-al-select">결재선 선택</button></h5>
            <div class="ap-line-sign-form" id="ap-list-selected">
              <p class="card-text">결재선 선택 버튼을 눌러 결재자를 지정해주세요.</p>
           </div>
          </div>
        </div>
      </div>
    </form>
  </div>
  </div>
  <script type="text/javascript">
  $slim(document).ready(function() {
    $slim('#summernote').summernote({
        height: 300,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        lang: "ko-KR",          // 한글 설정
        toolbar: [
          // [groupName, [list of button]]
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['font', ['strikethrough', 'superscript', 'subscript']],
          ['fontsize', ['fontsize']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']]
        ]
    });
  });
  </script>
  
  <%@include file="./includes/footer.jsp" %>