<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--=================================
Dashboard Nav -->
<%@ include file="businessMenuInclude.jsp"%>
<!--=================================
Dashboard Nav -->

<!--=================================
Manage Jobs -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box mb-0">
                    <div class="row mb-4">
                        <div class="col-md-7 col-sm-5 d-flex align-items-center">
                            <div class="section-title-02 mb-0 ">
                                <h4 class="mb-0"> 지원자 관리</h4>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-7 mt-3 mt-sm-0">
                            <div class="search">
                                <i class="fas fa-search"></i>
                                <input type="text" class="form-control" placeholder="Search...">
                            </div>
                        </div>
                    </div>
                    <div class="user-dashboard-table table-responsive">
                        <table class="table table-bordered">
                            <thead class="bg-light">
                            <tr>
                                <th scope="col">공고 제목</th>
                                <th scope="col">지원자</th>
                                <th scope="col">상태</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${applicantList}" var="applicantList">
                                <tr>
                                    <th scope="row">
                                        <span class="clickable-title">
                                                <a href="#" onclick="location.href='/business/detail?jobId=${applicantList.jobId}'"><h6>${applicantList.title}</h6> </a>
                                        </span>
                                        <input type="hidden" id="jobId" name="jobId" value="${applicantList.jobId}">
                                    </th>
                                    <td> ${applicantList.userNo}
                                        <a href="#" class="text-primary" onclick="location.href = '/business/candidateDetail?userNo=${applicantList.userNo}'" id="look" name="look" data-bs-toggle="tooltip" title="지원자 상세보기"><i class="far fa-eye"></i></a>
                                        - ${applicantList.systemRegisterDatetime}
                                    </td>
                                    <td>
                                            ${applicantList.statusTypeCodeName}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-12 text-center">
                            <ul class="pagination mt-3">
                                <li class="page-item disabled me-auto">
                                    <span class="page-link b-radius-none">Prev</span>
                                </li>
                                <li class="page-item active" aria-current="page"><span class="page-link">1 </span> <span class="sr-only">(current)</span></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item ms-auto">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Manage Jobs -->
