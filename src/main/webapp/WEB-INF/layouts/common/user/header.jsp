<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

    function logout() {
        sessionStorage.removeItem("LoginCheck");
        window.location = "/user/logout";
    }

    function notification() {
        const options = {
            url: '/business/api/notificationList',
            type: 'GET',
            contentType: 'application/json',
            data: "",
            done: (response) => {
                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                console.log(JSON.stringify(response));

                notificationList(response);
            },
        };
        ajax.call(options);
    }
    function notificationList(response) {
        console.log("확인 :::  " + JSON.stringify(response));

        const container = $("#notificationList");
        container.empty();

        response.forEach((item, index) => {
            const hrefUrl = item.userTypeCode === 10 ? '/personal/manageJobs' : '/business/managePostJob';
            const isLastItem = index === response.length - 1;
            const notificationHtml =
                '<li>' +
                   '<a class="dropdown-item custom-dropdown-item" href="' + hrefUrl  + '">' +
                        '<img src="https://via.placeholder.com/40" alt="avatar"/>' +
                        '<div class="content">' +
                            '<div class="header">' +
                                '<span>' + item.name + '</span>' +
                                '<small>' + item.systemRegisterDatetime + '</small>' +
                            '</div>' +
                            '<span>' + item.message + '</span>' +
                        '</div>' +
                    '</a>' +
                '</li>';
                container.append(notificationHtml);

            if (!isLastItem) {
                const dividerHtml =
                    '<li>' +
                        '<hr className="dropdown-divider"/>' +
                    '</li>';
                container.append(dividerHtml);
            }
        });
    }

    // Create a new EventSource instance
    const eventSource = new EventSource('/notifications');

    // Event listener for server-sent events
    eventSource.onmessage = function(event) {
        // Display the notification
        const notification = document.getElementById('notification');
        notification.style.display = 'block';
    };

    // Optional: Event listener for errors
    eventSource.onerror = function(error) {
        console.error('EventSource failed:', error);
    };
</script>
<style>
    body {
        padding-top: 70px; /* 헤더 높이만큼 padding 추가 */
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

    /**/
    .custom-dropdown-menu {
        width: 350px;
        max-height: 300px;
        overflow-y: auto;
    }

    .custom-dropdown-item {
        display: flex;
        align-items: flex-start;
        padding: 10px;
        white-space: normal;
    }
    .custom-dropdown-item img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
    }
    .custom-dropdown-item .content {
        display: flex;
        flex-direction: column;
    }
    .custom-dropdown-item .content .header {
        display: flex;
        justify-content: space-between;
    }
    .custom-dropdown-item .content .header small {
        color: #6c757d;
    }

    #notification {
        display: none;
        background-color: #ffcc00;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #e6b800;
        border-radius: 5px;
    }

    .position-relative {
        position: relative;
    }

    .position-absolute {
        position: absolute;
    }

    .translate-middle {
        transform: translate(-50%, -50%);
    }

    .badge {
        display: inline-block;
        padding: 0.3em 0.5em; /* 배지의 패딩을 줄여서 크기 조정 */
        font-size: 0.7em; /* 글꼴 크기를 줄여서 배지 크기 조정 */
        font-weight: 700;
        line-height: 1;
        text-align: center;
        white-space: nowrap;
        vertical-align: baseline;
        border-radius: 0.375rem;
        color: #fff;
    }

    .bg-primary {
        background-color: #007bff;
    }

    .top-0 {
        top: 0;
    }

    .start-100 {
        left: 100%;
    }
</style>
<header class="border-bottom fixed-top bg-white">
    <div class="container" >
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
                        <img src="/images/svg/icon-bookmark.svg" alt="mdo" width="25" height="25">
                    </a>
                </div>

<%--                <div class="dropdown text-end me-2">--%>
<%--                    <a href="#" class="d-inline-flex link-body-emphasis text-decoration-none" data-bs-toggle="dropdown" aria-expanded="false" onclick="notification()">--%>
<%--                        <img src="/images/svg/bel.svg" alt="mdo" width="24" height="24" class="rounded-circle">--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu custom-dropdown-menu" id="notificationList" aria-labelledby="notificationDropdown">--%>
<%--                        <li>--%>
<%--                            <a class="dropdown-item custom-dropdown-item" href="#">--%>
<%--                                <img src="https://via.placeholder.com/40" alt="avatar">--%>
<%--                                <div class="content">--%>
<%--                                    <div class="header">--%>
<%--                                        <span>옥단냥고양이</span>--%>
<%--                                        <small>약 1시간 전</small>--%>
<%--                                    </div>--%>
<%--                                    <span>님의 회원님이 작성하신 "취업의 현실"에 추천을 하였습니다.</span>--%>
<%--                                </div>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

                <div class="dropdown text-end me-2 position-relative">
                    <a href="#" class="d-inline-flex link-body-emphasis text-decoration-none" data-bs-toggle="dropdown" aria-expanded="false" onclick="notification()">
                        <img src="/images/svg/bel.svg" alt="mdo" width="25" height="25" class="rounded-circle">
                        <span class="badge bg-primary position-absolute top-0 start-100 translate-middle">4</span>
                    </a>
                    <ul class="dropdown-menu custom-dropdown-menu" id="notificationList" aria-labelledby="notificationDropdown">
                        <li>
                            <a class="dropdown-item custom-dropdown-item" href="#">
                                <img src="https://via.placeholder.com/40" alt="avatar">
                                <div class="content">
                                    <div class="header">
                                        <span>옥단냥고양이</span>
                                        <small>약 1시간 전</small>
                                    </div>
                                    <span>님의 회원님이 작성하신 "취업의 현실"에 추천을 하였습니다.</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="dropdown text-end">
                    <c:choose>
                        <c:when test="${fileId > 0}">
                            <a href="#" class="d-block link-body-emphasis text-decoration-none" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="/business/uploadedFileGet/${fileId}" alt="mdo" width="30" height="30" class="rounded-circle">
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="#" class="d-block link-body-emphasis text-decoration-none" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="/images/svg/07.svg" alt="mdo" width="30" height="30" class="rounded-circle">
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <ul class="dropdown-menu gap-1 p-2 rounded-3 mx-0 shadow w-220px" data-bs-theme="light">
                        <li class="dropdown-header text-sm">내 계정</li>
                        <c:if test="${sessionScope.userTypeCode == 10 }">
                            <li>
                                <a class="dropdown-item text-sm d-flex gap-2 align-items-center" href="/personal/myProfile">
                                    <img src="/images/svg/icon-person.svg" alt="mdo" width="20" height="20" class="bi">
                                    프로필
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

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
                            <li>
                                <a class="dropdown-item text-sm d-flex gap-2 align-items-center" href="/business/profile">
                                    <img src="/images/svg/icon-person.svg" alt="mdo" width="20" height="20" class="bi">
                                    프로필
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
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
