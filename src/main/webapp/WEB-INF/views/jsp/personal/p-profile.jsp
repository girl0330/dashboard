<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
  let personal_register = {
    init: function () {
      alert("??????")
      //제출 버튼
      this.formSubmit();
    },

    // 전송 함수 정의
    formSubmit : function() {
      alert("전송함수")
      const formData = $("#saveProfile").serializeArray();

      // JSON 객체로 변환
      let jsonData = {};
      $.each(formData, function() {
        jsonData[this.name] = this.value;
      });

      // 성별 선택 값 추가
      jsonData['gender'] = $('input[name=gender]:checked').val();

      // jsonData['gender'] = $('#gender').is(':checked').val();
      // var selectedGender = $('input[name="customRadio"]:checked').val();
      // if (selectedGender) {
      //   jsonData['gender'] = selectedGender;
      // } else {
      //   jsonData['gender'] = null; // 선택되지 않은 경우
      // }

      console.log("x:::1111111111  "+JSON.stringify(jsonData));
      const url = "/personal/myProfile";

      $.ajax({
        url: url, // Spring 컨트롤러 URL
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
            location.href='/'
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
    document.getElementById("profile_sava_button").addEventListener("click", function () {
      personal_register.init();
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
            <div class="upload-file">
              <label for="formFile" class="form-label">Upload Cover Photo</label>
              <input class="form-control" type="file" id="formFile">
            </div>
          </div>
          <form class="mt-4" id="saveProfile" name="saveProfile">
            <div class="row">
              <div class="form-group mb-3 col-md-6">
                <label class="form-label">이름</label>
                <input type="text" class="form-control" value="" id="name" name="name">
              </div>
              <div class="form-group mb-3 col-md-6">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" value="" id="email" name="email">
              </div>

              <div class="form-group mb-3 col-md-6 datetimepickers">
                <label class="form-label">Date of birth</label>
                <div class="input-group date" id="datetimepicker-01" data-target-input="nearest">
                  <input type="text" class="form-control datetimepicker-input" value="" data-target="#datetimepicker-01" id="birthDay" name="birthDay">
                  <div class="input-group-append d-flex" data-target="#datetimepicker-01" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                  </div>
                </div>
              </div>
              <div class="form-group mb-3 col-md-6">
                <label class="form-label">핸드폰 번호</label>
                <input type="text" class="form-control" value="" id="phoneNumber" name="phoneNumber">
              </div>
              <div class="form-group mb-3 col-md-6" >
                <label class="d-block mb-3">성별</label>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" value="Male" name="gender" id="Male">
                  <label class="form-check-label" for="Male">Male</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" value="Female" name="gender" id="Female">
                  <label class="form-check-label" for="Female">Female</label>
                </div>
              </div>
              <div class="form-group mb-3 col-md-6">
                <label class="form-label">주소</label>
                <input type="text" class="form-control" value=""  name="address" id="address">
              </div>
              <div class="form-group mb-0 col-md-12">
                <label class="form-label">Description</label>
                <textarea class="form-control" rows="5" placeholder="자신을 소개해주세요."  name="content" id="content"></textarea>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <a class="btn btn-md btn-primary" id="profile_sava_button">Save Settings</a>
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