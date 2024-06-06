<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--=================================
Dashboard Nav -->
<%@ include file="businessMenuInclude.jsp"%>
<!--=================================
Dashboard Nav -->

<!--=================================
Change Password -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box">
                    <div class="section-title-02 mb-4">
                        <h4>지원자 디테일</h4>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <form class="row">
                                <div class="form-group col-md-12 mb-3">
                                    <label class="form-label">지원자 이름</label>
                                    <input type="text" class="form-control" value="">
                                </div>
                                <div class="form-group col-md-12 mt-0 mb-3">
                                    <label class="form-label">지원자의 지원동기</label>
                                    <textarea class="form-control" rows="4"></textarea>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <a class="btn btn-lg btn-primary" href="#">지원자 채용하기</a>
            </div>
        </div>
    </div>
</section>
<!--=================================
Change Password -->