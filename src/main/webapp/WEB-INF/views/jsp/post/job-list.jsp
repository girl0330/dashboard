<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    // function goToDetail(jobPostId) {
    //     alert("상세보기 " +jobPostId)
    //     const url ="/business/detail?jobPostId="
    //     window.location.href = url+jobPostId;
    // }
</script>
<!--=================================
banner -->
<section class="header-inner header-inner-big bg-holder text-white" style="background-image: url(/images/bg/banner-01.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="job-search-field">
                    <div class="job-search-item">
                        <form class="form row">
                            <div class="col-lg-5 col-md-4">
                                <div class="form-group left-icon mb-md-0 mb-3">
                                    <input type="text" class="form-control" name="job_title" placeholder="What?">
                                    <i class="fas fa-search"></i>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="form-group left-icon mb-md-0 mb-3">
                                    <input type="text" class="form-control" name="job_title" placeholder="Where?">
                                    <i class="fas fa-search"></i>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-12">
                                <div class="form-group form-action mb-0">
                                    <button type="submit" class="btn btn-primary mt-0"><i class="fas fa-search-location"></i> Find Employer</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
banner -->

<section class="space-ptb">
    <div class="container">
        <div class="row">
            <!--=================================
            sidebar -->
            <div class="col-lg-3">
                <div class="sidebar">
                    <div class="widget">
                        <div class="search">
                            <i class="fas fa-search"></i>
                            <input class="form-control" type="text" placeholder="Search Keywords">
                        </div>
                    </div>
                    <div class="widget">
                        <div class="locations">
                            <i class="far fa-compass"></i>
                            <input class="form-control" type="text" placeholder="All Locations">
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Date Posted</h6>
                            <a class="ms-auto" data-bs-toggle="collapse" href="#dateposted" role="button" aria-expanded="false" aria-controls="dateposted"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="dateposted">
                            <div class="widget-content">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="dateposted1">
                                    <label class="form-check-label" for="dateposted1">Last hour</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="dateposted2">
                                    <label class="form-check-label" for="dateposted2">Last 24 hour</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="dateposted3">
                                    <label class="form-check-label" for="dateposted3">Last 7 days</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="dateposted4">
                                    <label class="form-check-label" for="dateposted4">Last 14 days</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="dateposted5">
                                    <label class="form-check-label" for="dateposted5">Last 30 days</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Specialism</h6>
                            <a class="ms-auto" data-bs-toggle="collapse" href="#specialism" role="button" aria-expanded="false" aria-controls="specialism"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="specialism">
                            <div class="widget-content">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="specialism1">
                                    <label class="form-check-label" for="specialism1">IT Contractor</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="specialism2">
                                    <label class="form-check-label" for="specialism2">Charity & Voluntary</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="specialism3">
                                    <label class="form-check-label" for="specialism3">Digital & Creative</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="specialism4">
                                    <label class="form-check-label" for="specialism4">Estate Agency</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="specialism5">
                                    <label class="form-check-label" for="specialism5">Graduate</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Job Type</h6>
                            <a class="ms-auto" data-bs-toggle="collapse" href="#jobtype" role="button" aria-expanded="false" aria-controls="jobtype"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="jobtype">
                            <div class="widget-content">
                                <div class="form-check fulltime-job">
                                    <input type="checkbox" class="form-check-input" id="jobtype1">
                                    <label class="form-check-label" for="jobtype1">Full Time</label>
                                </div>
                                <div class="form-check parttime-job">
                                    <input type="checkbox" class="form-check-input" id="jobtype2">
                                    <label class="form-check-label" for="jobtype2">Part-Time</label>
                                </div>
                                <div class="form-check freelance-job">
                                    <input type="checkbox" class="form-check-input" id="jobtype3">
                                    <label class="form-check-label" for="jobtype3">Freelance</label>
                                </div>
                                <div class="form-check temporary-job">
                                    <input type="checkbox" class="form-check-input" id="jobtype4">
                                    <label class="form-check-label" for="jobtype4">Temporary</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Experience</h6>
                            <a class="ms-auto" data-bs-toggle="collapse" href="#experience" role="button" aria-expanded="false" aria-controls="experience"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="experience">
                            <div class="widget-content">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="experience1">
                                    <label class="form-check-label" for="experience1">Fresher</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="experience2">
                                    <label class="form-check-label" for="experience2">Less than 1 year</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="experience3">
                                    <label class="form-check-label" for="experience3">2 Year</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="experience4">
                                    <label class="form-check-label" for="experience4">3 Year</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="experience5">
                                    <label class="form-check-label" for="experience5">4 Year</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Offered Salary</h6>
                            <a class="ms-auto" data-bs-toggle="collapse" href="#Offeredsalary" role="button" aria-expanded="false" aria-controls="Offeredsalary"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="Offeredsalary">
                            <div class="widget-content">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="Offeredsalary1">
                                    <label class="form-check-label" for="Offeredsalary1">10k - 20k</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="Offeredsalary2">
                                    <label class="form-check-label" for="Offeredsalary2">20k - 30k</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="Offeredsalary3">
                                    <label class="form-check-label" for="Offeredsalary3">30k - 40k</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="Offeredsalary4">
                                    <label class="form-check-label" for="Offeredsalary4">40k - 50k</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="Offeredsalary5">
                                    <label class="form-check-label" for="Offeredsalary5">50k - 60k</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Gender</h6>
                            <a class="ms-auto" data-bs-toggle="collapse" href="#gender" role="button" aria-expanded="false" aria-controls="gender"><i class="fas fa-chevron-down"></i></a>
                        </div>
                        <div class="collapse show" id="gender">
                            <div class="widget-content">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="gender1">
                                    <label class="form-check-label" for="gender1">Male</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="gender2">
                                    <label class="form-check-label" for="gender2">Female</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Qualification</h6>
                            <a class="ms-auto" data-bs-toggle="collapse" href="#qualification" role="button" aria-expanded="false" aria-controls="qualification"> <i class="fas fa-chevron-down"></i></a>
                        </div>
                        <div class="collapse show" id="qualification">
                            <div class="widget-content">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="qualification1">
                                    <label class="form-check-label" for="qualification1">Matriculation</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="qualification2">
                                    <label class="form-check-label" for="qualification2">Intermediate</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="qualification3">
                                    <label class="form-check-label" for="qualification3">Graduate</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-add">
                            <img class="img-fluid" src="/images/add-banner.png" alt=""></div>
                    </div>
                </div>
            </div>
            <!--=================================
            sidebar -->
            <div class="col-lg-9">
                <div class="row mb-4">
                    <div class="col-12">
                        <h6 class="mb-0">구인공고목록<span class="text-primary">총 - 건 </span></h6>
                    </div>
                </div>
                <div class="job-filter mb-4 d-sm-flex align-items-center">
<%--                    <div class="job-alert-bt"> <a class="btn btn-md btn-dark" href="#"><i class="fa fa-envelope"></i>Get job alert </a> </div>--%>
                    <div class="job-shortby ms-sm-auto d-flex align-items-center">
                        <form class="form-inline">
                            <div class="input-group mb-0 align-items-center">
                                <label class="justify-content-start me-2">정렬방식 :</label>
                                <div class="short-by">
                                    <select class="form-control basic-select">
                                        <option>최신순</option>
                                        <option>오래된순</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                    <div class="container">
                        <div class="row">
                            <c:forEach items="${jobList}" var="jobList">
                            <div class="col-12" onclick="location.href='/business/detail?jobId=${jobList.jobId}'">
                                <div class="job-list ">
                                    <div class="job-list-logo">
                                        <img class="img-fluid" src="/images/svg/01.svg" alt="">
                                    </div>
                                    <div class="job-list-details">
                                        <div class="job-list-info">
                                            <div class="job-list-title">
                                                <input type="hidden" id="jobPostId" name="jobPostId" value="${jobList.jobId}">
                                                <h5 class="mb-0">${jobList.title}</h5>
                                            </div>
                                            <div class="job-list-option">
                                                <ul class="list-unstyled">
                                                    <li> <a href="">${jobList.jobTypeCodeName}</a> </li>
                                                </ul>
                                                <ul class="list-unstyled">
                                                    <li><i class="fas fa-map-marker-alt pe-1"></i>${jobList.address}</li>
                                                    <li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>${jobList.salaryTypeCodeName}:${jobList.salary}</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="job-list-favourite-time"> <a class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a> <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>${jobList.systemRegisterDatetime}</span> </div>
                                </div>
                            </div>
                            </c:forEach>
                            Job List Table-->
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <tbody>
<%--                                    <c:forEach items="${jobList}" var="job">--%>
<%--                                        <tr onclick="goToDetail(${job.jobPostId});">--%>
<%--                                            <th scope="row">${job.jobPostId}</th>--%>
<%--                                            <td>${job.title}</td>--%>
<%--                                            <td>${job.workingHours}</td>--%>
<%--                                            <td>${job.salaryType}</td>--%>
<%--                                            <td>${job.salary}</td>--%>
<%--                                            <td>${job.registrarDatetime}</td>--%>
<%--                                        </tr>--%>
<%--                                    </c:forEach>--%>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                    <div class="col-12 text-center mt-4 mt-sm-5">
                        <ul class="pagination justify-content-center mb-0">
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
</section>

<!--=================================
feature info section -->
<section class="feature-info-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 mb-lg-0 mb-4">
                <div class="feature-info feature-info-02 p-4 p-lg-5 bg-primary">
                    <div class="feature-info-icon mb-3 mb-sm-0 text-dark">
                        <i class="flaticon-team"></i>
                    </div>
                    <div class="feature-info-content text-white ps-sm-4 ps-0">
                        <p>Jobseeker</p>
                        <h5 class="text-white">Looking For Job?</h5>
                    </div>
                    <a class="ms-auto align-self-center" href="#">Apply now<i class="fas fa-long-arrow-alt-right"></i> </a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="feature-info feature-info-02 p-4 p-lg-5 bg-dark">
                    <div class="feature-info-icon mb-3 mb-sm-0 text-primary">
                        <i class="flaticon-job-3"></i>
                    </div>
                    <div class="feature-info-content text-white ps-sm-4 ps-0">
                        <p>Recruiter</p>
                        <h5 class="text-white">Are You Recruiting?</h5>
                    </div>
                    <a class="ms-auto align-self-center" href="#">Post a job<i class="fas fa-long-arrow-alt-right"></i> </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
feature info section -->
