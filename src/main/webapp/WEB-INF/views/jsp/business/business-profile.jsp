<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afcb905c7668725d0a22469ede432941&libraries=services"></script>
<script>
    let business_profile = {
        init : function () {
            // 공백검사
            if (!this.emptyCheck()) {
                return;
            }
            //기업 연락처, 사업자번호
            if(!this.onlyNumber()) {
                return;
            }
            if (!this.profileValidation()) {

            }
            this.formSubmit();
        },
        // 공백검사
        emptyCheck : function() {
            let valid = true;
            $('[data-valid="true"]').each(function() {
                // 각 요소의 이름과 값을 출력 (또는 다른 작업 수행)
                console.log($(this).attr('name') + ': ' + $(this).val());
                const fields = $(this);
                const removeBlank = fields.val().replace(/\s*/g, "");
                if (removeBlank === "") {
                    let text = $(this).attr('data-name');
                    alert(text+"반드시 입력해주세요");
                    fields.focus();
                    valid = false;
                    return valid;
                }
            });
            return valid;
        },
        //숫자만 사용
        onlyNumber : function () {
            let valid = true;
            $('input[id*="Number"]').each(function () {
                console.log($(this).attr('name') + '-' + $(this).val());
                const numberField = $(this).val();

                let nonNumericPattern = /[^0-9]/g;
                if (nonNumericPattern.test(numberField)) {
                    let text = $(this).attr('data-name');
                    alert(text + '에 숫자만 입력해주세요.');
                    $(this).focus();
                    valid = false;
                    return valid;
                }
            })
            return valid;
        },
        profileValidation : function () {
            let valid = true;
            const companyName = $('#companyName').val();

            let nameRegex = /[.!@#$%^&*]+/;
            if (nameRegex.test(companyName)) {
                alert("특수문자는 사용할 수 없습니다.");
                $('#companyName').focus();
                valid = false;
                return valid;
            }
            return valid;
        },

        // 전송 함수 정의
        formSubmit: function () {
            const formData = new FormData();

            // FormData에 유효한 값만 추가 [분해구조할당 사용]
            $("#businessInsertProfile").serializeArray().forEach(({ name, value }) => {
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

            const options = {
                url: "/business/ajax/insertProfile", // Spring 컨트롤러 URL
                type: 'POST',
                contentType: false, // 파일 전송을 위해 false로 설정
                processData: false, // 파일 전송을 위해 false로 설정
                data: formData,

                done: function(response) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(response));
                    if (response.code === 200){
                        alert(response.message);
                        location.href='/business/profile'
                    }
                },
            };

            ajax.call(options);

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
            const fileId = $("#fileId").val();
            console.log("fileId는?  :    "+ JSON.stringify(fileId));

            const options = {
                url: "/business/deleteFile/"+fileId, // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: '',

                done: function(response) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(JSON.stringify(response));
                    if (response.code === 'success'){
                        alert(response.message);
                        // 이미지 미리보기 삭제
                        const coverImage = document.getElementById('coverImage');
                        coverImage.src = ''; // 미리보기 이미지 초기화
                    }
                },
            };

            ajax.call(options);
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
                    <div class="cover-photo-contact mb-3 " >
                        <div class="cover-photo">
                            <img class="img-fluid" id="coverImage" src="/business/uploadedFileGet/${fileId}" alt="Uploaded Image">
                            <i class="fas fa-times-circle" id="fileDelete"><input id="fileId" type='hidden' value='${fileId}'></i>
                        </div>
                        <div class="upload-file">
                            <label class="form-label" id="fileUpload">프로필 사진 업로드</label>
                        </div>
                    </div>
                    <form id="businessInsertProfile" name="businessInsertProfile" enctype="multipart/form-data">
                        <input type="file" id="fileInput" name="fileInput" style="display:none;" />
                        <div class="row">
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">기업 이름<span class="font-danger">*</span></label>
                                <input type="hidden" value="${company.companyId}" id="companyId" name="companyId">
                                <input type="text" class="form-control" value="${company.companyName}" id="companyName" name="companyName" data-valid="true" data-name="기업 이름">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">대표 연락처 ['-'를 제외]<span class="font-danger">*</span></label>
                                <input type="text" class="form-control" value="${company.officePhone}" id="officePhoneNumber" name="officePhone" data-valid="true" data-name="기업 연락처">
                            </div>
                            <div class="form-group col-md-4 mb-3 select-border">
                                <label class="form-label" for="industryCode">산업종류<span class="font-danger">*</span></label>
                                <select class="form-control basic-select" id="industryCode" name="industryCode" data-valid="true" data-name="산업종류">
                                    <option value="">선택</option>
                                    <c:forEach var="industry" items="${industry}">
                                        <option value="${industry.value}" ${company.industryCode == industry.value ? 'selected="selected"' : ''}>${industry.text}</option>
                                    </c:forEach>
                                </select>

                            </div>
                            <div class="form-group col-md-4 mb-3 select-border">
                                <label class="form-label" for="businessTypeCode">회사종류<span class="font-danger">*</span></label>
                                <select class="form-control basic-select" name="businessTypeCode" id="businessTypeCode" data-valid="true" data-name="회사종류">
                                    <option value="">선택</option>
                                    <c:forEach var="businessType" items="${businessType}">
                                        <option value="${businessType.value}" ${company.businessTypeCode == businessType.value ? 'selected="selected"' : ''}>${businessType.text}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-4 mb-3">
                                <label class="form-label">사업자 번호 ['-'를 제외]<span class="font-danger">*</span></label>
                                <input type="text" class="form-control" value="${company.businessNumber}"  name="businessNumber" id="businessNumber" data-valid="true" data-name="사업자 번호">
                            </div>
                            <div class="form-group mb-3 col-md-3">
                                <label class="form-label">우편번호<span class="font-danger">*</span></label>
                                <input type="text" class="form-control" id="zipcode" placeholder="우편번호" value="${company.zipcode}" name="zipcode" data-valid="true" data-name="우편번호" readonly>
                                <input type="hidden" class="form-control" id="latitude" name="latitude" data-name="위도">
                                <input type="hidden" class="form-control" id="longitude" name="longitude" data-name="경도">
                            </div>
                            <div class="form-group mb-3 col-md-9">
                                <label class="form-label">도로명주소 <span class="font-danger">*</span></label>
                                <input type="text" class="form-control" id="address" placeholder="도로명주소" value="${company.address}" name="address" data-valid="true" data-name="도로명주소" readonly>
                            </div>
                            <div class="form-group mb-3 col-md-12">
                                <label class="form-label">상세주소 <span class="font-danger">*</span></label>
                                <input type="text" class="form-control" id="addressDetail" placeholder="상세주소" value="${company.addressDetail}" name="addressDetail" data-valid="true" data-name="상세주소">
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