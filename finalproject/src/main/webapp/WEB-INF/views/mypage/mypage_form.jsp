<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../includes/header.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<main class="form-signin">
    <img class="mb-4" src="/resources/img/haroo-main.png" alt="" width="144" height="100">
    <h1 class="h3 mb-3 fw-normal">${employee.emName}님의 마이페이지</h1>

    <form:form action="/mypage/update-information" method="patch">
        <div class="form-floating">
            <input type="hidden" id="floatingEmNo" name="emNo" value="${employee.emNo}">
            사원번호 : ${employee.emNo}
        </div>
        <div class="form-floating">
            직책번호 : ${employee.poNo}
        </div>
        <div class="form-floating">
            부서번호 : ${employee.deNo}
        </div>
        <div class="form-floating">
            사원이름 : ${employee.emName}
        </div>
        <div class="form-floating">
            내선전화 : ${employee.emExt}
        </div>
        <div class="form-floating">
            입사일 : ${employee.emFirst}
        </div>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingPhone" placeholder="${employee.emPhone}"
                   name="emPhone" value="${employee.emPhone}">
            <label for="floatingPhone">휴대 전화</label>
        </div>
        <div class="form-floating">
            <input type="email" class="form-control" id="floatingEmail" placeholder="${employee.emEmail}"
                   name="emEmail" value="${employee.emEmail}">
            <label for="floatingEmail">이메일</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="${employee.emPw}"
                   name="emPw" value="${employee.emPw}">
            <label for="floatingPassword">패스워드</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" onclick=modifyInfo() type="button">수정하기</button>
        <script>
            function modifyInfo() {
                let emNo = $('#floatingEmNo').val();
                let emPhone = $('#floatingPhone').val();
                let emEmail = $('#floatingEmail').val();
                let emPw = $('#floatingPassword').val();

                let data = {
                    "emPhone": emPhone,
                    "emEmail": emEmail,
                    "emPw": emPw,
                    "emNo": emNo
                };

                $.ajax({
                    type: 'patch',
                    url: '/mypage/update-information',
                    contentType: 'application/json; charset=UTF-8',
                    dataType: 'json',
                    data: JSON.stringify(data),
                    success: function (result, status, xhr) {
                        if (result) {
                            $('#floatingPhone').text(result.emPhone);
                            $('#floatingEmail').text(result.emEmail);
                            $('#floatingPassword').text(result.emPw);

                            $('#myModal').modal('show');
                        }
                    },
                    error: function (xhr, status, err) {
                        console.error(err);
                    }
                });
            }
        </script>
    </form:form>

    <!-- Modal -->
    <div id="myModal" class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>수정이 완료되었습니다 :)</p>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeModal" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <p class="mt-5 mb-3 text-muted">&copy; 2022</p>
</main>

<%@ include file="../includes/footer.jsp" %>