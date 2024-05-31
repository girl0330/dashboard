<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    let business_profile = {
        init : function () {
            this.formSubmit();
        },

        // 전송 함수 정의
        formSubmit : function() {
            alert("전송함수")
            const formData = $("#businessSaveProfile").serializeArray();

            // JSON 객체로 변환
            let jsonData = {};
            $.each(formData, function() {
                jsonData[this.name] = this.value;
            });

            // 성별 선택 값 추가
            jsonData['industryCodeName'] = $('select[name=industryCodeName]').val();

            // 알바경험 선택 값 추가
            jsonData['businessTypeCode'] = $('select[name=businessTypeCode]').val();

            console.log("x:::  "+JSON.stringify(jsonData));

            $.ajax({
                url: "/business/profileSave", // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
                success: function(data) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(data));
                    if(data.code === 'error') {
                        alert(data.message);
                    } else if (data.code === 'success'){
                        alert(data.message);
                        location.href='/personal/myProfile'
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        }
    }

    //DOM이 실행 후 실행 됨
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("business_profile_sava_button").addEventListener("click", function () {
            business_profile.init();
        });
    });
</script>
<!--=================================
Dashboard Nav -->
<%@ include file="businessMenuInclude.jsp"%>
<!--=================================
Dashboard Nav -->

<!--=================================
My Profile -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box">
                    <div class="section-title-02 mb-4">
                        <h4>기본 정보</h4>
                    </div>
                    <div class="cover-photo-contact">
                        <div class="cover-photo">
                            <img class="img-fluid " src="/images/bg/cover-bg.png" alt="">
                            <i class="fas fa-times-circle"></i>
                        </div>
                        <div class="upload-file">
                            <label for="formFile" class="form-label">Upload Cover Photo</label>
                            <input class="form-control" type="file" id="formFile">
                        </div>
                    </div>
                    <form id="businessSaveProfile" name="businessSaveProfile">
                        <div class="row">
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">기업 이름</label>
                                <input type="text" class="form-control" value="${company.companyName}" id="companyName" name="companyName">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">주소</label>
                                <input type="email" class="form-control" value="${company.address}"  name="address" id="address">
                            </div>
                            <div class="form-group col-md-6 mb-3 select-border">
                                <label class="form-label" for="industryCode">산업 번호</label>
                                <select class="form-control basic-select" name="industryCode" id="industryCode" >
                                    <option value="선택" selected="selected">선택</option>
                                    <option value="IT">IT</option>
                                    <option value="SELF">자영업</option>
                                    <option value="MAN">제조업</option>
                                    <option value="SER">서비스업</option>
                                    <option value="FIN">금융업</option>
                                    <option value="EDU">교육업</option>
                                    <option value="CON">건설업</option>
                                    <option value="MED">의료업</option>
                                    <option value="AGR">농업</option>
                                    <option value="DIS">유통업</option>
                                    <option value="PUB">공공기관</option>
                                    <option value="OTH">기타</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6 mb-3 select-border">
                                <label class="form-label" for="businessTypeCode">회사 타입</label>
                                <select class="form-control basic-select" name="businessTypeCode" id="businessTypeCode">
                                    <option value="선택" selected="selected">선택</option>
                                    <option value="CORP">법인사업자</option>
                                    <option value="GEN">일반사업자 </option>
                                </select>
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">사업자 번호</label>
                                <input type="text" class="form-control" value="${company.businessNumber}"  name="businessNumber" id="businessNumber">
                            </div>
                            <div class="form-group col-md-12 mb-3">
                                <label class="mb-2"> 회사 소개 </label>
                                <textarea class="form-control" rows="4" value="${company.companyDescription}" name="companyDescription" id="companyDescription"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <a class="btn btn-md btn-primary" id="business_profile_sava_button">저장</a>
            </div>
        </div>
    </div>
</section>
<!--=================================
My Profile -->