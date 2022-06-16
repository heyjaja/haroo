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

tr {
	border-bottom: 1px solid #829698;
}

label, h4 {
	font-weight: bold;
}

caption {
	font-weight: bold;
	color: #3fd2c7;
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
						<li><a href="/attendance/status" class="link-dark rounded">근태입력</a></li>
					</ul>
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="day" class="link-dark rounded">일별 부서 근태기록조회</a></li>
					</ul>
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="month" class="link-dark rounded">월별 개인 근태기록조회</a></li>
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

	<!-- 조회 영역 -->
	<div class="p-3 container-sm">
		<div class="row">
			<h4 class="text-start">월별 개인 근태 기록 조회</h4>
			<hr>
			<div class="col text-start">
			<form id="searchForm" class="row row-cols-lg-auto"  action="/attendance/list/month" method="get">
				<div class="input-group mb-3">
						<div class="col-1">
							<label for="search-list-month">년/월 선택</label>
						</div>
						<div class="col-3">
							<input type="month" class="form-control" id="search-list-month" name="atDate" max="${currentMonth }" value="${search }">		
						</div>
						<div class="col">
							<button class="btn btn-outline-success" value="조회">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
								  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg>
							</button>
						</div>
					</div>		   
			</form>
			<!-- end form -->
			
			</div>
			<!-- end div col -->
		</div>
		<!-- end div row -->

		<br>
		 <!-- 출근 count 테이블 -->
		<table id="countTable" class="table table-sm table-bordered caption-top">
			<c:forEach var="list" items="${list }" begin="0" end="0">
				<c:set var="date" value="${list.atDate }"/>			
				<caption>${fn:substring(date, 0, 7) } 누계</caption>
			</c:forEach>

			<tr>
				<th scope="col">정상출근</th>
				<td>${onTime }</td>
				<th scope="col">지각</th>
				<td>${late }</td>
				<th scope="col">결근</th>
				<td>${absent }</td>
				<th scope="col">휴가</th>
				<td>${dayoff }</td>
			</tr>
		</table>
		<!-- end 조회 목록 테이블 -->

		<br>	
		<!-- 조회 목록 테이블 -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">일자</th>
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

				<c:forEach var="list" items="${list }" varStatus="status">
					<tr>
						<th scope="row">${status.count}</th>
					
						<c:set var="date" value="${list.atDate }"/> 
						<td>${fn:substring(date, 0, 10) }</td>
						<td>${list.emNo}</td>
						<td>${list.emName}</td>
						<td>${list.deName}</td>

						<!-- 시간 뒤에 .0 소수점 붙는 것 포맷 변경 -->
						<fmt:parseDate value="${list.atStart}" var="atStart" 	pattern="yyyy-MM-dd HH:mm:ss.S" />
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

					</tr>
				</c:forEach>


			</tbody>
		</table>
		<!-- end 조회 목록 테이블 -->
		

		

	</div>
	<!-- end 조회 영역 -->


</div>
<!-- end 바디 -->

<%@ include file="./includes/footer.jsp"%>