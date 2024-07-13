<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
  //개인회원 이메일 중복검사
  const emailValid = {
    init: function() {
      this.duplicateCheck(function (isValid) {
        alert("isval:::   " + isValid);
        return isValid;
      });
    },
    duplicateCheck: function(callback) {

      if (!this.emptyCheck()) {
        callback(false); // 비어있는 경우 콜백에 false 전달
        return;
      }

      if (!this.typeCheck()) {
        callback(false); // 형식이 맞지 않는 경우 콜백에 false 전달
        return;
      }


      let jsonData = {};
      jsonData['email'] = $("#email").val();

      console.log("jsonData : " + JSON.stringify(jsonData));

      const options = {
        url: "/user/emailDuplicateCheck", // Spring 컨트롤러 URL
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송

        done: function(response) {
          if (response.code === 'success') {
            $("#email").removeClass("is-invalid");
            $("#emailError").hide();
            callback(true);
          }
        },
        fail: function(jqXHR) {
          const jsonObj = JSON.parse(jqXHR.responseText);
          $("#email").addClass("is-invalid");
          $("#emailError").text(jsonObj.userMessage).show();
          callback(false);
        }
      };
      ajax.call(options);
    },
    emptyCheck: function() {
      const email = $('#email');
      const removeBlankData = email.val().replace(/\s*/g, "");

      if (!removeBlankData) {
        let text = email.data('name') || "이메일";
        $("#email").addClass("is-invalid");
        $("#emailError").text(text + "이 비어있습니다.").show();
        email.focus();
        return false;
      }
      return true;
    },
    typeCheck: function() {
      const email = $('#email').val();
      let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

      if (!emailRegex.test(email)) {
        $("#email").addClass("is-invalid");
        $("#emailError").text("유효한 이메일 형식으로 입력해주세요.").show();
        $('#email').focus();
        return false;
      }
      return true;
    }
  };

  //개인회원 로그인 실행
  let user_register = {
    init : function () {

      if (!emailValid.emptyCheck()) {
        return;
      }

      if (!emailValid.typeCheck()) {
        return;
      }

      emailValid.duplicateCheck(function(isValid) {
        if (isValid) {
          if (!this.emptyChkFn()) {
            return;
          }
          if (!this.validationChk()) {
            return;
          }
          if (!this.checkFn()) {
            return;
          }
          this.formSubmit();
        }
      }.bind(this)); // 콜백 함수 내에서 this를 사용하기 위해 bind 처리
    },

    /*공백 검사*/
    emptyChkFn : function() {
      let valid = true;
      const form = $('#userForm');
      const inputs = form.find("input[type='text'], input[type='password']");

      inputs.each(function() {
        const input = $(this);
        const removeBlankData = input.val().replace(/\s*/g, "");
        if (removeBlankData === "") {
          let text = input.data('name');
          input.addClass("is-invalid");
          $("#passwordError").text(text + "은/는 필수로 입력 값입니다.").show();
          input.focus();
          valid = false;
          return valid;  // each 루프 중지
        }
      });

      return valid;
    },

    //validationChk 함수 정의
    validationChk : function() {
      let valid = true;
      const password = $('#password').val();
      const password2 = $('#password2').val();

      // 비밀번호 조건, 길이, 비밀번호 확인
      let pwRegex = /^[a-zA-Z0-9.!@#$%^&*]+$/;
      if (!pwRegex.test(password)) {
        $("#password, #password2").addClass("is-invalid");
        $("#passwordError").text("비밀번호 형식을 확인해주세요").show();
        $('#password').focus();
        valid = false;
        return valid;
      }

      if (password.length > 15 || password.length < 8) {
        $("#password, #password2").addClass("is-invalid");
        $("#passwordError").text("비밀번호를 8~15자로 사용해주세요.").show();
        $('#password').focus();
        valid = false;
        return valid;
      }

      if (password !== password2) {
        $("#password, #password2").addClass("is-invalid");
        $("#passwordError").text("입력한 비밀번호와 일치하지 않습니다.").show();
        $('#password2').focus();
        valid = false;
        return valid;
      }

      $("#password, #password2").removeClass("is-invalid");
      $("#passwordError").hide();
      return valid;
    },

    checkFn : function() {
      let valid = true;
      const form = $('#userForm');
      const checkBox = form.find("input[type='checkbox']");
      const isChecked = checkBox.prop('checked');

      if (!isChecked) {
        $("#termsError").text("동의여부는 필수 입력 값입니다.").show();
        valid = false;
        return valid;
      }

      $("#termsError").hide();
      return valid;
    }, // 이상무


    // 전송 함수 정의
    formSubmit : function() {
      const formData = $("#userForm").serializeArray();

      console.log("formData : "+JSON.stringify(formData));

      // JSON 객체로 변환
      let jsonData = {};

      $.each(formData, function() {
        jsonData[this.name] = this.value;
      });

      // 체크박스 값 추가
      jsonData['terms'] = $('#terms').is(':checked');
      console.log(jsonData);

      $.ajax({
        url: "/user/insertSignUp", // Spring 컨트롤러 URL
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
            location.href='/user/login'
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

    //개인 이메일 중복검사 로직
    $("#email").change(function() {
      emailValid.duplicateCheck(function(isVaild) {
        console.log("isvalid:::   "+isVaild);
      });
    });

    //개인 회원가입 로직
    $("#user_register").on("click", function() {
      user_register.init();
    });

    $("#personalTypeCode").on("click",function () {
      $("#userTypeCode").val("10");
    });

    $("#companyTypeCode").on("click",function () {
      $("#userTypeCode").val("20");
    });

  });
</script>


<!--=================================
inner banner -->
<div class="header-inner bg-light text-center">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h1 class="text-primary">회 원 가 입</h1>
        <ol class="breadcrumb mb-0 p-0">
          <li class="breadcrumb-item"><a href="/index.html"> Home </a></li>
          <li class="breadcrumb-item active"> <i class="fas fa-chevron-right"></i> <span> Register </span></li>
        </ol>
      </div>
    </div>
  </div>
</div>
<!--=================================
inner banner -->

<!--=================================
Register -->
<section class="space-ptb">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-xl-8 col-lg-10 col-md-12">
        <div class="login-register">
          <fieldset>
            <legend class="px-2">계정 타입 선택</legend>
            <ul class="nav nav-tabs nav-tabs-border d-flex" role="tablist">
              <li class="nav-item me-4">
                <a class="nav-link active" id="personalTypeCode" data-bs-toggle="tab" href="/#candidate" role="tab"  >
                  <div class="d-flex">
                    <div class="tab-icon">
                      <i class="flaticon-users"></i>
                    </div>
                    <div class="ms-3">
                      <h6 class="mb-0">개인 회원</h6>
                      <p class="mb-0">개인으로 회원가입하기</p>
                    </div>
                  </div>
                </a>
              </li>
              <li class="nav-item ms-auto">
                <a class="nav-link" id="companyTypeCode" data-bs-toggle="tab" href="/#candidate" role="tab">
                  <div class="d-flex">
                    <div class="tab-icon">
                      <i class="flaticon-suitcase"></i>
                    </div>
                    <div class="ms-3">
                      <h6 class="mb-0">기업 회원</h6>
                      <p class="mb-0">기업으로 회원가입하기</p>
                    </div>
                  </div>
                </a>
              </li>
            </ul>
          </fieldset>
          <div class="tab-content">
            <div class="tab-pane active" id="candidate" role="tabpanel">
              <form class="mt-4" id="userForm" name="userForm">
                <div class="row">
                  <input type="hidden" name="userTypeCode" id="userTypeCode" value="10">
                  <div class="mb-3 col-md-12">
                    <label class="form-label" for="email">이메일 * </label>
                    <input type="text" class="form-control" id="email" name="email" data-name="이메일">
                    <div id="emailError" class="invalid-feedback" style="display: none;">email valid message</div>
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label"for="password">비밀번호 *</label>
                    <input type="password" class="form-control" id="password" name="password" data-name="비밀번호">
                    <div id="passwordError" class="invalid-feedback" style="display: none;">password valid message</div>
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="password2">비밀번호 재입력 *</label>
                    <input type="password" class="form-control" id="password2" name="password2" data-name="비밀번호 재입력">
                  </div>
                  <div class="mb-3 col-12">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="ture" id="terms" name="terms">
                      <label class="form-check-label" for="terms">
                        <a href="/user/terms" target="_blank" rel="noopener noreferrer">이용약관</a>에 전체동의
                      </label>
                      <div id="termsError" class="invalid-feedback" style="display: none;">terms valid message</div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <a class="btn btn-primary d-block" id="user_register" name="button_register">회원가입</a>
                  </div>
                  <div class="col-md-6 text-md-end mt-2 text-center">
                    <p>이미 회원이신가요? <a href="/user/login"> 로그인 </a></p>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="mt-4">
            <fieldset>
              <legend class="px-2">Login or Sign up with</legend>
              <div class="social-login">
                <ul class="list-unstyled d-flex mb-0">
                  <li class="facebook text-center">
                    <a href="/#"> <i class="fab fa-facebook-f me-4"></i>Login with Facebook</a>
                  </li>
                  <li class="twitter text-center">
                    <a href="/#"> <i class="fab fa-twitter me-4"></i>Login with Twitter</a>
                  </li>
                  <li class="google text-center">
                    <a href="/#"> <i class="fab fa-google me-4"></i>Login with Google</a>
                  </li>
                  <li class="linkedin text-center">
                    <a href="/#"> <i class="fab fa-linkedin-in me-4"></i>Login with Linkedin</a>
                  </li>
                </ul>
              </div>
            </fieldset>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--=================================
Register -->

<!--=================================
feature-info -->
<section class="feature-info-section">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 mb-lg-0 mb-4">
        <div class="feature-info feature-info-02 p-4 p-lg-5 bg-primary">
          <div class="feature-info-icon mb-3 mb-sm-0 text-dark">
            <i class="flaticon-team"></i>
          </div>
          <div class="feature-info-content text-white ps-sm-4 ps-0">
            <p>Jobseeker</p>
            <h5 class="text-white">Looking For Job?</h5>
          </div>
          <a class="ms-auto align-self-center" href="/#">Apply now<i class="fas fa-long-arrow-alt-right"></i> </a>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="feature-info feature-info-02 p-4 p-lg-5 bg-dark">
          <div class="feature-info-icon mb-3 mb-sm-0 text-primary">
            <i class="flaticon-job-3"></i>
          </div>
          <div class="feature-info-content text-white ps-sm-4 ps-0">
            <p>Recruiter</p>
            <h5 class="text-white">Are You Recruiting?</h5>
          </div>
          <a class="ms-auto align-self-center" href="/#">Post a job<i class="fas fa-long-arrow-alt-right"></i> </a>
        </div>
      </div>
    </div>
  </div>
</section>
<!--=================================
feature-info-->


<!--=================================
Back To Top-->
<div id="back-to-top" class="back-to-top">
  <i class="fas fa-angle-up"></i>
</div>
<!--=================================
Back To Top-->

<!--=================================
Apply Modal Popup -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <form name="formApply" id="formApply">
        <div class="modal-header p-4">
          <h4 class="mb-0 text-center">공고 지원</h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="login-register">
            <section>
              <div class="container">
                <div class="form-group mt-0 mb-3 col-md-12">
                  <label class="form-label">내용</label>
                  <textarea class="form-control" rows="4" id="motivationDescription" name="motivationDescription"></textarea>
                </div>
              </div>
              <a class="btn btn-lg btn-primary" href="#" id="button_apply" name="button_apply">지원하기</a>
            </section>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<!--=================================
Signin Modal Popup -->

