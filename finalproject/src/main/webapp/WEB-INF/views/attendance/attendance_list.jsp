<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./includes/header.jsp"%>

<!-- 사이드바 css -->
<link rel="stylesheet" href="/resources/css/sidebar.css" />

<style type="text/css">
.haroo-body {
	display: flex;
}
</style>

<!-- 바디 -->
<div class="haroo-body">

	<!-- 사이드바 -->
	<div class="p-3 bg-white" style="width: 280px;">
		<a href="status"
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
						<li><a href="list" class="link-dark rounded">근태기록조회</a></li>
					</ul>
				</div>
			</li>
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

	<!-- 근태 조회 버튼  -->
	<div class="p-3 container-sm">
		<div class="row">
			<div class="col-6">
			<label for="search" class="at-search">조회</label>
              <select class="at-select" id="search" required>
                <option value="1">일별</option>
                <option value="2">월별</option>
              </select>
              
				<!-- <select class="form-select form-select-sm" aria-label=".form-select-sm example">
					<option selected>일별 조회</option>
					<option value="1">월별 조회</option>
				</select> -->
			</div>
			<div class="col-1">
				<input class="btn btn-outline-success" type="submit" value="조회">
			</div>
		</div>
		
		<br><br>
		
	
	<!-- 조회 목록 테이블 -->
	<table class="table table-hover">
		<thead>
			<tr>
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

		</tbody>
	</table>
	</div>


</div>
<!-- end 바디 -->

<%@ include file="../includes/footer.jsp"%>