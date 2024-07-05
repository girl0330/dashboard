<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    function message() {
        alert('로그인 후 이용해주세요.');
        window.location = "/user/login";
    }

    function logout() {
        sessionStorage.removeItem("LoginCheck");
        window.location = "/user/logout";
    }
</script>
<style>
    .form-control-dark {
        border-color: var(--bs-gray);
    }
    .form-control-dark:focus {
        border-color: #fff;
        box-shadow: 0 0 0 .25rem rgba(255, 255, 255, .25);
    }

    .text-small {
        font-size: 85%;
    }

    .text-sm {
        font-size: .875rem;
        line-height: 1.25rem;
    }

    .dropdown-toggle:not(:focus) {
        outline: 0;
    }

</style>
<header class="header bg-dark">
<nav class="navbar navbar-static-top navbar-expand-lg header-sticky">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <img class="img-fluid" src="/images/logo.svg" alt="logo">
        </a>
        <div class="navbar-collapse collapse justify-content-start">
            <ul class="nav navbar-nav">
                <c:choose>
                    <c:when test="${sessionScope.userTypeCode == 10}">
                        <a class="nav-link" href="/personal/dashboard" id="navbarDropdown">마이페이지</a>
                    </c:when>
                    <c:when test="${sessionScope.userTypeCode == 20}">
                        <a class="nav-link" href="/business/managePostJob" id="navbarDropdown">마이페이지</a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link" href="#" id="navbarDropdown" onclick="message()">마이페이지</a> <!-- 기본 링크 설정 -->
                    </c:otherwise>
                </c:choose>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/business/postJobList">
                        공고 리스트
                    </a>
                </li>
                <c:if test="${sessionScope.userTypeCode == 20 }">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/javascript:void(0)" data-bs-toggle="dropdown"
                           aria-haspopup="true"
                           aria-expanded="false">
                            기업회원 <i class="fas fa-chevron-down fa-xs"></i>
                        </a>
                        <ul class="dropdown-menu">
<%--                            <li><a class="dropdown-item" href="/business/dashboard">Dashboard</a></li>--%>
                            <li><a class="dropdown-item" href="/business/profile">프로필</a></li>
                            <li><a class="dropdown-item" href="/business/changePassword">비밀번호 변경</a></li>
<%--                            <li><a class="dropdown-item" href="/business/manageCandidate">지원자 관리</a></li>--%>
                            <li><a class="dropdown-item" href="/business/managePostJob">공고 관리</a></li>
                            <li><a class="dropdown-item" href="/business/writePostJob">공고 작성하기</a></li>

                        </ul>
                    </li>
                </c:if>
                <c:if test="${sessionScope.userTypeCode == 10 }">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/javascript:void(0)" data-bs-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            개인회원 <i class="fas fa-chevron-down fa-xs"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/personal/dashboard">Dashboard</a></li>
                            <li><a class="dropdown-item" href="/personal/myProfile">프로필</a></li>
                            <li><a class="dropdown-item" href="/personal/changePassword">비밀번호 변경</a></li>
                            <li><a class="dropdown-item" href="/personal/manageJobs">지원현황</a></li>
                            <li><a class="dropdown-item" href="/dashboard-candidates-saved-jobs.html">관심있는 공고</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
        <div class="add-listing">
            <c:if test="${sessionScope.userNo == null || sessionScope.userNo == 0}">
                <div class="login d-inline-block me-4">
                    <a href="/user/login"><i class="far fa-user pe-2"></i>로그인</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.userNo != null && sessionScope.userNo != 0}">
                <div class="login d-inline-block me-4">
                    <a href="#" onclick="logout();"><i class="far fa-user pe-2"></i>로그아웃</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.userNo == null || sessionScope.userNo == 0}">
                <div class="login d-inline-block me-4">
                    <a href="/user/signup"><i
                            class="far fa-user pe-2"></i>회원가입</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.userTypeCode == 20 }">
                <a class="btn btn-white btn-md" href="/business/writePostJob"> <i class="fas fa-plus-circle"></i>공고 작성</a>
            </c:if>
        </div>
    </div>
</nav>
</header>
<header class="p-3 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a class="navbar-brand" href="/">
                <img class="img-fluid" src="/images/logo-dark.svg" alt="logo">
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2 link-secondary">Overview</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Inventory</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Customers</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Products</a></li>
            </ul>

            <div class="col-md-3 text-end me-2">
                <button type="button" class="btn btn-outline-primary rounded-pill me-2">로그인</button>
                <button type="button" class="btn btn-primary rounded-pill px-3">회원가입</button>
            </div>


            <div class="text-end me-2">
                <a href="#" class="d-inline-flex link-body-emphasis text-decoration-none">
                    <img src="/images/svg/icon-bookmark.svg" alt="mdo" width="24" height="24" class="rounded-circle">
                </a>
            </div>
            <div class="text-end  me-2">
                <a href="#" class="d-inline-flex link-body-emphasis text-decoration-none">
                    <img src="/images/svg/bel.svg" alt="mdo" width="24" height="24" class="rounded-circle">
                </a>
            </div>

            <div class="dropdown text-end">
                <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="/images/svg/icon-profile.svg" alt="mdo" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu gap-1 p-2 rounded-3 mx-0 shadow w-220px" data-bs-theme="light">
                    <li class="dropdown-header text-sm">내 계정</li>
                    <li>
                        <a class="dropdown-item text-sm d-flex gap-2 align-items-center" href="#">
                            <img src="/images/svg/icon-person.svg" alt="mdo" width="20" height="20" class="bi">
                            프로필
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item text-sm d-flex gap-2 align-items-center" href="#">
                            <img src="/images/svg/icon-gear.svg" alt="mdo" width="20" height="20" class="bi">
                            계정 관리
                        </a>
                    </li>

                    <li>
                        <a class="dropdown-item text-sm d-flex gap-2 align-items-center" href="#">
                            <img src="/images/svg/icon-clock-history.svg" alt="mdo" width="20" height="20" class="bi">
                            활동내역
                        </a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li class="dropdown-header text-sm">Jobs</li>
                    <li>
                        <a class="dropdown-item text-sm dropdown-item-danger d-flex gap-2 align-items-center" href="#">
                            <img src="/images/svg/icon-file-earmark-text.svg" alt="mdo" width="20" height="20" class="bi">
                            이력서 관리
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item text-sm dropdown-item-danger d-flex gap-2 align-items-center" href="#">
                            <img src="/images/svg/icon-people.svg" alt="mdo" width="20" height="20" class="bi">
                            구직 내역 관리
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item text-sm dropdown-item-danger d-flex gap-2 align-items-center" href="#">
                            <img src="/images/svg/icon-bookmark.svg" alt="mdo" width="20" height="20" class="bi">
                            관심 포지션
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item text-sm dropdown-item-danger d-flex gap-2 align-items-center" href="#">
                            <img src="/images/svg/icon-briefcase.svg" alt="mdo" width="20" height="20" class="bi">
                            포지션 지원이력
                        </a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a class="dropdown-item text-sm dropdown-item-danger d-flex gap-2 align-items-center" href="#">
                            <img src="/images/svg/icon-box-arrow-right.svg" alt="mdo" width="20" height="20" class="bi">
                            로그아웃
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
