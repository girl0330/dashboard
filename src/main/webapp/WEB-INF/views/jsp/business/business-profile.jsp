<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afcb905c7668725d0a22469ede432941&libraries=services"></script>
<script>
    let business_profile = {
        init : function () {
            this.formSubmit();
        },

        // 전송 함수 정의
        formSubmit : function() {
            const formData = new FormData();

            // FormData에 유효한 값만 추가 [분해구조할당 사용]
            $("#businessSaveProfile").serializeArray().forEach(({ name, value }) => {
                if (value.trim()) { // 공백만 있는 값도 제외
                    formData.append(name, value);
                }
            });

            // 파일 추가
            const fileInput = $('#fileInput')[0];
            const file = fileInput.files[0];
            if (file) {
                formData.append('file', file);
            }

            //파일 아이디 추가
            const fileId = $("#fileId").val();
            if (fileId) {
                formData.append("fileId", fileId);
            }

            // 디버깅용 출력
            for (let [key, value] of formData.entries()) {
                console.log(key + ": " + value);
            }

            $.ajax({
                url: "/business/profileSave", // Spring 컨트롤러 URL
                type: 'POST',
                contentType: false, // 파일 전송을 위해 false로 설정
                processData: false, // 파일 전송을 위해 false로 설정
                data: formData, // JSON 형식으로 데이터 전송
                success: function(data) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(data));
                    if(data.code === 'error') {
                        alert(data.message);
                    } else if (data.code === 'success'){
                        alert(data.message);
                        location.href='/business/profile'
                    } else if (data.code === 'businessNumError') {
                        alert(data.message);
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
    $(document).ready(function(){
        document.getElementById("business_profile_sava_button").addEventListener("click", function () {
            business_profile.init();
        });

        //업로드할 파일 선택
        $('#fileUpload').on('click', function () {
            $('#fileInput').click();
        });

        $('#fileInput').on('change', function(event) {
            const coverImage = document.getElementById('coverImage');
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    coverImage.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });

        // 파일 삭제
        $('#fileDelete').on('click', function () {
            alert("삭제?")
            const fileId = $("#fileId").val();
            console.log("fileId는?  :    "+ JSON.stringify(fileId));

            $.ajax({
                url: "/business/deleteFile/"+fileId, // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: '',
                success: function(data) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(data));
                    if (data.code === 'success'){
                        alert(data.message);
                        // 이미지 미리보기 삭제
                        const coverImage = document.getElementById('coverImage');
                        coverImage.src = ''; // 미리보기 이미지 초기화
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        });

        // 주소값
        $('#address, #zipcode').on("click", function() { // 클릭 이벤트 사용
            new daum.Postcode({
                oncomplete: function(data) { // 선택시 입력값 세팅
                    new daum.maps.services.Geocoder().addressSearch(data.address, function(results, status) {
                        if (status === daum.maps.services.Status.OK) {
                            const result = results[0]; //첫번째 결과의 값을 활용

                            $('#zipcode').val(data.zonecode);
                            $('#address').val(data.address); // 주소 넣기
                            $("#latitude").val(result.y); //위도
                            $("#longitude").val(result.x); //경도
                            $('input[name=addressDetail]').focus(); // 상세입력 포커싱
                        }
                    })
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
<%--                    <div class="cover-photo-contact">--%>
<%--                        <form action="" method="post" enctype="multipart/form-data">--%>
<%--                            <div class="cover-photo">--%>
<%--                                <img class="img-fluid " src="images/bg/cover-bg.png" alt="">--%>
<%--                                <i class="fas fa-times-circle"></i>--%>
<%--                            </div>--%>
<%--                            <div class="upload-file">--%>
<%--                                <label for="formFile" class="form-label">Upload Cover Photo</label>--%>
<%--                                <input class="form-control" type="file" id="formFile">--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
                    <div class="cover-photo-contact mb-3 " >
                        <div class="cover-photo">
                            <img class="img-fluid" id="coverImage" src="/business/uploadedFileGet/${fileId}" alt="Uploaded Image" style="width: 225px; height: 225px;" >
                            <i class="fas fa-times-circle" id="fileDelete"><input id="fileId" type='hidden' value='${fileId}'></i>
                        </div>
                        <div class="upload-file">
                            <label class="form-label" id="fileUpload">프로필 사진 업로드</label>
                        </div>
                    </div>
                    <form id="businessSaveProfile" name="businessSaveProfile" enctype="multipart/form-data">
                        <input type="file" id="fileInput" name="fileInput" style="display:none;" />
                        <div class="row">
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">기업 이름</label>
                                <input type="hidden" value="${company.companyId}" id="companyId" name="companyId">
                                <input type="text" class="form-control" value="${company.companyName}" id="companyName" name="companyName">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">기업 연락처 ['-'를 제외]</label>
                                <input type="text" class="form-control" value="${company.officePhone}" id="officePhone" name="officePhone">
                            </div>
                            <div class="form-group col-md-4 mb-3 select-border">
                                <label class="form-label" for="industryCode">산업종류</label>
                                <select class="form-control basic-select" name="industryCode" id="industryCode" >
                                    <option value="" selected="selected">선택</option>
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
                                    <option value="">선택</option>
                                    <option value="CORP" ${company.businessTypeCode == 'CORP' ? 'selected="selected"' : ''}>법인사업자</option>
                                    <option value="GEN" ${company.businessTypeCode == 'GEN' ? 'selected="selected"' : ''}>일반사업자 </option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 mb-3">
                                <label class="form-label">사업자 번호 ['-'를 제외]</label>
                                <input type="text" class="form-control" value="${company.businessNumber}"  name="businessNumber" id="businessNumber">
                            </div>
                            <div class="form-group mb-3 col-md-3">
                                <label class="form-label">우편번호</label>
                                <input type="text" class="form-control" id="zipcode" placeholder="우편번호" value="${company.zipcode}" name="zipcode" readonly>
                                <input type="hidden" class="form-control" id="latitude" name="latitude" data-name="위도">
                                <input type="hidden" class="form-control" id="longitude" name="longitude" data-name="경도">
                            </div>
                            <div class="form-group mb-3 col-md-9">
                                <label class="form-label">도로명주소 </label>
                                <input type="text" class="form-control" id="address" placeholder="도로명주소" value="${company.address}" name="address" readonly>
                            </div>
                            <div class="form-group mb-3 col-md-12">
                                <label class="form-label">상세주소 </label>
                                <input type="text" class="form-control" id="addressDetail" placeholder="상세주소" value="${company.addressDetail}" name="addressDetail">
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