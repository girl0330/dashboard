<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    keywordSearch = {
        init : function () {
            //첫페이지 1 입력
            this.keywordSearchSubmit(1);
        },

        keywordSearchSubmit: function (pageNum) {
            // 새로운 HTML을 생성하여 삽입
            const keyword = $('#keyword').val(); // input 필드에서 값 가져오기

            $.ajax({
                url: '/business/ajax/list',
                type: 'GET',
                data: {
                    pageNum: pageNum,
                    pageSize: 10,
                    keyword: keyword
                },
                success: function(response) {
                    // 성공 시 실행할 코드
                    console.log('성공:', JSON.stringify(response));
                    keywordSearch.renderJobs(response.list);
                    keywordSearch.renderPagination(response.pageNum, response.pageSize, response.total, response.pages);
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        },
        renderJobs: function(list){
            console.log("list::::    "+JSON.stringify(list));
            const container = $("#jobList");
            container.empty();

            list.forEach(function(job) {
                const jobHtml =
                    '<div class="col-12" onclick="location.href=\'/business/detail?jobId=' + job.jobId + '\'">' +
                    '<div class="job-list">' +
                    '<div class="job-list-logo">' +
                    '<img class="img-fluid" src="/images/svg/01.svg" alt="">' +
                    '</div>' +
                    '<div class="job-list-details">' +
                    '<div class="job-list-info">' +
                    '<div class="job-list-title">' +
                    '<input type="hidden" id="jobPostId" name="jobPostId" value="' + job.jobId + '">' +
                    '<h5 class="mb-0">' + job.title + ' (' + job.statusTypeCodeName + ')</h5>' +
                    '</div>' +
                    '<div class="job-list-option">' +
                    '<ul class="list-unstyled">' +
                    '<li><a href="#">' + job.jobTypeCodeName + '</a></li>' +
                    '</ul>' +
                    '<ul class="list-unstyled">' +
                    '<li><i class="fas fa-map-marker-alt pe-1"></i>' + job.address + '</li>' +
                    '<li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>' + job.salaryTypeCodeName + ':' + job.salary + '</a></li>' +
                    '</ul>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="job-list-favourite-time">' +
                    '<a class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>' +
                    '<span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>' + job.systemRegisterDatetime + '</span>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
                container.append(jobHtml);
            });
        },

        renderPagination: function(currentPage, pageSize, totalJobs, totalPages) {
            const container = $('#pagination');
            container.empty();
            const prevPage = currentPage > 1 ? currentPage - 1 : 1;
            const nextPage = currentPage < totalPages ? currentPage + 1 : totalPages;

            container.append('<li class="page-item ' + (currentPage === 1 ? 'disabled' : '') + '">' +
                '<a class="page-link b-radius-none" href="#" data-page="' + prevPage + '">Prev</a>' +
                '</li>');

            for (let i = 1; i <= totalPages; i++) {
                container.append('<li class="page-item ' + (i === currentPage ? 'active' : '') + '">' +
                    '<a class="page-link" href="#" data-page="' + i + '">' + i + '</a>' +
                    '</li>');
            }

            container.append('<li class="page-item ' + (currentPage === totalPages ? 'disabled' : '') + '">' +
                '<a class="page-link b-radius-none" href="#" data-page="' + nextPage + '">Next</a>' +
                '</li>');
        }
    }

    $(document).ready(function() {
        //최초 실행
        keywordSearch.init();

        $('#searchButton').on('click', function (e) {
            e.preventDefault();
            keywordSearch.init();
        });

        $(document).on('click', '.pagination .page-link', function(e) {
            e.preventDefault();
            const pageNum = $(this).data('page');
            keywordSearch.keywordSearchSubmit(pageNum);
        });
    });
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
                            <div class="col-lg-9 col-md-4">
                                <div class="form-group left-icon mb-md-0 mb-3">
                                    <input type="text" class="form-control" id="keyword" name="keyword" placeholder="What?">
                                    <i class="fas fa-search"></i>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-12">
                                <div class="form-group form-action mb-0">
                                    <button type="button" class="btn btn-primary mt-0" id="searchButton"><i class="fas fa-search-location"></i> Find Employer</button>
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
            <div class="col-lg-12">
                <div class="row mb-4">
                    <div class="col-12">
                        <h6 class="mb-0">구인공고목록<span class="text-primary">총 - 건 </span></h6>
                    </div>
                </div>
                <div class="job-filter mb-4 d-sm-flex align-items-center">
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
                    <div class="row" id="jobList" name="jobList">
                        <c:forEach items="${jobList.list}" var="jobList">
                        <div class="col-12" onclick="location.href='/business/detail?jobId=${jobList.jobId}'">
                            <div class="job-list ">
                                <div class="job-list-logo">
                                    <img class="img-fluid" src="/images/svg/01.svg" alt="">
                                </div>
                                <div class="job-list-details">
                                    <div class="job-list-info">
                                        <div class="job-list-title">
                                            <input type="hidden" id="jobPostId" name="jobPostId" value="${jobList.jobId}">
                                            <h5 class="mb-0">${jobList.title} (${jobList.statusTypeCodeName})</h5>
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
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center mt-4 mt-sm-5">
                        <ul class="pagination justify-content-center mb-0" id="pagination" name="pagination">
                            <!-- 이전 페이지 링크 -->
                            <li class="page-item ${jobList.hasPreviousPage ? '' : 'disabled'}">
                                <a class="page-link b-radius-none" href="${jobList.hasPreviousPage ? 'list?pageNum=' += jobList.prePage += '&pageSize=' += jobList.pageSize : '#'}">
                                    Prev
                                </a>
                            </li>

                            <!-- 페이지 번호 링크 -->
                            <c:forEach var="i" begin="1" end="${jobList.pages}">
                                <li class="page-item ${i == jobList.pageNum ? 'active' : ''}">
                                    <a class="page-link" href="${i == jobList.pageNum ? '#' : 'list?pageNum=' += i += '&pageSize=' += jobList.pageSize}">
                                        ${i}
                                    </a>
                                </li>
                            </c:forEach>

                            <!-- 다음 페이지 링크 -->
                            <li class="page-item ${jobList.hasNextPage ? '' : 'disabled'}">
                                <a class="page-link b-radius-none" href="${jobList.hasNextPage ? 'list?pageNum=' += jobList.nextPage += '&pageSize=' += jobList.pageSize : '#'}">
                                    Next
                                </a>
                            </li>
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
