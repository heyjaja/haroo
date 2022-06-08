<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

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
        <a href="/attendance/status" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
            <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
            <span class="fs-5 fw-semibold">근태관리</span>
        </a>
        <ul class="list-unstyled ps-0">
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
                    	근태현황
                </button>
                <div class="collapse" id="home-collapse" style="">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/attendance/status" class="link-dark rounded">근태입력</a></li>
                    </ul>
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/attendance/list" class="link-dark rounded">근태기록조회</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                    	휴가현황	
                </button>
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
			<h5>${dayoff.daName } 휴가현황</h5><br>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">총 휴가 일수</th>
						<th scope="col">사용 일수</th>
						<th scope="col">잔여 일수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">${dayoff.daTotal }</th>
						<td>${dayoff.daCnt }</td>
						<td>${dayoff.daRemainder }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- end 휴가현황 내용 -->

	</div>
	<!-- end 바디 -->

    
<%@ include file="../includes/footer.jsp"%>