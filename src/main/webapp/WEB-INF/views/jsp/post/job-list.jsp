<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    const keywordSearch = {
        init : function () {
            //첫페이지 1 입력
            this.keywordSearchSubmit(1);
        },

        keywordSearchSubmit: function (pageNum) {
            const keyword = $('#keyword').val(); // input 필드에서 값 가져오기

            const options = {
                url: '/business/ajax/postJobList',
                type: 'GET',
                data: {
                    pageNum: pageNum,
                    pageSize: 10,
                    keyword: keyword
                },

                done: (response) => {
                    $('#amount').text(response.total);
                    keywordSearch.renderJobs(response);
                    renderPagination('pagination', response.pageNum, response.pageSize, response.total, response.pages);
                },
            };

            ajax.call(options);

        },
        renderJobs: function(response){
            const list = response.list;
            const likeList = response.likeList;
            const container = $("#jobList");
            container.empty();

            // Create a Set for quick lookup of liked job IDs
            const likedJobIds = new Set(likeList.map(like => like.jobId));

            list.forEach(job => {
                // Determine the heart icon class based on whether the jobId is in likedJobIds
                const heartIconClass = likedJobIds.has(job.jobId) ? 'fas fa-heart text-danger' : 'far fa-heart';

                // Determine the image source based on whether the file is null
                const imgSrc = job.fileId > 0 ? '/business/uploadedFileGet/' + job.fileId : '/images/svg/07.svg' ;


                const jobHtml =
                    '<div class="col-12" onclick="location.href=\'/business/jobPostDetail?jobId=' + job.jobId + '\'">' +
                    '<div class="job-list">' +
                    '<div class="job-list-logo">' +
                    '<img class="img-fluid" src="' + imgSrc + '" alt="">' +
                    '</div>' +
                    '<div class="job-list-details">' +
                    '<div class="job-list-info">' +
                    '<div class="job-list-title">' +
                    '<input type="hidden" id="jobPostId" name="jobPostId" value="' + job.jobId + '">' +
                    '<h5 class="mb-0">' + job.title + ' (' + job.statusTypeCodeName + ')</h5>' +
                    '</div>' +
                    '<div class="job-list-option">' +
                    '<ul class="list-unstyled">' +
                    '<li><a href="#"><i class="fas fa-filter pe-1"></i>' + job.jobTypeCodeName + '</a></li>' +
                    '</ul>' +
                    '<ul class="list-unstyled">' +
                    '<li><i class="fas fa-map-marker-alt pe-1"></i>' + job.address + '</li>' +
                    '<li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>' + job.salaryTypeCodeName + ':' + job.salary + '</a></li>' +
                    '</ul>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="job-list-favourite-time">' +
                    '<a class="job-list-favourite order-2" id="like" href="#"><i class="' + heartIconClass + '" ></i></a>' +
                    '<span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>' + job.systemRegisterDatetime + '</span>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
                container.append(jobHtml);
            });
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

        $('#like').click(function () {
            alert("??")
            keywordSearch.like();
        })

        $('#keyword').on('keydown', function(event) {
            if (event.key === 'Enter') {
                event.preventDefault(); // 기본 Enter 키 동작 방지 (폼 제출 등)
                keywordSearch.init();
            }
        });
    });

    function test() {
        alert("검색 실행 ");
    }
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
                        <h6 class="mb-0">구인공고 <span class="text-primary">총 <i id="amount"></i> 건 </span></h6>
                    </div>
                </div>

                <div class="container">
                    <!-- list 목록 -->
                    <div class="row" id="jobList" name="jobList">
                        <div id="job-list-container"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center mt-4 mt-sm-5">
                        <!-- page 시작 -->
                        <ul class="pagination justify-content-center mb-0" id="pagination" name="pagination">
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
