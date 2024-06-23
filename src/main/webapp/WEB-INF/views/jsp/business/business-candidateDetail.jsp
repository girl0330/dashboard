<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    let applyButton = {
        init : function () {
            this.submitAapply();
        },
        submitAapply : function () {

            const jobId = $("#jobId").val();
            const userNo = $("#userNo").val();


            let jsonData = {}
            jsonData["jobId"] = jobId;
            jsonData["userNo"] = userNo;
            // 해당 값을 JSON 데이터로 변환 : const jsonData = {"jobId": jobIdInt};(이렇게도 사용할 수 있음.)

            console.log("jsonData: "+ JSON.stringify(jsonData));

            $.ajax({
                url: "/business/applyCandidate", // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
                success: function(data) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(data));
                    if(data.code === 'success') {
                        alert(data.message);
                        location.href = '/business/candidateList?jobId='+jobId;
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        }
    }
    let applyCancelButton = {
        init : function () {
            this.submitApplyCancel();
        },
        submitApplyCancel : function () {

            const jobId = $("#jobId").val();
            const userNo = $("#userNo").val();


            let jsonData = {}
            jsonData["jobId"] = jobId;
            jsonData["userNo"] = userNo;

            // 해당 값을 JSON 데이터로 변환
            // const jsonData = {"jobId": jobIdInt};
            console.log("jsonData: "+ JSON.stringify(jsonData));

            $.ajax({
                url: "/business/applyCancelCandidate", // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
                success: function(data) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(data));
                    if(data.code === 'success') {
                        alert(data.message);
                        location.href = '/business/candidateList?jobId=' +jobId
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
        $('#applyButton').click(function () {
            applyButton.init();
        });
        $('#applyCancelButton').click(function () {
            applyCancelButton.init();
        });
    });
</script>
<!--=================================
Dashboard Nav -->
<%@ include file="businessMenuInclude.jsp"%>
<!--=================================
Dashboard Nav -->

<!--=================================
Change Password -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box">
                    <div class="section-title-02 mb-4">
                        <h4>${candidateInfo.name}</h4>
                        <input type="hidden" class="form-control" value="${candidateInfo.jobId}" id="jobId">
                        <input type="hidden" class="form-control" value="${candidateInfo.userNo}" id="userNo">
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <form class="row">
                                <div class="form-group col-md-3 mb-3">
                                    <label class="form-label">연락처</label>
                                    <input type="text" class="form-control" value="${candidateInfo.phone}" readonly>
                                </div>
                                <div class="form-group col-md-3 mb-3">
                                    <label class="form-label">생년월일</label>
                                    <input type="text" class="form-control" value="${candidateInfo.birth}" readonly>
                                </div>
                                <div class="form-group col-md-3 mb-3">
                                    <label class="form-label">성별</label>
                                    <input type="text" class="form-control" value="${candidateInfo.gender}" readonly>
                                </div>
                                <div class="form-group col-md-3 mb-3">
                                    <label class="form-label">상태</label>
                                    <input type="hidden" class="form-control" value="${candidateInfo.statusTypeCode}" id="statusTypeCode">
                                    <input type="text" class="form-control" value="${candidateInfo.statusTypeCodeName}" id="statusTypeCodeName" readonly>
                                </div>
                                <div class="form-group col-md-12 mt-0 mb-3">
                                    <label class="form-label">지원자의 지원동기 </label>
                                    <textarea class="form-control" rows="4" readonly>${candidateInfo.motivationDescription}</textarea>
                                </div>
                                <div>
                                지원 날짜 : ${candidateInfo.systemRegisterDatetime}
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <c:if test="${candidateInfo.statusTypeCode == 'APPLIED'}">
                <a class="btn btn-outline-primary mb-3 mb-sm-0" href="#" id="applyButton" name="applyButton">채용하기</a>
                </c:if>
                <c:if test="${candidateInfo.statusTypeCode == 'HIRED'}">
                <a class="btn btn-outline-primary mb-3 mb-sm-0" href="#" id="applyCancelButton" name="applyCancelButton">채용취소하기</a>
                </c:if>
                <a class="btn btn-outline-primary mb-3 mb-sm-0"  onclick="location.href = '/business/applicantList?jobId=${candidateInfo.jobId}'">지원자 관리 목록</a>
            </div>
        </div>
    </div>
</section>
<!--=================================
Change Password -->