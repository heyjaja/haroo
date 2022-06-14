<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>

<!-- 사이드바 css -->
<link rel="stylesheet" href="/resources/css/sidebar.css" />

<style type="text/css">
.haroo-body {
	display: flex;
}

.remainder {
	font-weight: bold;
	color: #e40000;
}

caption {
	font-weight: bold;
	color: #3fd2c7;
}

h5, .cnt, label {
	font-weight: bold;
}

form {
	margin: 0px;
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
						<li><a href="/attendance/list/day" class="link-dark rounded">일별 부서 근태기록조회</a></li>
					</ul>
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="/attendance/list/month" class="link-dark rounded">월별 개인 근태기록조회</a></li>
					</ul>
				</div>
			</li>
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
					aria-expanded="false">휴가현황</button>
				<div class="collapse" id="dashboard-collapse" style="">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="status" class="link-dark rounded">휴가현황</a></li>
					</ul>
				</div>
			</li>
			<li class="border-top my-3"></li>
		</ul>
	</div>
	<!-- end 사이드바 -->

	<!-- 휴가현황 내용 -->
	<div class="p-3 container-sm">
		<br>
		<h5>${dayoff.emName } 휴가현황</h5>
		<table class="table table-sm table-bordered caption-top">
			<caption>휴가현황</caption>
			<thead>
				<tr>
					<th scope="col">Total</th>
					<th scope="col">사용일수</th>
					<th scope="col">잔여일수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">${dayoff.daTotal }</th>
					<td class="cnt">${dayoff.daCnt }</td>
					<td class="remainder">${dayoff.daRemainder }</td>
				</tr>
			</tbody>
		</table>
		<!-- end 휴가현황 내용 -->
		
		<br><br>
		<hr>
		<div class="row">
			<div class="col text-start">
			<form id="searchForm" class="row row-cols-lg-auto"  action="/dayoff/status" method="get">
				<div class="input-group mb-3">
						<div class="col-2">
							<label for="search">년도 입력 <p>(yyyy 형식) ex) 2022</p></label>
						</div>
						<div class="col-3">
							<input type="text" class="form-control" id="search" 
								name="leStart" value="${sYear }">		
						</div>
						<div class="col">
							<button class="btn btn-outline-success" value="조회">조회</button>
						</div>
					</div>		   
			</form>
			<!-- end form -->
			
			</div>
			<!-- end div col -->
		</div>
		<!-- end div row -->	
			
		<!-- 휴가 사용내역 테이블 -->
		<table class="table table-hover caption-top">
			<caption>휴가 사용내역 (${today } 기준)</caption>
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">제목</th>
					<th scope="col">내용</th>
					<th scope="col">종류</th>
					<th scope="col">시작일</th>
					<th scope="col">종료일</th>
					<th scope="col">휴가사용일수</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="list" items="${usageList }" varStatus="status">
					<tr>
						<th scope="row">${status.count}</th>

						<td>${list.leTitle}</td>
						<td>${list.apContent}</td>
						
						<!-- 휴가 종류에 따른 출력 -->
						<c:set var="kind" value="${list.leKind}" />
						<c:choose>
							<c:when test="${kind eq 0 }">
								<td>-</td>
							</c:when>
							<c:when test="${kind eq 1 }">
								<td>연차</td>
							</c:when>
							<c:when test="${kind eq 2 }">
								<td>반차</td>
							</c:when>
							<c:when test="${kind eq 3 }">
								<td>병가</td>
							</c:when>
							<c:when test="${kind eq 4 }">
								<td>경조사</td>
							</c:when>
							<c:when test="${kind eq 9 }">
								<td>기타</td>
							</c:when>
						</c:choose>
						<!-- end choose 비고 출력 -->
						
						<c:set var="start" value="${list.leStart }" />
						<td>${fn:substring(start, 0, 10) }</td>
						
						<c:set var="end" value="${list.leEnd }" />
						<td>${fn:substring(end, 0, 10) }</td>
						<td>${list.leDays}일</td>
					</tr>
				</c:forEach>


			</tbody>
		</table>
		<!-- end 조회 목록 테이블 -->
	</div>
	<!-- end div ~p-3 container-sm -->

</div>
<!-- end 바디 -->


<%@ include file="../includes/footer.jsp"%>