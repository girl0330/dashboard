 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<script>--%>
<%--    $(document).ready(function(){--%>
<%--        $('#file').on('click', function() {--%>
<%--            $('#fileInput').click();--%>
<%--        });--%>

<%--        $('#fileInput').on('change', function(event) {--%>
<%--            const coverImage = document.getElementById('coverImage');--%>
<%--            const file = event.target.files[0];--%>
<%--            if (file) {--%>
<%--                const reader = new FileReader();--%>
<%--                reader.onload = (e) => {--%>
<%--                    coverImage.src = e.target.result;--%>
<%--                };--%>
<%--                reader.readAsDataURL(file);--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
 <script>
     $(document).ready(function() {
         const path = window.location.pathname;
         $('#menu li a').removeClass('active').filter(function() {
             return $(this).attr('href') === path;
         }).addClass('active');
     });
 </script>
<!--=================================
inner banner -->
<div class="header-inner bg-light">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="jobber-user-info">
                    <c:choose>
                        <c:when test="${fileId > 0}"><div class="profile-avatar">
                            <img class="img-fluid" src="/business/uploadedFileGet/${fileId}" alt="">
                        </div>
                            <div class="profile-avatar-info ms-4">
                                <h3>${company.companyName}</h3>
                            </div>
                        </c:when>
                        <c:otherwise><div class="profile-avatar">
                            <img class="img-fluid" src="/images/svg/07.svg" alt="">
                        </div>
                            <div class="profile-avatar-info ms-4">
                                <h3>회원님 환영합니다.</h3>
                            </div>
                        </c:otherwise>
                    </c:choose>
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
                                <li><a href="/business/profile">프로필</a></li>
                                <li><a href="/business/changePassword">비밀번호 변경</a></li>
                                <li><a href="/business/managePostJob">공고 관리</a></li>
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
