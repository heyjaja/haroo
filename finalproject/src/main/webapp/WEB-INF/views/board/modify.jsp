<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
	<div class="haroo-body">

		<!-- sidebar -->
		<!-- 사이드메뉴 -->
		<div class="p-3 bg-white" style="width: 280px;">
			<a href="/"
				class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
				<svg class="bi me-2" width="30" height="24">
					<use xlink:href="#bootstrap"></use></svg> <span class="fs-5 fw-semibold">Collapsible</span>
			</a>
			<ul class="list-unstyled ps-0">
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#home-collapse"
						aria-expanded="false">Home</button>
					<div class="collapse" id="home-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded">Overview</a></li>
							<li><a href="#" class="link-dark rounded">Updates</a></li>
							<li><a href="#" class="link-dark rounded">Reports</a></li>
						</ul>
					</div>
				</li>
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
						aria-expanded="false">Dashboard</button>
					<div class="collapse" id="dashboard-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded">Overview</a></li>
							<li><a href="#" class="link-dark rounded">Weekly</a></li>
							<li><a href="#" class="link-dark rounded">Monthly</a></li>
							<li><a href="#" class="link-dark rounded">Annually</a></li>
						</ul>
					</div>
				</li>
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#orders-collapse"
						aria-expanded="false">Orders</button>
					<div class="collapse" id="orders-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded">New</a></li>
							<li><a href="#" class="link-dark rounded">Processed</a></li>
							<li><a href="#" class="link-dark rounded">Shipped</a></li>
							<li><a href="#" class="link-dark rounded">Returned</a></li>
						</ul>
					</div>
				</li>
				<li class="border-top my-3"></li>
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#account-collapse"
						aria-expanded="false">Account</button>
					<div class="collapse" id="account-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded">New...</a></li>
							<li><a href="#" class="link-dark rounded">Profile</a></li>
							<li><a href="#" class="link-dark rounded">Settings</a></li>
							<li><a href="#" class="link-dark rounded">Sign out</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>

		<!-- body 영역 -->
		<div class="p-3 container-sm">
			<div calss="container">
				<div class="row">
					<form role="form" action="/board/modify" method="post">
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'> 
						<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'> 
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> 
						<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
						<input type="hidden" name="bdNo" value="${board.bdNo}">
						작성자 :<div class="form-control"> ${board.writer}</div><br> 
						제목 : <input type="text" name="title" class="form-control" maxlength="50" value="${board.title}"><br> 내용 : <br>
						<textarea name="contents" class="form-control" maxlength="500" placeholder="글 내용" style="height: 350px;">${board.contents}</textarea>
						<button type="submit"  data-oper='modify' class="btn btn-primary float-end">수정완료</button>
						
						<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
						<button type="submit" data-oper='list' class="btn btn-info">글 목록</button>
					</form>
				</div>
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
		
		  var formObj = $("form");
		  
		  $('button').on("click", function(e){
			  
		    e.preventDefault(); 
		    
		    var operation = $(this).data("oper");
		    
		    console.log(operation);
		    
		    if(operation === 'remove'){
		      formObj.attr("action", "/board/remove");
		      
		    }else if(operation === 'list'){
		      //move to list
		      formObj.attr("action", "/board/list").attr("method","get");
		      
		      var pageNumTag = $("input[name='pageNum']").clone();
		      var amountTag = $("input[name='amount']").clone();
		      var keywordTag = $("input[name='keyword']").clone();
		      var typeTag = $("input[name='type']").clone();      
		      
		      formObj.empty();
		      
		      formObj.append(pageNumTag);
		      formObj.append(amountTag);
		      formObj.append(keywordTag);
		      formObj.append(typeTag);	  
		      
		    }
		    formObj.submit();
		  });
	
	});
	</script>
</body>
</html>