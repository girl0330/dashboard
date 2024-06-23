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
                        <div class="profile-avatar">
                            <img class="img-fluid " id="bannerCoverImage" src="/business/uploadedFileGet/${fileId}" alt="">
                        </div>
                        <div class="profile-avatar-info ms-4">
                            <h3>${company.companyName}</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="progress">
                    <div class="progress-bar" role="progressbar" style="width:85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                        <span class="progress-bar-number">85%</span>
                    </div>
                </div>
                <div class="candidates-skills">
                    <div class="candidates-skills-info">
                        <h3 class="text-primary">85%</h3>
                        <span class="d-block">Skills increased by job Title.</span>
                    </div>
                    <div class="candidates-required-skills ms-auto mt-sm-0 mt-3">
                        <a class="btn btn-dark" href="#">Complete Required Skills</a>
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
                            <li><a href="/personal/dashboard">공고 현황</a></li>
                            <li><a href="/personal/myProfile">프로필</a></li>
                            <li><a href="/personal/changePassword">비밀번호 변경</a></li>
                            <li><a href="/personal/manageJobs">지원 현황</a></li>
                            <li><a href="/personal/likedJobs">관심있는 공고</a></li>
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