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

<%--div.container>div.row>div.col-6--%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">


            <h3 class="mb-5">새 게시물 작성</h3>
            <form action="/add" method="post">

                <div class="mb-3">
                    <%--                    label.form-label--%>
                    <label for="inputTitle" class="form-label">
                        제목
                    </label>
                    <input class="form-control" id="inputTitle" type="text" name="title" required>
                </div>
                <div class="mb-3">
                    <label for="inputTextarea" class="form-label">
                        본문
                    </label>
                    <textarea class="form-control" name="content" id="inputTextarea" cols="30" rows="10"
                              required></textarea>
                </div>
                <div class="mb-3">
                    <label for="inputWriter" class="form-label">
                        작성자
                    </label>
                    <input class="form-control" id="inputWriter" type="text" name="writer" required>
                </div>
                <div>
                    <button class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
