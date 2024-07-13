<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--=================================
Terms and conditions -->
<section class="space-ptb">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2>이용약관 및 동의</h2>
                </div>
                <div>
                    <h6 class="text-primary">1. ${termsTypeCode10.termsTypeName}</h6>
                    <p class="mb-20">${termsTypeCode10.termsContent}</p>

                </div>
                <h6 class="text-primary mt-4">2. ${termsTypeCode20.termsTypeName}</h6>
                <p class="mb-20">${termsTypeCode20.termsContent}</p>

                <a class="btn btn-primary" href="#"><span>Accept</span></a>
                <a class="btn btn-dark" href="#"><span>Close</span></a>
            </div>
        </div>
    </div>
</section>
<!--=================================
Terms and conditions -->

<!--=================================
feature -->
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
feature -->
