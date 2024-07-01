<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    const keywordSearch = {
        init : function () {
            //첫 페이지
            this.keywordSearchSubmit(1);
        },

        keywordSearchSubmit : function (pageNum) {

            $.ajax({
                url: '/personal/ajax/dashboardList',
                type: 'GET',
                data: {
                    pageNum: pageNum,
                    pageSize: 10,
                    keyword: ''
                },
                success: function(response) {
                        $("#amount").text(response.total); //총 게시물 개수
                        keywordSearch.renderJobs(response.list); //리스트 목록
                        renderPagination('pagination',response.pageNum, response.pageSize, response.total, response.pages); //페이징
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        },
        //list 처리
        renderJobs: function (list) {
            console.log("list :: "+JSON.stringify(list)+"      "+list.size);
            const container = $("#recentlyApplyJobList");
            container.empty();// id속성 초기화

            list.forEach(function (applyJob) {
                const jobHtml =
                    '<div class="col-12" onclick="location.href=\'/business/jobPostDetail?jobId=' + applyJob.jobId + '\'">' +
                    '<div class="job-list ">' +
                    '<div class="job-list-logo">' +
                    '<img class="img-fluid" src="/business/uploadedFileGet/' + applyJob.fileId + '" alt="">' +
                    '</div>' +
                    '<div class="job-list-details">' +
                    '<div class="job-list-info">' +
                    '<div class="job-list-title">' +
                    '<input type="hidden" id="jobPostId" name="jobPostId" value="' + applyJob.applicationId + '">' +
                    '<h5 class="mb-0">' + applyJob.title + '</h5>' +
                    '</div>' +
                    '<div class="job-list-option">' +
                    '<ul class="list-unstyled">' +
                    '<li><a href="">' + applyJob.jobTypeCodeName + '</a></li>' +
                    '<li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>' + applyJob.jobTime + ' ' + applyJob.salaryTypeCodeName + ' : ' + applyJob.salary + '</a></li>' +
                    '</ul>' +
                    '<ul class="list-unstyled">' +
                    '<li><i class="fas fa-map-marker-alt pe-1"></i>' + applyJob.address + '</li>' +
                    '</ul>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="job-list-favourite-time">' +
                    '<a href="#">' + applyJob.statusTypeCodeName + '</a>' +
                    '<span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>' + applyJob.systemRegisterDatetime + '</span>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
                container.append(jobHtml);
            });
        }
    }

    $(document).ready(function () {
        //페이지가 로드될 때 실행
        keywordSearch.init();

        //페이징 함수
        $(document).on('click', '.pagination .page-link', function(e) {
            e.preventDefault();
            const pageNum = $(this).data('page');
            keywordSearch.keywordSearchSubmit(pageNum);
        });
    })
</script>

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
                                <h5 class="candidates-info-title text-white">  내가 지원한 공고들</h5>
                            </div>
                            <div class="candidates-info-count">
                                <h3 class="mb-0 text-white" id="amount">0</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="user-dashboard-info-box mb-0 pb-4">
                    <div class="section-title">
                        <h4>최근 지원한 공고 목록</h4>
                    </div>
                    <div class="container">
                        <!-- applyList -->
                        <div class="row" id="recentlyApplyJobList">
                            <div class="col-12 text-center py-3" id="noResultsMessage">
                                조회된 결과가 없습니다.
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-center mt-4 mt-sm-5">
                            <!-- page 시작 -->
                            <ul class="pagination justify-content-center mb-0" id="pagination" name="pagination">
                                <li class="page-item disabled"> <span class="page-link b-radius-none">Prev</span> </li>
                                <li class="page-item active" aria-current="page"><span class="page-link">1 </span> <span class="sr-only">(current)</span></li>
                                <li class="page-item disabled"> <span class="page-link  b-radius-none">Next</span> </li>
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
