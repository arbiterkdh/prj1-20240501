<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">

            <h3 class="mb-5">회원 정보 변경</h3>
            <form action="/member/modify" method="post" onsubmit="return checkValues()">
                <%--div.mb-3*2>label.form-label+input.form-control[name][value]--%>
                <input type="hidden" name="id" value="${member.id}">
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">
                        이메일
                    </label>
                    <input class="form-control-plaintext" type="email" id="inputEmail"
                           value="${member.email}" readonly>

                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">패스워드</label>
                    <input oninput="passwordCheck()" id="inputPassword" type="password" class="form-control"
                           name="password"
                           value="">
                </div>
                <div class="mb-3">
                    <label for="inputPasswordCheck" class="form-label">패스워드 재입력</label>
                    <input oninput="passwordCheck()" id="inputPasswordCheck" type="password" class="form-control"
                           value="">
                    <div id="passwordMessage" class="form-text"></div>
                    <div class="mb-3">
                        <label for="inputNickName" class="form-label">별명</label>
                        <input id="inputNickName" type="text" class="form-control" name="nickName"
                               value="${member.nickName}">
                    </div>
                    <div class="mb-3">
                        <button class="btn btn-secondary">변경</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function passwordCheck() {
        const password = document.querySelector("#inputPassword").value;
        const passwordCheck = document.querySelector("#inputPasswordCheck").value;

        if (password != passwordCheck) {
            // 메시지 보여주기
            document.querySelector("#passwordMessage").textContent = "패스워드가 일치하지 않습니다."
        } else {
            document.querySelector("#passwordMessage").textContent = "패스워드가 일치합니다."
        }
    }

    function checkValues() {
        const password = document.getElementById("inputPassword").value;
        const passwordCheck = document.getElementById("inputPasswordCheck").value;

        if (password != "" && password == passwordCheck) {
            return true;
        } else {
            alert("패스워드가 일치하지 않습니다.");
            return false;
        }
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
