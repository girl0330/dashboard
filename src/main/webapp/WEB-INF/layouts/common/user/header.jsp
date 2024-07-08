<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

    function logout() {
        sessionStorage.removeItem("LoginCheck");
        window.location = "/user/logout";
    }

    function alarm() {
        alert("클릭?")
        const options = {
            url: '/business/api/alramList',
            type: 'GET',
            contentType: 'application/json',
            data: "",
            done: (response) => {
                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                console.log(JSON.stringify(response));

            },
        };
        ajax.call(options);
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

    .dropdown-menu {
        z-index: 1050;
    }

    .text-sm {
        font-size: .875rem;
        line-height: 1.25rem;
    }

    .dropdown-toggle:not(:focus) {
        outline: 0;
    }

</style>

<header class="border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a class="navbar-brand" href="/">
                <img class="img-fluid" src="/images/logo-dark.svg" alt="logo">
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li class="nav-item dropdown ">
                    <a class="nav-link text-dark" href="/business/postJobList">
                        공고 리스트
                    </a>
                </li>

            </ul>

            <div class="col-md-6 text-end me-2">
                <c:if test="${sessionScope.userNo == null || sessionScope.userNo == 0}">
                    <button type="button" class="btn btn-outline-primary rounded-pill me-2 px-4" onclick="window.location.href='/user/login'">로그인</button>
                    <button type="button" class="btn btn-outline-primary rounded-pill me-2 px-3" onclick="window.location.href='/user/signup'">회원가입</button>
                </c:if>
            </div>

            <c:if test="${sessionScope.userNo != null && sessionScope.userNo != 0}">
                <div class="text-end me-2">
                    <a href="/personal/likedJobs" class="d-inline-flex link-body-emphasis text-decoration-none">
                        <img src="/images/svg/icon-bookmark.svg" alt="mdo" width="24" height="24">
                    </a>
                </div>
                <div class="text-end me-2">
                    <a href="#" class="d-inline-flex link-body-emphasis text-decoration-none" onclick="alarm()" >
                        <img src="/images/svg/bel.svg" alt="mdo" width="24" height="24" class="rounded-circle">
                    </a>
                </div>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-body-emphasis text-decoration-none" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="/images/svg/icon-profile.svg" alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                    <ul class="dropdown-menu gap-1 p-2 rounded-3 mx-0 shadow w-220px" data-bs-theme="light">
                        <li class="dropdown-header text-sm">내 계정</li>
                        <li>
                            <a class="dropdown-item text-sm d-flex gap-2 align-items-center" href="/personal/myProfile">
                                <img src="/images/svg/icon-person.svg" alt="mdo" width="20" height="20" class="bi">
                                프로필
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <c:if test="${sessionScope.userTypeCode == 10 }">
                            <li class="dropdown-header text-sm">개인회원</li>
                            <li>
                                <a class="dropdown-item text-sm d-flex gap-2 align-items-center" href="/personal/manageJobs">
                                    <img src="/images/svg/icon-file-earmark-text.svg" alt="mdo" width="20" height="20" class="bi">
                                    공고지원 관리
                                </a>
                            </li>

                            <li>
                                <a class="dropdown-item text-sm d-flex gap-2 align-items-center" href="/personal/likedJobs">
                                    <img src="/images/svg/icon-bookmark.svg" alt="mdo" width="20" height="20" class="bi">
                                    관심공고 관리
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.userTypeCode == 20 }">
                            <li class="dropdown-header text-sm">기업회원</li>
                            <li>
                                <a class="dropdown-item text-sm dropdown-item-danger d-flex gap-2 align-items-center" href="/business/writePostJob">
                                    <img src="/images/svg/pen.svg" alt="mdo" width="17" height="17" class="bi">
                                    공고작성
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item text-sm dropdown-item-danger d-flex gap-2 align-items-center" href="/business/managePostJob">
                                    <img src="/images/svg/icon-file-earmark-text.svg" alt="mdo" width="20" height="20"
                                         class="bi">
                                    작성공고 관리
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </c:if>

                        <li>
                            <a class="dropdown-item text-sm dropdown-item-danger d-flex gap-2 align-items-center" onclick="logout();" href="#">
                                <img src="/images/svg/icon-box-arrow-right.svg" alt="mdo" width="20" height="20" class="bi">
                                로그아웃
                            </a>
                        </li>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
</header>
