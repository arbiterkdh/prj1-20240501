<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>

        table {
            width: 100%;
        }

        th {
            font-size: 1.1em;
            background-color: darkolivegreen;
            color: whitesmoke;
            line-height: 40px;
        }

        table, tr, th, td {
            padding: 2px;
            border-collapse: collapse;
            border: 1px solid black;
        }

        tbody {
            background-color: whitesmoke;
        }

        a {
            color: black;
        }
    </style>
</head>
<body>
<h2>게시물 목록</h2>
<table>
    <thead>
    <tr>
        <th style="width: 4%">#</th>
        <th style="width: 66%">제목</th>
        <th style="width: 12%">작성자</th>
        <th>작성일시</th>
    </tr>
    </thead>
    <tbody style="line-height: 25px; text-indent: 2px">
    <c:forEach items="${boardList}" var="board">
        <%--        todo : 제목을 클릭하면 해당 게시물 보는 화면으로 이동 하도록 수정 --%>
        <tr>
            <td style="text-align: right">${board.id}</td>
            <td>
                <a href="/board?id=${board.id}">${board.title}</a>
            </td>
            <td>${board.writer}</td>
            <td>${board.inserted}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
