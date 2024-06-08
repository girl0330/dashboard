<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    function message() {
        alert('로그인 후 이용해주세요.');
        window.location = "/user/login";
    }
</script>
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
                        <a class="nav-link" href="/business/dashboard" id="navbarDropdown">마이페이지</a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link" href="#" id="navbarDropdown" onclick="message()">마이페이지</a> <!-- 기본 링크 설정 -->
                    </c:otherwise>
                </c:choose>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/business/list">
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
                            <li><a class="dropdown-item" href="/employer-grid.html">Employer Grid</a></li>
                            <li><a class="dropdown-item" href="/employer-listing.html">Employer list</a></li>
                            <li><a class="dropdown-item" href="/employer-detail.html">Employer detail</a></li>
                            <li><a class="dropdown-item" href="/employer-listing-map.html">Employer Listing Map</a></li>
                            <li class="dropdown-submenu">
                                <a class="dropdown-item dropdown-toggle" href="/javascript:void(0)">Dashboard <i
                                        class="fas fa-chevron-right fa-xs"></i></a>
                                <ul class="dropdown-menu left-side">
                                    <li><a class="dropdown-item" href="/business/dashboard">Dashboard</a></li>
                                    <li><a class="dropdown-item" href="/business/profile">프로필</a></li>
                                    <li><a class="dropdown-item" href="/business/changePassword">비밀번호 변경</a></li>
                                    <li><a class="dropdown-item" href="/business/manageCandidate">지원자 관리</a></li>
                                    <li><a class="dropdown-item" href="/business/managePostJob">게시글 관리</a></li>
                                    <li><a class="dropdown-item" href="/business/postAJob">공고 작성하기</a></li>
                                </ul>
                            </li>
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
                            <li><a class="dropdown-item" href="/candidates-grid.html">Candidates Grid</a></li>
                            <li><a class="dropdown-item" href="/candidates-listing.html">Candidates list</a></li>
                            <li><a class="dropdown-item" href="/candidate-detail.html">Candidates detail</a></li>
                            <li><a class="dropdown-item" href="/candidates-listing-map.html">Candidates Listing
                                Map</a></li>
                            <li class="dropdown-submenu">
                                <a class="dropdown-item dropdown-toggle" href="/javascript:void(0)">Dashboard <i
                                        class="fas fa-chevron-right fa-xs"></i></a>
                                <ul class="dropdown-menu left-side">
                                    <li><a class="dropdown-item" href="/personal/dashboard">Dashboard</a></li>
                                    <li><a class="dropdown-item" href="/personal/myProfile">프로필</a></li>
                                    <li><a class="dropdown-item" href="/personal/changePassword">비밀번호 변경</a></li>
                                    <li><a class="dropdown-item" href="/dashboard-candidates-my-resume.html">내
                                        이력서</a></li>
                                    <li><a class="dropdown-item" href="/personal/manageJobs">지원현황</a></li>
                                    <li><a class="dropdown-item" href="/dashboard-candidates-saved-jobs.html">관심있는
                                        공고</a></li>
                                    <li><a class="dropdown-item"
                                           href="/dashboard-candidates-pricing.html">Pricing</a></li>
                                </ul>
                            </li>
                            <li><a class="dropdown-item" href="/my-resume.html">My Resume <span
                                    class="badge bg-danger ms-2">CV</span></a></li>
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
                    <a href="/user/logout"><i
                            class="far fa-user pe-2"></i>로그아웃</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.userNo == null || sessionScope.userNo == 0}">
                <div class="login d-inline-block me-4">
                    <a href="/user/signup"><i
                            class="far fa-user pe-2"></i>회원가입</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.userTypeCode == 10 }">
                <a class="btn btn-white btn-md" href="/business/postAJob"> <i class="fas fa-plus-circle"></i>공고 작성</a>
            </c:if>
        </div>
    </div>
</nav>
