<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    $(document).ready(function(){
        $('#file').on('click', function() {
            $('#fileInput').click();
        });

        $('#fileInput').on('change', function(event) {
            const coverImage = document.getElementById('coverImage');
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    coverImage.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    });
</script>
<!--=================================
inner banner -->
<div class="header-inner bg-light">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="jobber-user-info">
                    <div class="profile-avatar">
                        <img class="img-fluid " id="coverImage" src="/business/uploadedFileGet/${fileId}" alt="">
                        <i class="fas fa-pencil-alt" id="file" name="file"></i>
                    </div>
                    <div class="profile-avatar-info ms-4">
                        <h3>${company.companyName}</h3>
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
<%--                                <li><a href="/business/dashboard">Dashboard</a></li>--%>
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