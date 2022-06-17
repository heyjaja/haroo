<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="./includes/header.jsp" %>

<div class="p-3 container-sm" id="ap-contents">
  <div class="ap-form-container container">

    <form class="ap-form row" action="" method="post"
    enctype="multipart/form-data">
    <div class="ap-report-body col-9">
    <div class="text-center">
      <h1 class="fs-2 ap-form-name">사용자 양식</h1>
    </div>
<!--     <input type="hidden" name="foNo" value="1" /> -->
    <table class="table table-bordered">
      <tbody>
        <tr>
          <th class="text-center" scope="row">종류</th>
          <td>
            <div class="input-group input-group-sm">
                <input class="form-control" type="text" name="foKind" value="${form.foKind }"/>
            </div>
          </td>
        </tr>
        <tr>
          <th class="text-center" scope="row">이름</th>
          <td><div class="input-group input-group-sm">
            <input class="form-control" type="text" name="foTitle" value="${form.foTitle }"/>
            </div>
          </td>
        </tr>
        <tr>
          <th class="text-center" scope="row">내용</th>
          <td><textarea id="summernote" name="foContent">
            <c:if test="${form != null }">${form.foContent }</c:if>
            </textarea>
          </td>
        </tr>
        <tr>
          <th class="text-center" scope="row">설명</th>
          <td><div class="input-group input-group-sm">
            <input class="form-control" type="text" name="foInfo" value="${form.foInfo }"/>
            </div>
          </td>
        </tr>
        <tr>
          <th class="text-center" scope="row">활성화</th>
          <td>
            <input type="radio" name="foStatus" value="0" checked>
            <span class="ap-form-radio-label">활성화</span>
            <input type="radio" name="foStatus" value="1" ${form.foStatus == 1 ? 'checked' : '' }>
            <span class="ap-form-radio-label">비활성화</span>
          </td>
        </tr>
      </tbody>   
      </table> 
      <div class="text-end">
        <div class="btn-group-sm" role="group">
          <button class="btn btn-outline-secondary" type="submit">저장</button>
          <button class="btn btn-outline-secondary ap-form-reset" type="reset">다시작성</button>
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
          ['fontsize', ['fontsize']],
          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
          ['color', ['forecolor','color']],
          ['table', ['table']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']]
        ]
    });
  });
  </script>
  
  <%@include file="./includes/footer.jsp" %>