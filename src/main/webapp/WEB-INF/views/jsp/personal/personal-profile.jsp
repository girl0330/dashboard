<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afcb905c7668725d0a22469ede432941&libraries=services"></script>

<script>
  let personal_profile = {
    init: function () {
      //null 체크
      if(!this.profileEmptyCheck()) {
        return;
      }
      //프로필 validation체크
      if (!this.profileValidation()) {
        return;
      }
      //프로필 저장 버튼
      this.formSubmit();
    },
    profileEmptyCheck : function () {
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

    //프로필 validation체크
    profileValidation : function () {
      let valid = true;
      const name = $('#name').val();
      const phone = $('#phone').val();

      // 특수문자 검사
      let nameRegex = /[.!@#$%^&*]+/;
      if (nameRegex.test(name)) {
        alert("특수문자는 사용할 수 없습니다.");
        $('#name').focus();
        valid = false;
        return valid;
      }
      if (phone.length < 8 || phone.length > 11 ) {
        alert("휴대폰번호 형식에 맞지 않습니다.")
        $('#phone').focus();
        valid = false;
        return valid;
      }
      let phoneRegex = /^010/;
      if (!phoneRegex.test(phone)) {
        alert("전화번호는 010으로 시작해야 합니다.");
        $('#phone').focus();
        valid = false;
        return valid;
      }
      return valid;
    },

    // 전송 함수 정의
    formSubmit: function () {
      const formData = new FormData();

      $('#insertProfile').serializeArray().forEach(({name, value}) => {
        if (value.trim()) {
          formData.append(name, value);
        }
      });

      // 파일 formData에 추가
      const fileInput = $('#fileInput')[0];
      const file = fileInput.files[0];
      if (file) {
        formData.append('file', file);
      }

      //파일 아이디
      const fileId = $("#fileId").val();
      if (fileId) {
        formData.append('fileId',fileId);
      }

      //확인
      for (let [key, value] of formData.entries()) {
        console.log(key + ":" + value);
      }

      let jsonData = {};
      $.each(formData, function () {
        jsonData[this.name] = this.value;
      });

      const options = {
        url: '/personal/ajax/insertProfile',
        type: 'POST',
        contentType: false, // 파일 전송을 위해 false로 설정
        processData: false, // 파일 전송을 위해 false로 설정
        data: formData,

        done: function(response) {
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
          console.log(response);
          if (response.code === 200){
            alert(response.message);
            location.href='/personal/myProfile'
          }
        },
        fail: function(jqXHR) {
          console.error('요청 실패:', jqXHR.responseText); // 서버에서 반환된 응답
          const errorResponse = JSON.parse(jqXHR.responseText); // JSON 파싱
          alert("에러 발생: " + errorResponse.userMessage); // 사용자에게 에러 메시지 노출
        }
      };

      ajax.call(options);

    }
  }



  //DOM이 실행 후 실행 됨
  $(document).ready(function() {
    $("#profile_sava_button").on("click",function () {
      personal_profile.init();
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

      const options = {
        url: '/business/deleteFile/'+fileId,
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
        fail: function(jqXHR) {
          console.error('요청 실패:', jqXHR.responseText); // 서버에서 반환된 응답
          const errorResponse = JSON.parse(jqXHR.responseText); // JSON 파싱
          alert("에러 발생: " + errorResponse.userMessage); // 사용자에게 에러 메시지 노출
        }
      };

      ajax.call(options);

    });

    //핸들폰 입력시 숫자 이외의 문자는 제외시킴
    $('#phone').on("input",function (){
      $(this).val($(this).val().replace(/[^0-9]/g, ''));
    });

    $('#address, #zipcode').on("click", function() { // 클릭 이벤트 사용
      new daum.Postcode({
        oncomplete: function(data) { // 선택시 입력값 세팅
          new daum.maps.services.Geocoder().addressSearch(data.address, function (results, status) {
            if (status === daum.maps.services.Status.OK) {
              const result = results[0]; //첫번째 결과의 값을 활용

              $('#zipcode').val(data.zonecode);
              $('#address').val(data.address); // 주소 넣기
              $("#latitude").val(result.y); //위도
              $("#longitude").val(result.x); //경도
              $('input[name=addressDetail]').focus(); // 상세입력 포커싱
            }
          });
        }
      }).open();
    });
  });
</script>

<!--=================================
inner banner ,Dashboard Nav -->
<%@ include file="personalMenuInclude.jsp"%>
<!--=================================
Candidates Dashboard -->

<!--=================================
My Profile -->
<section>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="user-dashboard-info-box">
          <div class="section-title-02 mb-2 d-grid">
            <h4>기본 정보</h4>
          </div>
          <div class="cover-photo-contact">
            <div class="cover-photo">
              <img class="img-fluid" id="coverImage" src="/business/uploadedFileGet/${fileId}" alt="Uploaded Image" style="width: 225px; height: 225px;">
              <i class="fas fa-times-circle" id="fileDelete"><input id="fileId" type='hidden' value='${fileId}'></i>
            </div>
            <div class="upload-file">
              <label class="form-label" id="fileUpload">프로필 사진 업로드</label>
            </div>
          </div>
          <form class="mt-4" id="insertProfile" name="insertProfile" enctype="multipart/form-data">
            <input type="file" id="fileInput" name="fileInput" style="display:none;" />
            <div class="row">
              <div class="form-group mb-3 col-md-6">
                <label class="form-label">이름<span class="font-danger">*</span></label>
                <input type="text" class="form-control" value="${profile.name}" id="name" name="name" data-valid="true" data-name="이름">
              </div>
              <div class="form-group mb-3 col-md-6">
                <label class="form-label">Email<span class="font-danger">*</span></label>
                <input type="email" class="form-control" value="${profile.email}" id="email" name="email" disabled>
              </div>

              <div class="form-group mb-3 col-md-6 datetimepickers">
                <label class="form-label">생년월일<span class="font-danger">*</span></label>
                <div class="input-group date" id="datetimepicker-01" data-target-input="nearest">
                  <input type="text" class="form-control datetimepicker-input" value="${profile.birth}" data-target="#datetimepicker-01" id="birth" name="birth" data-valid="true" data-name="생년월일">
                  <div class="input-group-append d-flex" data-target="#datetimepicker-01" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                  </div>
                </div>
              </div>

              <div class="form-group mb-3 col-md-6">
                <label class="form-label">핸드폰 ['-'를 제외]<span class="font-danger">*</span></label>
                <input type="text" class="form-control" value="${profile.phone}" id="phone" name="phone" data-valid="true" data-name="핸드폰">
              </div>
              <div class="form-group mb-3 col-md-12" >
                <label class="d-block mb-3">성별<span class="font-danger">*</span></label>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" value="Male" name="gender" id="Male" ${profile.gender == "Male" ? "checked" : ""}>
                  <label class="form-check-label" for="Male">남자</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" value="Female" name="gender" id="Female" ${profile.gender == "Female" ? "checked" : ""}>
                  <label class="form-check-label" for="Female">여자</label>
                </div>
              </div>
              <div class="form-group mb-3 col-md-3">
                <label class="form-label">우편번호<span class="font-danger">*</span></label>
                <input type="text" class="form-control" id="zipcode" placeholder="우편번호" value="${profile.zipcode}" name="zipcode" data-valid="true" data-name="우편번호" readonly>
                <input type="hidden" class="form-control" id="latitude" name="latitude" data-name="위도">
                <input type="hidden" class="form-control" id="longitude" name="longitude" data-name="경도">
              </div>
              <div class="form-group mb-3 col-md-9">
                <label class="form-label">도로명주소 <span class="font-danger">*</span></label>
                <input type="text" class="form-control" id="address" placeholder="도로명주소" value="${profile.address}" name="address" data-valid="true" data-name="도로명주소" readonly>
              </div>
              <div class="form-group mb-3 col-md-12">
                <label class="form-label">상세주소 <span class="font-danger">*</span></label>
                <input type="text" class="form-control" id="addressDetail" placeholder="상세주소" value="${profile.addressDetail}" name="addressDetail" data-valid="true" data-name="상세주소">
              </div>
              <div class="form-group mb-3 col-md-6" >
                <label class="d-block mb-3">알바 경험</label>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" value="true" name="partTimeExperience" id="yes" ${profile.partTimeExperience == "true" ? "checked" : ""}>
                  <label class="form-check-label" for="yes">있음</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" value="false" name="partTimeExperience" id="no" ${profile.partTimeExperience == "false" ? "checked" : ""}>
                  <label class="form-check-label" for="no">없음</label>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <a class="btn btn-md btn-primary" id="profile_sava_button">저장</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<!--=================================
My Profile -->

