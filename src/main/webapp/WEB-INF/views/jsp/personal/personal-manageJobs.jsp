<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    const keywordSearch = {
        init: function () {
            this.keywordSearchSubmit(1);
        },

        keywordSearchSubmit : function (pageNum) {

            $.ajax({
                url: '/personal/ajax/manageJobsList',
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
            console.log("list :: "+JSON.stringify(list));
            const container = $("#applyStatusJobList");
            container.empty();// id속성 초기화

            list.forEach(function (applyStatusJob) {
                const tableHtml =
                    '<tr>' +
                    '<th scope="row">' +
                    '<a href="#" class="text-primary" onclick="location.href=\'/business/detail?jobId=' + applyStatusJob.jobId + '\'" id="look" name="look">' +
                    '<h6 class="mb-0">' + applyStatusJob.title + '</h6>' +
                    '</a>' +
                    '<p class="mb-1 mt-2"><i class="fas fa-map-marker-alt pe-1">' + applyStatusJob.address + '</i></p>' +
                    '<p class="mb-0">지원한 날짜 : ' + applyStatusJob.systemRegisterDatetime + '</p>' +
                    '</th>' +
                    '<td>' + applyStatusJob.statusTypeCodeName + '</td>' +
                    '</tr>'

                container.append(tableHtml);
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
                                <h4 class="mb-0">지원 현황</h4>
                            </div>
                        </div>
                    </div>

                    <table class="table table-bordered">
                        <thead class="bg-light">
                        <tr >
                            <th scope="col">지원한 공고 제목</th>
                            <th scope="col">지원 현황</th>
                        </tr>
                        </thead>
                        <tbody id="applyStatusJobList">
                        <!-- 리스트 들어올 부분 -->
                        </tbody>
                    </table>
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
