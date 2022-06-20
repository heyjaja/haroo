<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="./includes/header.jsp" %>

<div class="p-3 container-sm" id="ap-contents">
  <div class="ap-form-container container">

    <form class="ap-form row" action="" method="post"
    enctype="multipart/form-data">
    <div class="ap-report-body col-9">
    <div class="text-center">
      <h1 class="fs-2 ap-form-name">
      <c:if test="${form != null }">
        ${form.foKind }
      </c:if>
      <c:if test="${form == null }">
        기안서
      </c:if>
      </h1>
    </div>
<!--     <input type="hidden" name="foNo" value="1" /> -->
    <table class="table table-bordered">
      <tbody>
        <tr>
          <th class="text-center" scope="row">기안자</th>
          <td><input type="hidden" name="emNo" value="${employee.emNo }" />${employee.emName }</td>
        </tr>
        <tr>
          <th class="text-center" scope="row">제목</th>
          <td><div class="input-group input-group-sm">
            <c:if test="${ap.apTitle == null}">
              <input class="form-control" type="text" name="apTitle" />
            </c:if>
            <c:if test="${ap.apTitle != null }">
              <input class="form-control" type="text" name="apTitle"  value="${ap.apTitle }"/>
              <input type="hidden" name="foNo" value="${ap.foNo }" />
            </c:if>

          </div></td>
        </tr>
        <tr>
          <th class="text-center" scope="row">내용</th>
          <td><textarea id="summernote" name="apContent">
            <c:if test="${ap.apContent != null }">
              ${ap.apContent }
            </c:if>
            <c:if test="${form != null }">
              ${form.foContent }
            </c:if>
          </textarea></td>
        </tr>
        <tr>
          <th class="text-center" scope="row">공개범위</th>
          <td>
            <input type="radio" name="apPublic" value="1" checked="checked"><span class="ap-form-radio-label">공개</span>
            <input type="radio" name="apPublic" value="0"><span class="ap-form-radio-label">비공개</span>
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
              <c:if test="${ap != null }">
                <c:forEach var="line" items="${ap.line }" >
                  <table class="table mb-0 table-bordered"><tbody>
                  <tr><td>
                  <span class="badge rounded-pill bg-light text-dark">${line.alOrder }</span>
                      ${line.emName} ${line.poName}(${line.deName })
                    <input type="hidden" name="line[${line.alOrder - 1 }].alNo" value="${line.alNo }"/>
                    <input type="hidden" name="line[${line.alOrder - 1 }].alOrder" value="${line.alOrder }"/>
                  </td></tr>
                  </tbody></table>
                </c:forEach>
              </c:if>
           </div>
          </div>
        </div>
      <div class="card border-secondary mb-3" style="max-width: 18rem;">
        <div class="card-header">첨부파일</div>
          <div class="card-body text-dark">
            <div class="input-group-sm upload-div">
              <input class="form-control ap-file" type="file" name="uploadFile" multiple />
            </div>
            <div id="ap-upload-file" class="mt-2">
              <ul class="list-group list-group-flush">

              </ul>
           </div>
          </div>
        </div>
        <!-- .card -->
      </div>
    </form>

  
  </div>
  </div>
  <script type="text/javascript">
  $slim('#summernote').summernote({
    height: 300,                 // 에디터 높이
    minHeight: null,             // 최소 높이
    maxHeight: null,             // 최대 높이
    lang: "ko-KR",          // 한글 설정
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['view', ['fullscreen', 'codeview', 'help']]
    ]
  });
  </script>
  
  <%@include file="./includes/footer.jsp" %>
