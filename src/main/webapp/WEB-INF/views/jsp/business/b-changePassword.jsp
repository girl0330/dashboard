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
                        <h4>Change Password</h4>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <form class="row">
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">Current Password</label>
                                    <input type="password" class="form-control" value="">
                                </div>
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">New Password</label>
                                    <input type="password" class="form-control" value="">
                                </div>
                                <div class="form-group col-md-12 mb-0">
                                    <label class="form-label">Confirm Password</label>
                                    <input type="password" class="form-control" value="">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <a class="btn btn-lg btn-primary" href="#">Change Password</a>
            </div>
        </div>
    </div>
</section>
<!--=================================
Change Password -->
