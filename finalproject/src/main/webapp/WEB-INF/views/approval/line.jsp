<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재선 선택</title>
<!-- Bootstrap CSS -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
  crossorigin="anonymous">
<!-- 사이드바 css -->
<link rel="stylesheet" href="/resources/css/sidebar.css" />
<!-- 전자결재 css -->
<link rel="stylesheet" href="/resources/css/approval-styles.css" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
  crossorigin="anonymous"></script>

</head>
<body>
  <div class="input-group input-group-sm m-2 col-2" style="width: 250px;">
      <span class="input-group-text">이름 검색</span>
      <input class="form-control" type="text" id="ap-alist-search" />
  </div>
  <div class="ap-alist-container m-2">
    <div class="ap-alist-left accordion accordion-sm">
      <ul class="ap-alist accordion-item list-group">
        <c:forEach var="item" items="${map}" varStatus="vs">
          <li class="accordion-header">
          <button class="accordion-button collapsed" data-bs-toggle="collapse" href="#col${vs.index }" aria-expanded="false">
            ${item.key }
          </button></li>
          <div class="collapse" id="col${vs.index }">
            <ul class="m-2">
              <c:forEach var="emp" items="${item.value }">
                <li class="ap-alist-name">
                    ${emp.emName } ${emp.poName }
                    <button type="button" class="btn btn-sm ms-1 mb-1">추가</button>
                    <input type="hidden" class="ap-hidden-emNo" name="emNo" value="${emp.emNo }" /> 
                    <input type="hidden" class="ap-hidden-emName" name="emName" value="${emp.emName }" /> 
                    <input type="hidden" name="poName" value="${emp.poName }" />
                    <input type="hidden" class="ap-hidden-deName" name="deName" value="${emp.deName }">
                </li>
              </c:forEach>
            </ul>
          </div>
        </c:forEach>
      </ul>
    </div>
    <div class="ap-alist-select">
      <div id="ap-alist-selected-sticky">
        <div id="ap-alist-selected"></div>
        <button type="button" class="ap-form-btn">선택</button>
      </div>
    </div>
  </div>
  <!-- Option 1: Bootstrap Bundle with Popper -->
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>

  <!-- 전자결재 script -->
  <script type="text/javascript" src="/resources/js/approval.js"></script>
  <script type="text/javascript">
  
  //결재선 검색
  const lineSearch = document.getElementById("ap-alist-search");

  lineSearch.addEventListener("keyup", filter);

  function filter() {
    let keyword, name, item, i;
    
    keyword = document.getElementById("ap-alist-search").value;
    item = document.getElementsByClassName("ap-alist-name");
    
    for(i = 0; i<item.length; i++) {
      name = item[i].textContent;
      
      
      
      if(name.indexOf(keyword) > -1) {
        
        item[i].style.display = "block";
        
        if(keyword != "") {
          item[i].parentNode.parentNode.className = "collapse show";
        } else {
          item[i].parentNode.parentNode.className = "collapse";
        }
        
      } else {
        item[i].style.display = "none";
      }
      
    }
  }
  </script>
</body>
</html>