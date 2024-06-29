<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    let applyButton = {
        init : function () {
            this.submitAapply();
        },
        submitAapply: function () {
            const jobId = $("#jobId").val();
            const userNo = $("#userNo").val();

            let jsonData = {}
            jsonData["jobId"] = jobId;
            jsonData["userNo"] = userNo;

            console.log("jsonData: "+ JSON.stringify(jsonData));

            const options = {
                url: '/business/employCandidate',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData),

                beforeSend: () => {
                    console.log('요청 전 작업 수행');
                },
                customFail: (response) => {
                    console.error('커스텀 실패 처리:', response);
                },
                done: function(response) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(response));
                    if(response.code === 'success') {
                        alert(response.message);
                        location.href = '/business/candidateList?jobId='+jobId;
                    }
                },
                fail: () => {
                    console.error('요청 실패');
                }
            };

            ajax.call(options);

        }
    }
    let applyCancelButton = {
        init : function () {
            this.submitApplyCancel();
        },
        submitApplyCancel: function () {
            const jobId = $("#jobId").val();
            const userNo = $("#userNo").val();


            let jsonData = {}
            jsonData["jobId"] = jobId;
            jsonData["userNo"] = userNo;

            const options = {
                url: '/business/cancelEmployCandidate',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData),

                beforeSend: () => {
                    console.log('요청 전 작업 수행');
                },
                customFail: (response) => {
                    console.error('커스텀 실패 처리:', response);
                },
                done: function(response) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(response));
                    if(response.code === 'success') {
                        alert(response.message);
                        location.href = '/business/candidateList?jobId=' +jobId
                    }
                },
                fail: () => {
                    console.error('요청 실패');
                }
            };

            ajax.call(options);

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
                        <h4>${candidateDetailInfo.name}</h4>
                        <input type="hidden" class="form-control" value="${candidateDetailInfo.jobId}" id="jobId">
                        <input type="hidden" class="form-control" value="${candidateDetailInfo.userNo}" id="userNo">
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <form class="row">
                                <div class="form-group col-md-3 mb-3">
                                    <label class="form-label">연락처</label>
                                    <input type="text" class="form-control" value="${candidateDetailInfo.phone}" readonly>
                                </div>
                                <div class="form-group col-md-3 mb-3">
                                    <label class="form-label">생년월일</label>
                                    <input type="text" class="form-control" value="${candidateDetailInfo.birth}" readonly>
                                </div>
                                <div class="form-group col-md-3 mb-3">
                                    <label class="form-label">성별</label>
                                    <input type="text" class="form-control" value="${candidateDetailInfo.gender}" readonly>
                                </div>
                                <div class="form-group col-md-3 mb-3">
                                    <label class="form-label">상태</label>
                                    <input type="hidden" class="form-control" value="${candidateDetailInfo.statusTypeCode}" id="statusTypeCode">
                                    <input type="text" class="form-control" value="${candidateDetailInfo.statusTypeCodeName}" id="statusTypeCodeName" readonly>
                                </div>
                                <div class="form-group col-md-12 mt-0 mb-3">
                                    <label class="form-label">지원자의 지원동기 </label>
                                    <textarea class="form-control" rows="4" readonly>${candidateDetailInfo.motivationDescription}</textarea>
                                </div>
                                <div>
                                지원 날짜 : ${candidateDetailInfo.systemRegisterDatetime}
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <c:if test="${candidateDetailInfo.statusTypeCode == 'APPLIED'}">
                <a class="btn btn-outline-primary mb-3 mb-sm-0" href="#" id="applyButton" name="applyButton">채용하기</a>
                </c:if>
                <c:if test="${candidateDetailInfo.statusTypeCode == 'HIRED'}">
                <a class="btn btn-outline-primary mb-3 mb-sm-0" href="#" id="applyCancelButton" name="applyCancelButton">채용취소하기</a>
                </c:if>
                <a class="btn btn-outline-primary mb-3 mb-sm-0"  onclick="location.href = '/business/candidateList?jobId=${candidateDetailInfo.jobId}'">지원자 관리 목록</a>
            </div>
        </div>
    </div>
</section>
<!--=================================
Change Password -->