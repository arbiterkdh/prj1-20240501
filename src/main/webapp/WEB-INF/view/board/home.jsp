<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, tr, th, td {
            border-collapse: collapse;
            border: 1px solid black;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<h3>게시물 목록</h3>
<table>
    <thead>
    <tr>
        <th>#</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일시</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${boardList}" var="board">
        <c:url value="/board" var="viewLink">
            <c:param name="id" value="${board.id}"/>
        </c:url>
        <tr>
            <td>${board.id}</td>
            <td>
                <a href="${viewLink}">
                        ${board.title}
                </a>
            </td>
            <td>${board.writer}</td>
            <td>${board.inserted}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
