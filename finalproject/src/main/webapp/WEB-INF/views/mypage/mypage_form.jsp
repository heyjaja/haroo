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
    <h1 class="h3 mb-3 fw-normal">${employee.em_name}님의 마이페이지</h1>

    <form:form action="/haroo/mypage/update-information" method="patch">
        <div class="form-floating">
            <input type="hidden" id="floatingEmNo" name="em_no" value="${employee.em_no}">
            사원번호 : ${employee.em_no}
        </div>
        <div class="form-floating">
            직책번호 : ${employee.po_no}
        </div>
        <div class="form-floating">
            부서번호 : ${employee.de_no}
        </div>
        <div class="form-floating">
            사원이름 : ${employee.em_name}
        </div>
        <div class="form-floating">
            내선전화 : ${employee.em_ext}
        </div>
        <div class="form-floating">
            입사일 : ${employee.em_first}
        </div>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingPhone" placeholder="${employee.em_phone}"
                   name="em_phone" value="${employee.em_phone}">
            <label for="floatingPhone">휴대 전화</label>
        </div>
        <div class="form-floating">
            <input type="email" class="form-control" id="floatingEmail" placeholder="${employee.em_email}"
                   name="em_email" value="${employee.em_email}">
            <label for="floatingEmail">이메일</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="${employee.em_pw}"
                   name="em_pw" value="${employee.em_pw}">
            <label for="floatingPassword">패스워드</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" onclick=modifyInfo() type="button">수정하기</button>
        <script>
            function modifyInfo() {
                let em_no = $('#floatingEmNo').val();
                let em_phone = $('#floatingPhone').val();
                let em_email = $('#floatingEmail').val();
                let em_pw = $('#floatingPassword').val();

                let data = {
                    "em_phone": em_phone,
                    "em_email": em_email,
                    "em_pw": em_pw,
                    "em_no": em_no
                };

                $.ajax({
                    type: 'patch',
                    url: '/haroo/mypage/update-information',
                    contentType: 'application/json; charset=UTF-8',
                    dataType: 'json',
                    data: JSON.stringify(data),
                    success: function (result, status, xhr) {
                        if (result) {
                            $('#floatingPhone').text(result.em_phone);
                            $('#floatingEmail').text(result.em_email);
                            $('#floatingPassword').text(result.em_pw);

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
