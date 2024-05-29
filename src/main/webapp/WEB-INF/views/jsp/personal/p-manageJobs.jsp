<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    let deleteApplication = {
        init : function () {
            this.deleteClick();
        },
        deleteClick : function () {
            alert("공고 삭제 클릭")
            const applicationIdValue = $('#applicationId').val();
            const jsonData = parseInt(applicationIdValue, 10);
            console.log("jsonData = "+ JSON.stringify(jsonData));

            $.ajax({
                url: "/personal/applyListDelete", // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
                success: function(data) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(data));
                    if(data.code === 'success') {
                        alert(data.message);
                        location.href='/personal/manageJobs'
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        $('#delete').click(function() {
            deleteApplication.init();
        });
    });
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
                                <h4 class="mb-0">Manage Jobs</h4>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-7 mt-3 mt-sm-0">
                            <div class="search">
                                <i class="fas fa-search"></i>
                                <input type="text" class="form-control" placeholder="Search....">
                            </div>
                        </div>
                    </div>
                    <div class="user-dashboard-table table-responsive">
                        <table class="table table-bordered">
                            <thead class="bg-light">
                            <tr>
                                <th scope="col">지원한 공고 제목</th>
                                <th scope="col">지원 현황</th>
                                <th scope="col">관리</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${applyList}" var="applyList">
                            <tr>
                                <th scope="row"> ${applyList.title}
                                    <input type="hidden" id="applicationId" name="applicationId" value="${applyList.applicationId}">
                                    <input type="hidden" id="jobId" name="jobId" value="${applyList.jobId}">
                                    <p class="mb-1 mt-2"> 지원한 날짜 : ${applyList.systemRegisterDatetime}</p>
                                    <p class="mb-0">Address: Wellesley Rd, London</p>
                                </th>
                                <td>${applyList.statusTypeCode}</td>
                                <td>
                                    <ul class="list-unstyled mb-0 d-flex">
                                        <li><a href="#" class="job-list-favourite order-2" id="interest" name="interest" data-bs-toggle="tooltip" title="관심" ><i class="far fa-star"></i></a></li>
                                        <li><a href="#" class="text-primary" onclick="location.href='/business/detail?jobId=${applyList.jobId}'" id="look" name="look" data-bs-toggle="tooltip" title="자세히"><i class="far fa-eye"></i></a></li>
                                        <li><a href="#" class="text-danger" id="delete" name="delete" data-bs-toggle="tooltip" title="삭제" ><i class="far fa-trash-alt"></i></a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-12 text-center">
                            <ul class="pagination mt-3">
                                <li class="page-item disabled me-auto">
                                    <span class="page-link b-radius-none">Prev</span>
                                </li>
                                <li class="page-item active" aria-current="page"><span class="page-link">1 </span> <span class="sr-only">(current)</span></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item ms-auto">
                                    <a class="page-link" href="#">Next</a>
                                </li>
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
