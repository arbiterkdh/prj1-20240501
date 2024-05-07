<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-expand-lg bg-body-tertiary mb-5">
    <div class="container">
        <a class="navbar-brand" href="/">PROJECT</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/">
                        목록
                    </a>
                </li>
                <sec:authorize access="isAuthenticated()">
                    <sec:authorize access="hasAuthority('admin')">
                        <li class="nav-item">
                            <a class="nav-link" href="/member/list">
                                회원목록
                            </a>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="not hasAuthority('admin')">
                        <sec:authentication property="principal.member" var="authMember"/>
                        <li class="nav-item">
                            <a class="nav-link" href="/member?id=${authMember.id}">
                                내정보
                            </a>
                        </li>
                    </sec:authorize>
                    <li class="nav-item">
                        <a class="nav-link" href="/add">
                            글쓰기
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">
                            로그아웃
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="not isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/member/sign-up">
                            회원가입
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/member/login">
                            로그인
                        </a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>
