<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="./includes/header.jsp" %>

<div class="p-3 container-sm" id="ap-contents">
  <div class="ap-form-container container row">
    <div class="ap-report-body col-9">
      <table class="table table-bordered">
        <tbody>
          <tr>
            <th class="text-center fs-2" scope="col" colspan="2">${ap.foKind }</th>
          </tr>
          <tr>
            <th scope="row">제목</th>
            <td>${ap.apTitle }</td>
          </tr>
          <tr>
            <th scope="row">작성일자</th>
            <td>${ap.apDate }</td>
          </tr>
          <tr>
            <th scope="row">기안자</th>
            <td>${ap.emName }</td>
          </tr>
          <c:if test="${ap.leave != null }">
            <tr>
              <th scope="row">휴가종류</th>
              <c:choose>
                <c:when test="${ap.leave.leKind == 1 }">
                  <td>연차</td>
                </c:when>
                <c:when test="${ap.leave.leKind == 2 }">
                  <td>반차</td>
                </c:when>
                <c:when test="${ap.leave.leKind == 3 }">
                  <td>병가</td>
                </c:when>
                <c:when test="${ap.leave.leKind == 4 }">
                  <td>경조사</td>
                </c:when>
                <c:otherwise>
                  <td>기타</td>
                </c:otherwise>
              </c:choose>
            </tr>
            <tr>
              <th scope="row">휴가일정</th>
              <td>${ap.leave.leStart }- ${ap.leave.leEnd }
                (${ap.leave.leDays }일 간)</td>
            </tr>
          </c:if>
          <c:if test="${ap.expense != null }">
            <tr>
              <td colspan="2">
                <table class="table mb-0 table-bordered">
                  <tbody>
                    <tr>
                      <th class="text-center" scope="row" colspan="4">품의목록</th>
                    </tr>
                    <tr>
                      <th class="text-center">품목</th>
                      <th class="text-center">수량</th>
                      <th class="text-center">가격</th>
                      <th class="text-center">소계</th>
                    </tr>
                    <c:forEach var="ex" items="${ap.expense }">
                      <tr>
                        <td class="text-center">${ex.elItem }</td>
                        <td class="text-center">${ex.elQuantity }</td>
                        <td class="text-center">${ex.elPrice }</td>
                        <td class="text-center">${ex.elCost }</td>
                      </tr>
                      <c:set var="total" value="${ex.elTotal }"></c:set>
                    </c:forEach>
                    <tr>
                      <th class="text-center" colspan="2">합계</th>
                      <td class="text-center" colspan="2">${total }</td>
                    </tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </c:if>
          <tr>
            <th class="text-center" scope="row" colspan="2">내용</th>
          </tr>
          <tr>
            <td colspan="2">${ap.apContent }</td>
          </tr>
          <tr>
            <th scope="row">공개여부</th>
            <c:choose>
              <c:when test="${ap.apPublic == 1 }">
                <td>공개</td>
              </c:when>
              <c:when test="${ap.apPublic == 0 }">
                <td>비공개</td>
              </c:when>
            </c:choose>
          </tr>
          <c:if test="${ap.attachList.size() > 0 }">
            <tr>
              <th class="align-middle" scope="row">첨부파일</th>
              <td>
                <div id="ap-upload-file">
                  <ul class="list-group">
                    <c:forEach var="attach" items="${ap.attachList }">
                      <li class="list-group-item ap-file" data-path="${attach.path }" data-uuid="${attach.aaNo }" 
                        data-fname="${attach.fname }">${attach.fname }
                      <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
                        <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                        <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
                      </svg>
                      </li>
                    </c:forEach>
                  </ul>
               </div>
              </td>
            </tr>
          </c:if>
        </tbody>
      </table>
    </div>
    <div class="ap-report-line col-3">
      <table class="table mb-0 table-bordered">
        <tbody>
          <tr>
            <th class="text-center ap-line-table-1">결재</th>
          </tr>
            <c:forEach var="apLine" items="${ap.line }">
            <tr>
              <th class="text-center">
              <span class="badge rounded-pill bg-light text-dark">${apLine.alOrder }</span>
              ${apLine.emName} ${apLine.poName}(${apLine.deName })</th>
            </tr>
              <c:choose>
                  <c:when test="${apLine.alStatus == 0}">
                    <c:if test="${apLine.alNo == employee.em_no }">
                    <tr>
                     <td class="text-center">
                      <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#al-sign-form" aria-expanded="false" aria-controls="collapseExample">
                        결재하기
                      </button>
                      <div class="collapse ap-line-sign-form" id="al-sign-form">
                        <form action="/haroo/approval/wait/${ap.apNo }" method="post">
                          <input type="hidden" name="apNo" value="${ap.apNo }" />
                          <input type="hidden" name="alNo" value="${employee.em_no }" />
                          <input type="hidden" name="foNo" value="${ap.foNo }" />
                          <div class="input-group input-group-sm">
                            <input type="radio" class="btn-check" id="al-option1" name="alStatus" value="1" autocomplete="off" checked>
                            <label class="btn btn-outline-success btn-sm" for="al-option1">승인</label>
                            <input type="radio" class="btn-check" id="al-option2" name="alStatus" value="2" autocomplete="off">
                            <label class="btn btn-outline-secondary btn-sm" for="al-option2">반려</label>
                            
                            <input type="text" class="form-control" name="alComment" placeholder="의견">
                            <button class="btn btn-outline-secondary btn-sm">
                              결재
                            </button>
                          </div>
                        </form>
                      </div>
                      </td>
                    </tr>
                    </c:if>
                    <c:if test="${apLine.alNo != employee.em_no and ap.apStatus == 0}">
                    <tr>
                     <td class="text-center">
                        <button class="btn btn-outline-secondary btn-sm">진행중</button>
                      </td>
                     </tr>
                    </c:if>
                  </c:when>
                  <c:when test="${apLine.alStatus == 1 }">
                  <tr>
                    <td class="text-center">
                    <button class="btn btn-success btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#al-detail-${apLine.alOrder }" aria-expanded="false" aria-controls="collapseExample">
                        승인
                      </button>
                    <div class="collapse"
                      id="al-detail-${apLine.alOrder }">
                      <c:if test="${apLine.alDate != null}">
                        <div class="ap-line-sign-form">
                          <div class="ap-line-date">${apLine.alDate }</div>
                          ${apLine.alComment}
                        </div>
                      </c:if>
                    </div>
                    </td>
                    </tr>
                  </c:when>
                  <c:when test="${apLine.alStatus == 2 }">
                  <tr>
                    <td class="text-center">
                    <button class="btn btn-secondary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#al-detail-${apLine.alOrder }" aria-expanded="false" aria-controls="collapseExample">
                        반려
                      </button>
                    <div class="collapse" id="al-detail-${apLine.alOrder }">
                      <c:if test="${apLine.alDate != null}">
                        <div class="ap-line-sign-form">
                          <div class="ap-line-date">${apLine.alDate }</div>
                          ${apLine.alComment}
                        </div>
                      </c:if>
                    </div>
                    </td>
                    </tr>
                  </c:when>
                </c:choose>
            </c:forEach>
        </tbody>
      </table>
    </div>

  </div>
</div>

<%@include file="./includes/footer.jsp" %>