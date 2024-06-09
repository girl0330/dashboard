<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
  let personal_profile = {
    init: function () {
      //프로필 validation체크
      if (!this.profileValidation()) {
        return;
      }

      //프로필 저장 버튼
      this.formSubmit();
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
    formSubmit : function() {
      const formData = $("#saveProfile").serializeArray();

      // JSON 객체로 변환
      let jsonData = {};
      $.each(formData, function() {
        jsonData[this.name] = this.value;
      });

      // 성별 선택 값 추가
      jsonData['gender'] = $('input[name=gender]:checked').val();

      // 알바경험 선택 값 추가
      jsonData['partTimeExperience'] = $('input[name=partTimeExperience]:checked').val();

      console.log("jsonData "+JSON.stringify(jsonData));

      $.ajax({
        url: "/personal/myProfileSave", // Spring 컨트롤러 URL
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
  $(document).ready(function() {
    $("#profile_sava_button").on("click",function () {
      personal_profile.init();
    });
    // 숫자 외의 문자는 제외시킴
    $('#phone').on("input",function (){
      $(this).val($(this).val().replace(/[^0-9]/g, ''));
    })
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
          <form class="mt-4" id="saveProfile" name="saveProfile">
            <div class="row">
              <div class="form-group mb-3 col-md-6">
                <label class="form-label">이름</label>
                <input type="text" class="form-control" value="${profile.name}" id="name" name="name">
              </div>
              <div class="form-group mb-3 col-md-6">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" value="${profile.email}" id="email" name="email" disabled>
              </div>

              <div class="form-group mb-3 col-md-6 datetimepickers">
                <label class="form-label">생년월일</label>
                <div class="input-group date" id="datetimepicker-01" data-target-input="nearest">
                  <input type="text" class="form-control datetimepicker-input" value="${profile.birth}" data-target="#datetimepicker-01" id="birth" name="birth">
                  <div class="input-group-append d-flex" data-target="#datetimepicker-01" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                  </div>
                </div>
              </div>

              <div class="form-group mb-3 col-md-6">
                <label class="form-label">핸드폰 ['-'를 제외]</label>
                <input type="text" class="form-control" value="${profile.phone}" id="phone" name="phone">
              </div>
              <div class="form-group mb-3 col-md-12" >
                <label class="d-block mb-3">성별</label>
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

