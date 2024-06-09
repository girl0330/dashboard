<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--=================================
inner banner -->
<div class="header-inner bg-light">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="jobber-user-info">
                    <div class="profile-avatar">
                        <img class="img-fluid " src="/images/svg/01.svg" alt="">
                        <i class="fas fa-pencil-alt"></i>
                    </div>
                    <div class="profile-avatar-info ms-4">
                        <h3>${userEmail}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--=================================
inner banner -->
<!--=================================
Dashboard Nav -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="sticky-top secondary-menu-sticky-top">
                    <div class="secondary-menu">
                        <c:if  test="${userTypeCode == '20'}">
                            <ul class="list-unstyled mb-0" id="menu">
                                <li><a href="/business/dashboard">Dashboard</a></li>
                                <li><a href="/business/profile">프로필</a></li>
                                <li><a href="/business/changePassword">비밀번호 변경</a></li>
<%--                                <li><a href="/business/manageCandidate">지원자 관리</a></li>--%>
                                <li><a href="/business/managePostJob">공고 관리</a></li>
<%--                                <li><a href="/business/postAJob">새 공고 작성하기</a></li>--%>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Dashboard Nav -->
<script>
    $(document).ready(function() {
        const path = window.location.pathname;
        $('#menu li a').removeClass('active').filter(function() {
            return $(this).attr('href') === path;
        }).addClass('active');
    });
</script>