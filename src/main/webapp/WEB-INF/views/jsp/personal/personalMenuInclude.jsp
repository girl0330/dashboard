<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--=================================
inner banner -->
<div class="header-inner bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="candidates-user-info">
                    <div class="jobber-user-info">
                        <c:choose>
                            <c:when test="${fileId > 0}"><div class="profile-avatar">
                                <img class="img-fluid" src="/business/uploadedFileGet/${fileId}" alt="">
                            </div>
                                <div class="profile-avatar-info ms-4">
                                    <h3>${profile.name} 님</h3>
                                </div>
                            </c:when>
                            <c:otherwise><div class="profile-avatar">
                                <img class="img-fluid" src="/images/svg/07.svg" alt="">
                            </div>
                                <div class="profile-avatar-info ms-4">
                                    <h3>회원님 환영합니다. </h3>
                                </div>
                            </c:otherwise>
                        </c:choose>
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
                    <c:if  test="${userTypeCode == '10'}">
                        <ul class="list-unstyled mb-0" id="menu">
                            <li><a href="/personal/myProfile">프로필</a></li>
                            <c:if test="${profile.loginTypeCode == '10'}">
                                <li><a href="/personal/changePassword">비밀번호 변경</a></li>
                            </c:if>
                            <li><a href="/personal/manageJobs">지원 현황</a></li>
                            <li><a href="/personal/likedJobs">관심 공고</a></li>
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
<script src="/js/jquery-3.7.1.min.js"></script>
<script>
    $(document).ready(function() {
        const path = window.location.pathname;
        $('#menu li a').removeClass('active').filter(function() {
            return $(this).attr('href') === path;
        }).addClass('active');
    });
</script>