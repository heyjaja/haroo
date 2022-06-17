<%@page import="com.haroo.employee.domain.EmployeeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	EmployeeVO employeeVO = ((EmployeeVO) request.getSession().getAttribute("employeeVO"));
%>
<%@ include file="../includes/header.jsp"%>
	<div class="haroo-body">

		<!-- sidebar -->
		<!-- 사이드메뉴 -->
		<div class="p-3 bg-white" style="width: 280px;">
			<a href="/haroo/board/listAction.do"
				class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
				<svg class="bi me-2" width="30" height="24">
					<use xlink:href="#bootstrap"></use></svg> <span class="fs-5 fw-semibold">게시판</span>
			</a>
		</div>
			
	<div class="container">
		<div class="row">
			<form action="/board/register" method="post">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<th colspan="3" style="background: #eeeeee; text-align: center;">게시판 글쓰기</th>
					</tr>

					<tr>
						<td>
						<input type="hidden" class="form-control" name="emNo" value="${employee.emNo}">
						제목 :<input type="text" class="form-control" name="title" placeholder="글 제목" maxlength="50">
						</td>
					</tr>
					<tr>
						<td>작성자 :
							<div class="form-control">${employee.emName}</div>
							<input type="hidden" name="writer" value="${employee.emName}">
						</td>
					</tr>
					<tr>
						<td>내용 <textarea name="contents" class="form-control"
								maxlength="500" placeholder="글 내용" style="height: 350px;"></textarea>
						</td>
				</table>
				<input type="submit" value="글쓰기" class="btn btn-primary float-end">
			</form>
		</div>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
</body>
</html>








