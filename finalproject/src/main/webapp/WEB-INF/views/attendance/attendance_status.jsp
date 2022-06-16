<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./includes/header.jsp"%>

<style type="text/css">
.haroo-body {
	display: flex;
}

.start-form, .end-form, .out-form {
	display: inline-block;
}

tr {
	border-bottom: 1px solid #829698;
}

.date {
    font-size: 15px; 
    color: #5a5a5a;
}
.time {
    font-size: 40px;
    font-weight: bold;
    color: #5a5a5a;
}

#start-btn, #out-btn, #end-btn{
	width: 70px; 
	height: 45px; 
}

</style>

<!-- 바디 -->
<div class="haroo-body">

	<!-- 사이드바 -->
	<div class="p-3 bg-white" style="width: 280px;">
		<a href="/attendance/status"
			class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
			<svg class="bi me-2" width="30" height="24">
				<use xlink:href="#bootstrap"></use></svg> <span class="fs-5 fw-semibold">근태관리</span>
		</a>
		<ul class="list-unstyled ps-0">
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#home-collapse"
					aria-expanded="false">근태현황</button>
				<div class="collapse" id="home-collapse" style="">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="status" class="link-dark rounded">근태입력</a></li>
					</ul>
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="list/day" class="link-dark rounded">일별 부서 근태기록조회</a></li>
					</ul>
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="list/month" class="link-dark rounded">월별 개인 근태기록조회</a></li>
					</ul>
				</div>
			</li>
			<li class="border-top my-3"></li>
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
					aria-expanded="false">휴가현황</button>
				<div class="collapse" id="dashboard-collapse" style="">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="/dayoff/status" class="link-dark rounded">휴가현황</a></li>
					</ul>
				</div>
			</li>
			<li class="border-top my-3"></li>
		</ul>
	</div>
	<!-- end 사이드바 -->

	<!-- 근태버튼  -->
	<div class="p-3 container-sm">
		<div class="text-start row"> <!-- 중앙정렬을 왼쪽정렬로 하는 class : text-start -->
			<div class="col-2">
				<!-- 시계 출력 -->
				<div id="time" class="time"></div>
				<div id="date" class="date"></div>
				<br>
				<!--end 시계 출력 -->
			</div>

			<!-- 출/퇴/외근 버튼 form -->
			<div class="col">
				<br>
				<form action="/attendance/start" method="post" class="start-form"
					id="start-form">
					<input type="hidden" name="emNo" value="${emNo }">
					<button id="start-btn" class="btn btn-outline-primary " value="출근">출근</button>
				</form>

				<form action="/attendance/end" method="post" class="end-form"
					id="end-form">
					<input type="hidden" name="emNo" value="${emNo }"> 
					<input id="end-btn" class="btn btn-outline-secondary " type="submit" value="퇴근">
				</form>

				<form action="/attendance/outside" method="post" class="out-form"
					id="out-form">
					<input type="hidden" name="emNo" value="${emNo }"> 
					<input id="out-btn" class="btn btn-outline-warning " type="submit" 	value="외근">
				</form>
			</div>
			<!-- end 출/퇴/외근 버튼 form -->
		</div>
		<!-- end div row -->
		<br>

		<!-- 근태목록  -->
		<div>
			<c:forEach var="dept" items="${depts }" begin="0" end="0">
				<h4 class="fw-bold">
					<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-list-ul" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
					</svg>
					${dept.deName } 근태 목록
				</h4>
				<br>
			</c:forEach>
		</div>

		<!-- 오늘의 날짜 -->
		<div class="text-start">
			<h6>TODAY : ${today }</h6>
		</div>

		<!-- 목록 테이블 -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">사번</th>
					<th scope="col">사원</th>
					<th scope="col">부서</th>
					<th scope="col">출근시간</th>
					<th scope="col">퇴근시간</th>
					<th scope="col">근무상태</th>
					<th scope="col">비고</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="dept" items="${depts }" varStatus="status">
					<tr>
						<th scope="row">${dept.emNo}</th>
						<td>${dept.emName}</td>
						<td>${dept.deName}</td>

						<c:forEach var="list" items="${list }">
							<c:choose>
								<c:when test="${dept.emNo eq list.emNo}">

									<!-- 시간 뒤에 .0 소수점 붙는 것 포맷 변경 -->
									<fmt:parseDate value="${list.atStart}" var="atStart" pattern="yyyy-MM-dd HH:mm:ss.S" />
									<td><fmt:formatDate value="${atStart}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

									<fmt:parseDate value="${list.atEnd}" var="atEnd" 	pattern="yyyy-MM-dd HH:mm:ss.S" />
									<td><fmt:formatDate value="${atEnd}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

									<!-- 근무상태 번호에 따라 출력 -->
									<c:set var="state" value="${list.atState}" />
									<c:choose>
										<c:when test="${state eq 1 }">
											<td>출근</td>
										</c:when>
										<c:when test="${state eq 2 }">
											<td>지각</td>
										</c:when>
										<c:when test="${state eq 3 }">
											<td>외근</td>
										</c:when>
										<c:when test="${state eq 4 }">
											<td>휴가</td>
										</c:when>
									</c:choose>
									<!-- end choose 근무상태 출력 -->

									<!-- 비고 휴가 종류에 따른 출력 -->
									<c:set var="note" value="${list.atNote}" />
									<c:choose>
										<c:when test="${note eq 0 }">
											<td>-</td>
										</c:when>
										<c:when test="${note eq 1 }">
											<td>연차</td>
										</c:when>
										<c:when test="${note eq 2 }">
											<td>반차</td>
										</c:when>
										<c:when test="${note eq 3 }">
											<td>병가</td>
										</c:when>
										<c:when test="${note eq 4 }">
											<td>경조사</td>
										</c:when>
										<c:when test="${note eq 9 }">
											<td>기타</td>
										</c:when>
									</c:choose>
									<!-- end choose 비고 출력 -->

								</c:when>
							</c:choose>
						</c:forEach>

					</tr>
				</c:forEach>


			</tbody>
		</table>

	</div>

	<!-- Modal  추가 -->
	<div class="modal" id="myModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-check-circle-fill text-success" viewBox="0 0 16 16">
						  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
						</svg>
						근태 입력
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body"> 입력 처리 완료	</div>
				<div class="modal-footer">
					<button type="button" id="modal-close" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</div>
<!-- end 바디 -->

<%@ include file="./includes/footer.jsp"%>