<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

            // 산업번호 선택 값 추가
            jsonData['industryCode'] = $('select[name=industryCode]').val();

            // // 사업종류 선택 값 추가
            jsonData['businessTypeCode'] = $('select[name=businessTypeCode]').val();
            //

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
                        location.href='/business/profile'
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        }
    }

    function uploadFile() {
        const form = document.getElementById('uploadForm');
        const formData = new FormData(form);

        $.ajax({
            url: "/business/uploadedFile", // Spring 컨트롤러 URL
            type: 'POST',
            processData: false, // jQuery가 데이터를 처리하지 않도록 설정
            contentType: false, // jQuery가 Content-Type 헤더를 설정하지 않도록 설정
            data: formData, // JSON 형식으로 데이터 전송
            success: function(data) {
                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                console.log(data);
                if(data.code === 'success') {
                    $('#coverImage').attr('src', data.url);
                }
            },
            error: function(xhr, status, error) {
                // 오류 발생 시 실행할 코드
                console.error(error);
            }
        });
    }

    //DOM이 실행 후 실행 됨
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("business_profile_sava_button").addEventListener("click", function () {
            business_profile.init();
        });
        $('#address, #zipcode').on("click", function() { // 클릭 이벤트 사용
            new daum.Postcode({
                oncomplete: function(data) { // 선택시 입력값 세팅
                    console.log(":::::::: " + JSON.stringify(data));
                    $('#zipcode').val(data.zonecode);
                    $('#address').val(data.address); // 주소 넣기
                    $('input[name=addressDetail]').focus(); // 상세입력 포커싱
                }
            }).open();
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
                            <img class="img-fluid" id="coverImage" src="" alt="">
                            <i class="fas fa-times-circle"></i>
                        </div>
                        <form id="uploadForm" enctype="multipart/form-data">
                            <div>
                                <input class="form-control" type="file" id="file" name="file">
                                <input class="btn btn-primary" type="button" value="업로드" onclick="uploadFile()">
                            </div>
                        </form>
<%--                        <div class="upload-file">--%>
<%--                            <form id="uploadForm" enctype="multipart/form-data">--%>
<%--                                <input class="btn btn-primary mt-2" type="button" value="업로드" onclick="uploadFile()">--%>
<%--                                <input class="btn btn-primary mt-2" type="button" value="수정" onclick="uploadFile()">--%>
<%--                                <input class="btn btn-primary mt-2" type="button" value="삭제" onclick="uploadFile()">--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                        <div class="upload-file">--%>
<%--                            <form id="uploadForm" enctype="multipart/form-data">--%>
<%--                                <label for="formFile" class="form-label">Upload Cover Photo</label>--%>
<%--                                <input class="form-control" type="file" id="formFile" name="files">--%>
<%--                            </form>--%>
<%--                        </div>--%>
                    </div>
                    <form id="businessSaveProfile" name="businessSaveProfile">
                        <div class="row">
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">기업 이름</label>
                                <input type="text" class="form-control" value="${company.companyName}" id="companyName" name="companyName">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">기업 연락처</label>
                                <input type="text" class="form-control" value="${company.officePhone}" id="officePhone" name="officePhone">
                            </div>
                            <div class="form-group col-md-4 mb-3 select-border">
                                <label class="form-label" for="industryCode">산업종류</label>
                                <select class="form-control basic-select" name="industryCode" id="industryCode" >
                                    <option value="선택" selected="selected">선택</option>
                                    <option value="IT" ${company.industryCode == 'IT' ? 'selected="selected"' : ''}>IT</option>
                                    <option value="SELF" ${company.industryCode == 'SELF' ? 'selected="selected"' : ''}>자영업</option>
                                    <option value="MAN" ${company.industryCode == 'MAN' ? 'selected="selected"' : ''}>제조업</option>
                                    <option value="SER" ${company.industryCode == 'SER' ? 'selected="selected"' : ''}>서비스업</option>
                                    <option value="FIN" ${company.industryCode == 'FIN' ? 'selected="selected"' : ''}>금융업</option>
                                    <option value="EDU" ${company.industryCode == 'EDU' ? 'selected="selected"' : ''}>교육업</option>
                                    <option value="CON" ${company.industryCode == 'CON' ? 'selected="selected"' : ''}>건설업</option>
                                    <option value="MED" ${company.industryCode == 'MED' ? 'selected="selected"' : ''}>의료업</option>
                                    <option value="AGR" ${company.industryCode == 'AGR' ? 'selected="selected"' : ''}>농업</option>
                                    <option value="DIS" ${company.industryCode == 'DIS' ? 'selected="selected"' : ''}>유통업</option>
                                    <option value="PUB" ${company.industryCode == 'PUB' ? 'selected="selected"' : ''}>공공기관</option>
                                    <option value="OTH" ${company.industryCode == 'OTH' ? 'selected="selected"' : ''}>기타</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 mb-3 select-border">
                                <label class="form-label" for="businessTypeCode">회사종류</label>
                                <select class="form-control basic-select" name="businessTypeCode" id="businessTypeCode">
                                    <option value="선택">선택</option>
                                    <option value="CORP" ${company.businessTypeCode == 'CORP' ? 'selected="selected"' : ''}>법인사업자</option>
                                    <option value="GEN" ${company.businessTypeCode == 'GEN' ? 'selected="selected"' : ''}>일반사업자 </option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 mb-3">
                                <label class="form-label">사업자 번호</label>
                                <input type="text" class="form-control" value="${company.businessNumber}"  name="businessNumber" id="businessNumber">
                            </div>
                            <div class="form-group mb-3 col-md-3">
                                <label class="form-label">우편번호</label>
                                <input type="text" class="form-control" id="zipcode" placeholder="우편번호" value="${profile.zipcode}" name="zipcode" readonly>
                            </div>
                            <div class="form-group mb-3 col-md-9">
                                <label class="form-label">도로명주소 </label>
                                <input type="text" class="form-control" id="address" placeholder="도로명주소" value="${profile.address}" name="address" readonly>
                            </div>
                            <div class="form-group mb-3 col-md-12">
                                <label class="form-label">상세주소 </label>
                                <input type="text" class="form-control" id="addressDetail" placeholder="상세주소" value="${profile.addressDetail}" name="addressDetail">
                            </div>
                            <div class="form-group col-md-12 mb-3">
                                <label class="mb-2"> 회사 소개 </label>
                                <textarea class="form-control" rows="4" name="companyDescription" id="companyDescription">${company.companyDescription}</textarea>
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