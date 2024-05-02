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

<form action="/member/modify" method="post">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-8">
                <div>
                    <div class="mb-3">
                        <label for="inputEmail" class="form-label">이메일</label>
                        <input id="inputEmail" name="email" type="email" class="form-control" value="${member.email}">
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">패스워드</label>
                        <input id="inputPassword" name="password" type="text" class="form-control"
                               value="${member.password}">
                    </div>
                    <div class="mb-3">
                        <label for="inputNickName" class="form-label">별명</label>
                        <input id="inputNickName" name="nickName" type="text" class="form-control"
                               value="${member.nickName}">
                    </div>
                    <div>
                        <button class="btn btn-primary">수정</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</form>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
