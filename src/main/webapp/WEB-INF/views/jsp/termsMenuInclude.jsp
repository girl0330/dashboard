<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--=================================
Dashboard Nav -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title-02 mt-4 mt-md-0">
                    <h2>이용약관 및 동의</h2>
                </div>
                <div class="browse-job d-flex">
                    <div class="justify-content-start">
                        <ul class="nav nav-tabs nav-tabs-02" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active ms-0" id="tab-03" data-bs-toggle="tab" href="#tab-06" role="tab" aria-controls="tab-06" aria-selected="true">${termsTypeCode10.termsTypeName}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab-04" data-bs-toggle="tab" href="#tab-07" role="tab" aria-controls="tab-07" aria-selected="false">${termsTypeCode20.termsTypeName}</a>
                            </li>
                        </ul>
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