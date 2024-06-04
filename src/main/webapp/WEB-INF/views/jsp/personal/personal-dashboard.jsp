<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--=================================
inner banner ,Dashboard Nav -->
<%@ include file="personalMenuInclude.jsp"%>
<!--=================================
Candidates Dashboard -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row mb-3 mb-lg-5 mt-3 mt-lg-0">
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="candidates-feature-info bg-dark">
                            <div class="candidates-info-icon text-white">
                                <i class="fas fa-globe-asia"></i>
                            </div>
                            <div class="candidates-info-content">
                                <h6 class="candidates-info-title text-white">Total Applications</h6>
                            </div>
                            <div class="candidates-info-count">
                                <h3 class="mb-0 text-white">01</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="candidates-feature-info bg-success">
                            <div class="candidates-info-icon text-white">
                                <i class="fas fa-thumbs-up"></i>
                            </div>
                            <div class="candidates-info-content">
                                <h6 class="candidates-info-title text-white">Shortlisted Applications</h6>
                            </div>
                            <div class="candidates-info-count">
                                <h3 class="mb-0 text-white">00</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="candidates-feature-info bg-danger">
                            <div class="candidates-info-icon text-white">
                                <i class="fas fa-thumbs-down"></i>
                            </div>
                            <div class="candidates-info-content">
                                <h6 class="candidates-info-title text-white">Rejected Applications</h6>
                            </div>
                            <div class="candidates-info-count">
                                <h3 class="mb-0 text-white">00</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="user-dashboard-info-box mb-0 pb-4">
                    <div class="section-title">
                        <h4>최근 지원한 공고 목록</h4>
                    </div>
                    <div class="row">
                        <c:forEach items="${recentlyApplyJobList}" var="recentlyApplyJobList">
                            <div class="col-12" onclick="location.href='/business/detail?jobId=${recentlyApplyJobList.applicationId}'">
                                <div class="job-list ">
                                    <div class="job-list-logo">
                                        <img class="img-fluid" src="/images/svg/01.svg" alt="">
                                    </div>
                                    <div class="job-list-details">
                                        <div class="job-list-info">
                                            <div class="job-list-title">
                                                <input type="hidden" id="jobPostId" name="jobPostId" value="${recentlyApplyJobList.applicationId}">
                                                <h5 class="mb-0">${recentlyApplyJobList.title}</h5>
                                            </div>
                                            <div class="job-list-option">
                                                <ul class="list-unstyled">
                                                    <li> <a href="">${recentlyApplyJobList.jobTypeCodeName}</a> </li>
                                                    <li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>${recentlyApplyJobList.jobTime} ${recentlyApplyJobList.salaryTypeCodeName} : ${recentlyApplyJobList.salary}</a></li>
                                                </ul>
                                                <ul class="list-unstyled">
                                                    <li><i class="fas fa-map-marker-alt pe-1"></i>${recentlyApplyJobList.address}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="job-list-favourite-time">
                                        <a href="#">${recentlyApplyJobList.statusTypeCodeName}</a>
                                        <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>${recentlyApplyJobList.systemRegisterDatetime}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col-12 text-center mt-4 mt-md-5">
                            <ul class="pagination justify-content-center mb-md-4 mb-0">
                                <li class="page-item disabled"> <span class="page-link b-radius-none">Prev</span> </li>
                                <li class="page-item active" aria-current="page"><span class="page-link">1 </span> <span class="sr-only">(current)</span></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">...</a></li>
                                <li class="page-item"><a class="page-link" href="#">25</a></li>
                                <li class="page-item"> <a class="page-link" href="#">Next</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Change Password -->
