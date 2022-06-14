<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

		<!-- body 영역 -->
		<div class="p-3 container-sm">
			<div class="container">
				<div class="row">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td>글번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일자</td>
							<td>조회수</td>
						</tr>

						<c:forEach var="board" items="${list}">
							<tr>
								<td>${board.bdNo}</td>
								<td><a class='move' href='<c:out value="${board.bdNo}"/>'>${board.title}</a></td>
								<td>${board.writer}</td>
<%-- 								<td>${board.regdate}</td> --%>
								<td><fmt:formatDate pattern="yyy-MM-dd" value="${board.regdate}"/></td>
								<td>${board.hitcount}</td>
							</tr>
						</c:forEach>
					</table>
					
					<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/board/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>
				</div>

				<a href="/board/register" class="btn btn-primary float-end">글쓰기</a> <br>
				
				<div class="page_wrap">
					<ul class="page_nation">
					<c:if test="${pageMaker.prev}">
					<li class="arrow prev">
						<a href="${pageMaker.startPage - 1}">[이전]</a>
						</li>
					</c:if>
					

					<!-- 	페이지 목록 출력 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page_nation  ${pageMaker.cri.pageNum == num ? "active":""} ">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach> 

					<!-- 	이후영역 -->
					
					<c:if test="${pageMaker.next}">
						<li class="arrow next">
						<a href="${pageMaker.endPage + 1}">[이후]</a>
						</li>
	
					</c:if>
					</ul>

<!-- 					<form action="listAction.do" method="get"> -->
<!-- 						<input type="checkbox" name="area" value="bd_title"> 제목 <input -->
<!-- 							type="checkbox" name="area" value="bd_writer"> 작성자 <input -->
<!-- 							type="text" name="searchKey" size="10"> <input -->
<!-- 							type="submit" value="검색"> -->
<!-- 					</form> -->
			</div> 
			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			</form>
		<!-- Modal  추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					</div>
					<div class="modal-body">처리가 완료되었습니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
			</div>
		</div>

	</div>


	<div class="container">
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<p class="col-md-4 mb-0 text-muted">&copy; 2021 Company, Inc</p>

			<a href="/haroo"
				class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
				<h3>haroo</h3>
			</a>

		</footer>
	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>	
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<script type="text/javascript">
	$(document).ready(function() {
		
		var actionForm = $("#actionForm");

		$(".page_nation a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
			});
		
		$(".move").on("click", function(e) {

			e.preventDefault();
			actionForm.append("<input type='hidden' name='bdNo' value='"+ 
				$(this).attr("href")+ "'>");
				actionForm.attr("action", "/board/get");
				actionForm.submit();
			});
		
		var searchForm = $("#searchForm");

		$("#searchForm button").on("click", function(e) {

			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']")	.val("1");
			e.preventDefault();

			searchForm.submit();

			});
		
	});
	</script>
	
</body>
</html>