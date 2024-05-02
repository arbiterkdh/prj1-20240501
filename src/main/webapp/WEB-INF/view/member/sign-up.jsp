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


<%--div.container>div.row.justify-content-center>div.col-8--%>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">
            <h3 class="mb-5">회원 가입</h3>
            <form action="/member/sign-up" method="post" onsubmit="return checkValues()">
                <%--              div*3>label.form-label+input.form-control--%>
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">이메일</label>
                    <div class="input-group">
                        <input name="email" id="inputEmail" type="email" class="form-control" required>
                        <%--버튼이 폼 안에 있으면 submit 역할을 하기 때문에 그걸 방지하기 위해 type 을 버튼으로 준다.--%>
                        <button onclick="emailCheck();" type="button" id="buttonEmailCheck"
                                class="btn btn-outline-secondary">중복확인
                        </button>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">패스워드</label>
                    <input oninput="passwordCheck()" name="password" id="inputPassword" type="password"
                           class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="inputPasswordCheck" class="form-label">패스워드 확인</label>
                    <input oninput="passwordCheck()" id="inputPasswordCheck" type="password" class="form-control">
                    <div class="form-text" id="passwordMessage"></div>
                </div>
                <div class="mb-3">
                    <label for="inputNickName" class="form-label">별명</label>
                    <input name="nickName" id="inputNickName" type="text" class="form-control" required>
                </div>
                <div>
                    <button class="btn btn-primary">가입</button>
                </div>

            </form>
        </div>
    </div>
</div>
<script>
    // 함수 내부 로직에서 동기를 맞추는 await 와 같은 키워드를 쓰면 함수 시그니처 앞에 async 를 써줘야 함.
    async function emailCheck() {
        const emailValue = document.querySelector("#inputEmail").value;
        const url = "/member/email?email=" + emailValue;

        // ajax 요청
        const response = await fetch(encodeURI(url));
        // ajax 는 비동기식으로 작업을 처리하기 때문에 동기를 맞추기 위해 await 키워드를 붙임.
        // 특수기호나 한글 등은 그대로 읽을 수 없기 때문에 url encoding 을 해야함

        // 응답 처리
        // console.log(response.text());
        // .text() 는 응답을 텍스트형식으로 볼 수 있는 메소드
        alert(await response.text());
        // 마찬가지로 response 를 기다렸다 출력하기 위해 await 키워드 붙임.
    }

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
