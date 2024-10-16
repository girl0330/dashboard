<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .section-margin-top {
        margin-top: 70px; /* 원하는 간격으로 설정 */
    }
</style>
<script>
    const keywordSearch = {
        init : function () {
            //첫페이지 1 입력
            this.keywordSearchSubmit(1);
        },

        keywordSearchSubmit: function (pageNum) {
            const userNo = `${userNo}`;
            const keyword = $('#keyword').val(); // input 필드에서 값 가져오기
            const jobNum = $('#jobNum').val(); // jobId

            const options = {
                url: '/business/ajax/candidateList',
                type: 'GET',
                data: {
                    userNo: userNo,
                    pageNum: pageNum,
                    pageSize: 10,
                    keyword: keyword,
                    jobNum: jobNum
                },
                done: function(response) {
                    console.log(response);
                    // 성공 시 실행할 코드
                    keywordSearch.renderJob(response.list, response.loginUserNo);
                    renderPagination('pagination', response.pageNum, response.pageSize, response.total, response.pages);
                },
                fail: function(jqXHR) {
                    console.error('요청 실패:', jqXHR.responseText); // 서버에서 반환된 응답
                    const errorResponse = JSON.parse(jqXHR.responseText); // JSON 파싱
                    alert("에러 발생: " + errorResponse.userMessage); // 사용자에게 에러 메시지 노출
                }
            };

            ajax.call(options);

        },
        renderJob: function(list, loginUserNo){
            const container = $("#candidateList");
            container.empty();
// 반복문 시작 전에 loginUserNo를 포함하는 <input> 요소를 먼저 추가
            container.append('<input type="hidden" id="loginUserNo" name="" value="' + loginUserNo + '">');

            list.forEach(candidate => {
                const tableHtml =
                    '<tr onclick="location.href = \'/business/candidateDetail?userNo=' + candidate.userNo + '&jobId=' + candidate.jobId + '\'">' +
                    '<td class="col-md-2">' +
                    '<input type="hidden" id="jobId" name="jobId" value="' + candidate.jobId + '">' +
                    '<a>' + candidate.name + '</a>' +
                    '</td>' +
                    '<td class="col-md-2">' + candidate.old + ' 살</td>' +
                    '<td class="col-md-2">' + candidate.phone + '</td>' +
                    '<td class="col-md-2">' + candidate.gender + '</td>' +
                    '<td class="col-md-2">' + candidate.statusTypeCodeName + '</td>' +
                    '<td class="col-md-2">' + candidate.systemRegisterDatetime + '</td>' +
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

<section class="section-margin-top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box mb-0">
                    <div class="row mb-4">
                        <div class="col-md-7 col-sm-5 d-flex align-items-center">
                            <div class="section-title-02 mb-0 ">
                                <input type="hidden" id="jobNum" name="jobNum" value="${id}">
                                <h4 class="mb-0">${applicantList[0].title}</h4>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-md-7 col-sm-5 d-flex align-items-center">
                                <div class="section-title-02 mb-0 ">
                                    <h2 class="mb-0">지원자 리스트</h2>
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7 mt-3 mt-sm-0">
                                <div class="search">
                                    <i class="fas fa-search" id="searchButton"></i>
                                    <input type="text" class="form-control" id="keyword" name="keyword" placeholder="Search...">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="user-dashboard-table table-responsive">
                        <table class="table table-bordered">
                            <thead class="bg-light">
                            <tr>
                                <th class="col-md-2" scope="col">지원자</th>
                                <th class="col-md-2" scope="col">나이</th>
                                <th class="col-md-2" scope="col">핸드폰</th>
                                <th class="col-md-2" scope="col">성별</th>
                                <th class="col-md-2" scope="col">상태</th>
                                <th class="col-md-2" scope="col">지원 날짜</th>
                            </tr>
                            </thead>
                            <tbody id="candidateList">

                            </tbody>
                        </table>
                    </div>
                    <a class="btn btn-outline-primary mb-3 mb-sm-0"  onclick="location.href = '/business/managePostJob'">공고목록</a>
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
