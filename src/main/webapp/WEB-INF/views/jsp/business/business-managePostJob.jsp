<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    const keywordSearch = {
        init : function () {
            //첫페이지 1 입력
            this.keywordSearchSubmit(1);
        },

        keywordSearchSubmit: function (pageNum) {
            // 새로운 HTML을 생성하여 삽입
            const keyword = $('#keyword').val(); // input 필드에서 값 가져오기

            $.ajax({
                url: '/business/ajax/managePostJob',
                type: 'GET',
                data: {
                    pageNum: pageNum,
                    pageSize: 10,
                    keyword: keyword
                },
                success: function(response) {
                    // 성공 시 실행할 코드
                    keywordSearch.renderJobsp(response.list);
                    renderPagination('pagination', response.pageNum, response.pageSize, response.total, response.pages);
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        },
        renderJobsp: function(list){
            const container = $("#postJobList");
            container.empty();

            list.forEach(postJob => {
                const tableHtml =
                    '<tr>' +
                    '<th scope="row">' +
                    '<span class="clickable-title">' +
                    '<a href="#" onclick="location.href=\'/business/detail?jobId=' + postJob.jobId + '\'">' +
                    '<h5>' + postJob.title + ' (' + postJob.jobTypeCodeName + ')</h5>' +
                    '</a>' +
                    '</span>' +
                    '<input type="hidden" id="jobId" name="jobId" value="' + postJob.jobId + '">' +
                    '<p class="mb-1 mt-2">급여 (' + postJob.salaryTypeCodeName + ' - ' + postJob.salary + ')</p>' +
                    '<p class="mb-1 mt-2">작성한 날짜: ' + postJob.systemRegisterDatetime + '</p>' +
                    '</th>' +
                    '<td>' +
                    postJob.countApplication +
                    '<a href="#" class="text-primary" onclick="location.href=\'/business/candidateList?jobId=' + postJob.jobId + '\'" id="look" name="look" data-bs-toggle="tooltip" title="지원자 보기"><i class="far fa-eye"></i></a>' +
                    '</td>' +
                    '<td>' + postJob.statusTypeCodeName + '</td>' +
                    '</tr>';

                container.append(tableHtml);
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
    });
</script>
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
                                <h2 class="mb-0">작성한 공고</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5 col-sm-7 mt-3 mt-sm-0">
                                <form class="form row">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="keyword" name="keyword" placeholder="Search...">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button" id="searchButton"><i class="fas fa-search-location"></i> 검색하기</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="user-dashboard-table table-responsive">
                        <table class="table table-bordered">
                            <thead class="bg-light">
                            <tr>
                                <th scope="col">작성한 공고 제목</th>
                                <th scope="col">지원자 현황</th>
                                <th scope="col">공고 현황</th>
                            </tr>
                            </thead>
                            <tbody id="postJobList">
                            <!-- 리스트 들어올 부분 -->
                            </tbody>
                        </table>
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
    </div>
</section>
<!--=================================
Manage Jobs -->
