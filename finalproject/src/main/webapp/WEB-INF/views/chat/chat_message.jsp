<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp"%>

    <!-- 사이드바 css --><link rel="stylesheet" href="../resources/css/sidebar.css" />

    <style type="text/css">
        .haroo-body {
            display: flex;
        }
    </style>
    	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet"	href="../resources/css/custom.css"></link>
<div class="haroo-body">

<!-- sidebar -->
<!-- 사이드메뉴 -->
  <div class="p-3 bg-white" style="width: 280px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-5 fw-semibold">Collapsible</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
          Home
        </button>
        <div class="collapse" id="home-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">Overview</a></li>
            <li><a href="#" class="link-dark rounded">Updates</a></li>
            <li><a href="#" class="link-dark rounded">Reports</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          Dashboard
        </button>
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
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
          Orders
        </button>
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
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          Account
        </button>
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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<div class="container app">
	  <div class="row app-one">
	    <div class="col-sm-4 side">	 
	      <div class="side-one">
	        <div class="row heading">
	          <div class="col-sm-3 col-xs-3 heading-avatar">
	            <div class="heading-avatar-icon">
	              <img src="https://bootdey.com/img/Content/avatar/avatar1.png">
	            </div>
	          </div>
	          <div class="col-sm-1 col-xs-1  heading-dot  pull-right">
	            <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
	          </div>
	          <div class="col-sm-2 col-xs-2 heading-compose  pull-right">
	            <i class="fa fa-comments fa-2x  pull-right" aria-hidden="true"></i>
	          </div>
	        </div>
	
	        <div class="row searchBox">
	          <div class="col-sm-12 searchBox-inner">
	            <div class="form-group has-feedback">
	              <input id="searchText" type="text" class="form-control" name="searchText" placeholder="Search">
	              <span class="glyphicon glyphicon-search form-control-feedback"></span>
	            </div>
	          </div>
	        </div>
	
	        <div class="row sideBar">
	        <c:forEach items="${chatlist}" var="chat">
		        <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
		              <div class="avatar-icon">
		                <img src="https://bootdey.com/img/Content/avatar/avatar1.png">
		              </div>
		          </div>
		            <div class="col-sm-9 col-xs-9 sideBar-main">
		              <div class="row">
		                <div class="col-sm-8 col-xs-8 sideBar-name">
		                <%--   <span class="name-meta"><c:out value="${chat.em_name}"/>
		                </span> --%>
		                <a href='/chat/get?bno=<c:out value="${chat.em_no}"/>'><c:out value="${chat.em_no}"/></a>
		                </div>
		                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
		                  <span class="time-meta pull-right">18:18
		                </span>
		                </div>
		              </div>
		            </div>
		          </div>
	          
	        </c:forEach>
	        
	        
	        
	        
	
	        </div>
	        
	      </div>
	
	      <div class="side-two">
	        <div class="row newMessage-heading">
	          <div class="row newMessage-main">
	            <div class="col-sm-2 col-xs-2 newMessage-back">
	              <i class="fa fa-arrow-left" aria-hidden="true"></i>
	            </div>
	            <div class="col-sm-10 col-xs-10 newMessage-title">
	              New Chat
	            </div>
	          </div>
	        </div>
	
	        <div class="row composeBox">
	          <div class="col-sm-12 composeBox-inner">
	            <div class="form-group has-feedback">
	              <input id="composeText" type="text" class="form-control" name="searchText" placeholder="Search People">
	              <span class="glyphicon glyphicon-search form-control-feedback"></span>
	            </div>
	          </div>
	        </div>
	
	        <div class="row compose-sideBar">
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar1.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar2.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar3.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar4.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar5.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar6.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar2.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar3.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar4.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="row sideBar-body">
	            <div class="col-sm-3 col-xs-3 sideBar-avatar">
	              <div class="avatar-icon">
	                <img src="https://bootdey.com/img/Content/avatar/avatar5.png">
	              </div>
	            </div>
	            <div class="col-sm-9 col-xs-9 sideBar-main">
	              <div class="row">
	                <div class="col-sm-8 col-xs-8 sideBar-name">
	                  <span class="name-meta">John Doe
	                </span>
	                </div>
	                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
	                  <span class="time-meta pull-right">18:18
	                </span>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	
	    <div class="col-sm-8 conversation">
	      <div class="row heading">
	        <div class="col-sm-2 col-md-1 col-xs-3 heading-avatar">
	          <div class="heading-avatar-icon">
	            <img src="https://bootdey.com/img/Content/avatar/avatar6.png">
	          </div>
	        </div>
	        <div class="col-sm-8 col-xs-7 heading-name">
	          <a class="heading-name-meta">John Doe
	          </a>
	          <span class="heading-online">Online</span>
	        </div>
	        <div class="col-sm-1 col-xs-1  heading-dot pull-right">
	          <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
	         
	        </div>
	        
	 
	      </div>


	
		
		
	      <div class="row message" id="conversation">
	        <div class="row message-previous">
	          <div class="col-sm-12 previous">
	            <a onclick="previous(this)" id="ankitjain28" name="20">
	            Show Previous Message!
	            </a>
	          </div>
	        </div>
		<div class = "sender">안녕?</div>
		<div class="sender">
					 <input class="form-control" name='title'
						value='<c:out value="${chat.ch_no }"/>' readonly="readonly">
		</div>
		
<%-- 		<div class="sender">
				 <input class="form-control" name='bno'
						value='<c:out value="${chatlist.em_name }"/>' readonly="readonly">
				</div> --%>
	        <div class="row message-body">
	        
	          <div class="col-sm-12 message-main-receiver">
					
	          </div>
	        </div>
	
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-sender">

	          </div>
	          
	        </div>
	       
	      </div>
	<!--        <form action="fileUploadAction.do" method="post" enctype="multipart/form-data">	
	        	<input type="file"	name="contentsName"><br>
	        	<input type="submit" value="업로드"><br>
	        	</form>
	      <div>
	       	 <a href="/haroo/chat_video1.html" class="chat_video">
	       	 	<button>영상통화</button>
	       	 </a>
	      </div> -->
	 
	      <div class="row reply">
	        <div class="col-sm-1 col-xs-1 reply-emojis">
	          <i class="fa fa-smile-o fa-2x"></i>
	        </div>
			<input class="col-sm-9 col-xs-9 reply-main" type="text" placeholder="Type a Message"/>
<!--  		   <div class="col-sm-9 col-xs-9 reply-main">
	          <textarea class="form-control" rows="1" id="comment"></textarea>
	        </div> -->
	        <div class="col-sm-1 col-xs-1 reply-recording">
	          <i class="fa fa-microphone fa-2x" aria-hidden="true"></i>
	        </div>
<!-- 	        <div class="col-sm-1 col-xs-1 reply-send">
	          <i class="fa fa-send fa-2x" aria-hidden="true"></i>
	        </div> -->
	        <button class="col-sm-1 col-xs-1 reply-send" type="button">
	          <i class="fa fa-send fa-2x" aria-hidden="true"></i>
	        </button>
	      </div>
	    </div>
	  </div>
	</div>

 </div>
 	    	      	                 	     <!-- session ID hidden -->
		<div class = "yourName" id="yourName">
			<input type="hidden" id="sessionId" value="">
			<input type="text" name="userName" id="userName">
			<th><button onclick="wsOpen()" id="startBtn">이름 등록</button></th>
		</div>
</div>


<div class="container">
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <p class="col-md-4 mb-0 text-muted">&copy; 2021 Company, Inc</p>

        <a href="/haroo" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <h3>haroo</h3>
        </a>

    </footer>
</div>
<form id='actionForm' action="/chat/get" method='get'>

</form>
<%@include file="../includes/footer.jsp"%>
	<script src="/resources/js/chat.js"></script>
	<script type="text/javascript">
	$(function(){
	    $(".heading-compose").click(function() {
	      $(".side-two").css({
	        "left": "0"
	      });
	    });

	    $(".newMessage-back").click(function() {
	      $(".side-two").css({
	        "left": "-100%"
	      });
	    });
	})
	
	var ws;

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chatting");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#conversation").append("<div class='sender'>" + d.msg + "</div>");	
					}else{
						$("#conversation").append("<div class='receiver'>" + d.userName + "" + d.msg + "</div>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
		
		document.querySelector(".reply-send").addEventListener("click", function(e){
			send();
		})

	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
		}
	}

	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $(".reply-main").val()
		}
		ws.send(JSON.stringify(option))
		$('.reply-main').val("");
	}
	
	var actionForm = $("#actionForm");
	
	$(".name-meta").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='Long' name='em_no' value='"
			+ $(this).attr("href")+ "'>");
				actionForm.attr("action", "/chat/get");
				actionForm.submit();

		


});
	</script>