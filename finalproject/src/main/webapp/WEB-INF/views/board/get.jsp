<%@page import="com.haroo.employee.domain.EmployeeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

		<!-- body 영역 -->
		<div class="p-3 container-sm">
			<div calss="container">
				<div class="row">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3"
									style="background-color: #eeeeee; text-align: center;">
									게시판 글 보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 20%;">제목</td>
								<td colspan="2">${board.title }</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2">${board.writer }</td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2"><fmt:formatDate pattern="yyy-MM-dd" value="${board.regdate}"/></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="2" style="height: 200px; text-align: left;">${board.contents }</td>
							</tr>
						</tbody>
					</table>
					<br>
					<h4>댓글목록</h4>


<!-- 					<table class="table table-striped" -->
<!-- 						style="text-align: center; border: 1px solid #dddddd"> -->
<!-- 						<thead> -->
<!-- 							<tr> -->
						

<!-- 								<td>댓글작성자</td> -->
<!-- 								<td>댓글내용</td> -->
<!-- 								<td>댓글일자</td> -->
<!-- 							</tr> -->
<!-- 						</thead> -->
<!-- 						<tbody> -->
<%-- 						<c:forEach var="reply" items="${replys}"> --%>
<!-- 							<tr> -->
								
<%-- 								<td>${reply.reWriter }</td> --%>
<%-- 								<td>${reply.reContents}</td> --%>
<%-- 								<td>${reply.reRegdate }</td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<!-- 						</tbody> -->
<!-- 					</table> -->
				</div>
			</div>
			<form action="insertReplyAction.do" method="post">
				<input type="hidden" name="bdNo" value="${board.bdNo }">
<%-- 				댓글작성자:<%=employeeVO.getEm_name()%> --%>
<%-- 				<input type="hidden" name="name" value="<%=employeeVO.getEm_name()%>"><br>  --%>
				댓글 내용 : <input type="text" name="reContents"><br> 
				<input type="submit" value="댓글쓰기">
			</form>
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-comments fa-fw"></i> Reply -->
<!-- 				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button> -->
<!-- 			</div> -->
				<button data-oper='list' class="btn btn-primary float-end">목록</button>
				<form id='operForm' action="/board/modify" method="get">
					<input type='hidden' id='bdNo' name='bdNo' value='<c:out value="${board.bdNo}"/>'> 
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> 
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				</form>
<%-- 			<c:if test="${employeeVO.em_name == board.writer}"> --%>
				<a href="/board/modify?bdNo=${board.bdNo}"
					class="btn btn-warning float-end">글수정</a>
				<a href="/board/reomve?bdNo=${board.bdNo}"
					class="btn btn-danger float-end">글삭제</a>
<%-- 			</c:if> --%>
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
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		console.log("replyService");
		
	});
	</script>
	<script>
	console.log("===============");
	console.log("JS TEST");

	var bdnoValue = '<c:out value="${board.bdNo}"/>'; 
	var replyUL = $(".chat");

	 showList(1);
	    
	 function showList(page){
	    	
	    	console.log("show list " + page);
	        
	        replyService.getList({bdno:bdnoValue,page: page|| 1 }, function(replyCnt, list) {
	          
	        console.log("replyCnt: "+ replyCnt );
	        console.log("list: " + list);
	        console.log(list);
	        
	        if(page == -1){
	          pageNum = Math.ceil(replyCnt/10.0);
	          showList(pageNum);
	          return;
	        }
	          
	         var str="";
	         
	         if(list == null || list.length == 0){
	           return;
	         }
	         
	         for (var i = 0, len = list.length || 0; i < len; i++) {
	           str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
	           str +="  <div><div class='header'><strong class='primary-font'>["
	        	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
	           str +="    <small class='pull-right text-muted'>"
	               +replyService.displayTime(list[i].replyDate)+"</small></div>";
	           str +="    <p>"+list[i].reply+"</p></div></li>";
	         }
	         
	         replyUL.html(str);
	         
	         showReplyPage(replyCnt);

	     
	       });//end function
	         
	     }//end showList
	//for replyService add test
	 replyService.add(
	    
	    {reContents:"JS Test", reWriter:"tester", bdNo:bnoValue}
	    ,
	    function(result){ 
	      alert("RESULT: " + result);
	    }
	); 
	</script>
	<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/board/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bdNo").remove();
			operForm.attr("action", "/board/list")
			operForm.submit();

		});
	});
</script>
</body>
</html>