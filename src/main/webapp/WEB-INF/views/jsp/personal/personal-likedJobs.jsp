<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    const keywordSearch = {
        init : function () {
            //첫페이지 1 입력
            this.keywordSearchSubmit(1);
        },

        keywordSearchSubmit: function (pageNum) {

            const options = {
                url: '/personal/ajax/likedJobs',
                type: 'GET',
                data: {
                    pageNum: pageNum,
                    pageSize: 10,
                    keyword: ''
                },
                done: (response) => {
                    if (response.list.length > 0) {
                        $("#noResultsMessage").hide();
                        keywordSearch.renderJobs(response.list); // 리스트 목록 렌더링
                        renderPagination('pagination', response.pageNum, response.pageSize, response.total, response.pages); // 페이징 처리
                    }
                },
                fail: function(jqXHR) {
                    console.error('요청 실패:', jqXHR.responseText); // 서버에서 반환된 응답
                    const errorResponse = JSON.parse(jqXHR.responseText); // JSON 파싱
                    alert("에러 발생: " + errorResponse.userMessage); // 사용자에게 에러 메시지 노출
                }
                // error: (status, responseText) => {
                //     // 기본 에러 처리
                //     const jsonObj = JSON.parse(responseText);
                //     alert(jsonObj.userMessage);
                // }
            };

            ajax.call(options);

        },
        renderJobs: function(list){
            const container = $("#likedJobList");
            container.empty();

            list.forEach(likedJob => {
                const jobHtml =
                    '<div class="col-12" onclick="location.href=\'/business/jobPostDetail?jobId=' + likedJob.jobId + '\'">' +
                    '<div class="job-list">' +
                    '<div class="job-list-logo">' +
                    '<img class="img-fluid" src="/business/uploadedFileGet/' + likedJob.fileId + '" alt="">' +
                    '</div>' +
                    '<div class="job-list-details">' +
                    '<div class="job-list-info">' +
                    '<div class="job-list-title">' +
                    '<input type="hidden" id="jobPostId" name="jobPostId" value="' + likedJob.jobId + '">' +
                    '<h5 class="mb-0">' + likedJob.title + ' (' + likedJob.statusTypeCodeName + ')</h5>' +
                    '</div>' +
                    '<div class="job-list-option">' +
                    '<ul class="list-unstyled">' +
                    '<li><a href="#"><i class="fas fa-filter pe-1"></i>' + likedJob.jobTypeCodeName + '</a></li>' +
                    '</ul>' +
                    '<ul class="list-unstyled">' +
                    '<li><i class="fas fa-map-marker-alt pe-1"></i>' + likedJob.address + '</li>' +
                    '<li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>' + likedJob.salaryTypeCodeName + ':' + likedJob.salary + '</a></li>' +
                    '</ul>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="job-list-favourite-time">' +
                    '<a class="job-list-favourite order-2" href="#"><i class="fas fa-heart text-danger"></i></a>' +
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
        $(document).on('click', '.pagination .page-link', function (e) {
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
<%--                <div class="row mb-3 mb-lg-5 mt-3 mt-lg-0">--%>
<%--                    <div class="col-lg-4 mb-4 mb-lg-0">--%>
<%--&lt;%&ndash;                        <div class="btn btn-danger mb-2">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <i class="fas fa-heart text-alt"></i> <span class="text-white" id="amount">00</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                        <div class="candidates-feature-info bg-danger">--%>

<%--                            <div class="candidates-info-icon text-white">--%>
<%--                                <i class="fas fa-heart text-alt"></i>--%>
<%--                            </div>--%>
<%--                            <div class="candidates-info-content">--%>
<%--                                <h5 class="candidates-info-title text-white">좋아요 한 공고들</h5>--%>
<%--                            </div>--%>
<%--                            <div class="candidates-info-count">--%>
<%--                                <h3 class="mb-0 text-white" id="amount">00</h3>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="mb-0 pb-4">
                    <div class="section-title-02 mb-4">
                        <h4>관심 공고 목록</h4>
                    </div>
                    <div class="container">
                        <!-- applyList -->
                        <div class="row" id="likedJobList">
                        </div>
                    </div>
                    <div class="col-12 text-center py-3" id="noResultsMessage">
                        조회된 결과가 없습니다.
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
