<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

  let personal_login = {
    init : function () {
    // 공백함수실행
    //   alert("공백함수 실행??")
      if (!this.emptyChkFn()) {
        return;
      }
      //조건함수실행
        alert("조건함수 실행??")
      if (!this.validationChk()){
        return;
      }
    // submit 함수 실행
      this.formSubmit();
    },
    // 공백함수
    emptyChkFn : function () {
      // alert("공백합수 실행됨")
      let valid = true;
      const form = $('#personalForm')
      const inputs = form.find("input[type='text'], input[type='password']");

      inputs.each(function() {
        const input = $(this);
        const removeBlankData = input.val().replace(/\s*/g, "");
        if (removeBlankData === "") {
          let text = input.data('name');
          alert(text + "은/는 필수로 입력 값입니다.");
          input.focus();
          valid = false;
          return false;  // each 루프 중지
        }
      });

      return valid;
    },

    //validation 함수 실행
    validationChk : function () {
        alert("조건함수 실행!!!")
      let valid = true;
      const memberId = $('#personalMemberId').val();
      const password = $('#personalPassword').val();

      console.log("아이디 확인"+ memberId)
      console.log("비밀번호 확인"+ password)

      // 아이디 조건, 길이
      let idRegex = /^[a-zA-Z0-9]+$/;
      if (!idRegex.test(memberId)) {
        alert("아이디 형식을 확인해주세요")
        $('#personalMemberId').focus()
        valid = false;
        return valid;
      } // 이상무
      if (memberId.length > 12 ||memberId.length < 2) {
        alert("아이디는 2~12자 사이로 입력해주세요")
        $('#personalMemberId').focus()
        valid = false;
        return valid;
      }// 이상무

      // 비밀번호 조건, 길이, 비밀번호 확인
      let pwRegex = /^[a-zA-Z0-9.!@#$%^&*]+$/;
      if (!pwRegex.test(password)) {
        alert("비밀번호 형식을 확인해주세요")
        $('#password').focus()
        valid = false;
        return valid;
      }
      if (password.length > 15 || password.length < 8) {
        alert("비밀번호를 8~15자로 사용해주세요")
        $('#password').focus()
        valid = false;
        return valid;
      }
      return valid;
    },

    //submit 함수
    formSubmit : function () {
      const formData = $("#personalForm").serializeArray();
      console.log("data check :::" + JSON.stringify(formData));

      // JSON 객체로 변환
      let jsonData = {};
      $.each(formData, function() {
        jsonData[this.name] = this.value;
      });

      const url = "/member/personalMemberLogin";

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

  let business_login = {
    init : function () {
      // 공백함수실행
      //   alert("공백함수 실행??")
      if (!this.emptyChkFn()) {
        return;
      }
      //조건함수실행
      alert("조건함수 실행??")
      if (!this.validationChk()){
        return;
      }
      // submit 함수 실행
      this.formSubmit();
    },
    // 공백함수
    emptyChkFn : function () {
      // alert("공백합수 실행됨")
      let valid = true;
      const form = $('#businessForm')
      const inputs = form.find("input[type='text'], input[type='password']");

      inputs.each(function() {
        const input = $(this);
        const removeBlankData = input.val().replace(/\s*/g, "");
        if (removeBlankData === "") {
          let text = input.data('name');
          alert(text + "은/는 필수로 입력 값입니다.");
          input.focus();
          valid = false;
          return false;  // each 루프 중지
        }
      });

      return valid;
    },

    //validation 함수 실행
    validationChk : function () {
      alert("조건함수 실행!!!")
      let valid = true;
      const memberId = $('#businessMemberId').val();
      const password = $('#businessPassword').val();

      console.log("아이디 확인"+ memberId)
      console.log("비밀번호 확인"+ password)

      // 아이디 조건, 길이
      let idRegex = /^[a-zA-Z0-9]+$/;
      if (!idRegex.test(memberId)) {
        alert("아이디 형식을 확인해주세요")
        $('#businessMemberId').focus()
        valid = false;
        return valid;
      } // 이상무
      if (memberId.length > 12 ||memberId.length < 2) {
        alert("아이디는 2~12자 사이로 입력해주세요")
        $('#businessMemberId').focus()
        valid = false;
        return valid;
      }// 이상무

      // 비밀번호 조건, 길이, 비밀번호 확인
      let pwRegex = /^[a-zA-Z0-9.!@#$%^&*]+$/;
      if (!pwRegex.test(password)) {
        alert("비밀번호 형식을 확인해주세요")
        $('#businessPassword').focus()
        valid = false;
        return valid;
      }
      if (password.length > 15 || password.length < 8) {
        alert("비밀번호를 8~15자로 사용해주세요")
        $('#businessPassword').focus()
        valid = false;
        return valid;
      }
      return valid;
    },

    //submit 함수
    formSubmit : function () {
      const formData = $("#businessForm").serializeArray();
      console.log("data check :::" + JSON.stringify(formData));

      // JSON 객체로 변환
      let jsonData = {};
      $.each(formData, function() {
        jsonData[this.name] = this.value;
      });

      const url = "/member/businessMemberLogin";

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
  document.addEventListener('DOMContentLoaded', function (){
    document.getElementById("personal_login").addEventListener("click",function () {
      personal_login.init();
    });

    document.getElementById("business_login").addEventListener("click",function () {
      business_login.init();
    });
  });
</script>

<!--=================================
inner banner -->
<div class="header-inner bg-light text-center">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="text-primary">Login</h2>
        <ol class="breadcrumb mb-0 p-0">
          <li class="breadcrumb-item"><a href="/"> Home </a></li>
          <li class="breadcrumb-item active"> <i class="fas fa-chevron-right"></i> <span> Login </span></li>
        </ol>
      </div>
    </div>
  </div>
</div>
<!--=================================
inner banner -->

<!--=================================
Signin -->
<section class="space-ptb">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-xl-8 col-lg-10 col-md-12">
        <div class="login-register">
          <div class="section-title">
           <h4 class="text-center">로그인 하기</h4>
          </div>
          <fieldset>
            <legend class="px-2">로그인할 계정 타입 선택</legend>
            <ul class="nav nav-tabs nav-tabs-border d-flex" role="tablist">
              <li class="nav-item me-4">
                <a class="nav-link active"  data-bs-toggle="tab" href="#candidate" role="tab" aria-selected="false">
                  <div class="d-flex">
                    <div class="tab-icon">
                      <i class="flaticon-users"></i>
                    </div>
                    <div class="ms-3">
                      <h6 class="mb-0">개인회원</h6>
                      <p class="mb-0">개인회원으로 로그인하기</p>
                    </div>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link"  data-bs-toggle="tab" href="#employer" role="tab" aria-selected="false">
                  <div class="d-flex">
                    <div class="tab-icon">
                      <i class="flaticon-suitcase"></i>
                    </div>
                    <div class="ms-3">
                      <h6 class="mb-0">기업회원</h6>
                      <p class="mb-0">기업으로 로그인하기</p>
                    </div>
                  </div>
                </a>
              </li>
            </ul>
          </fieldset>
          <div class="tab-content">
            <div class="tab-pane active" id="candidate" role="tabpanel">
              <form class="mt-4" id="personalForm" name="personalForm">
                <div class="row">
                  <input type="hidden" name="gradeCode" id="personalGradeCode" value="10">
                  <div class="mb-3 col-6">
                    <label class="form-label" for="personalemail">아이디 *</label>
                    <input type="text" class="form-control" id="personalemail" name="email" data-name="아이디">
                  </div>
                  <div class="mb-3 col-6">
                    <label class="form-label" for="personalPassword">비밀번호 *</label>
                    <input type="password" class="form-control" id="personalPassword" name="password" data-name="비밀번호">
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <a class="btn btn-primary d-block" id="personal_login" name="personal_login">로그인</a>
                  </div>
                  <div class="col-md-6">
                    <div class="mt-3 mt-md-0 forgot-pass">
                      <a href="#">비밀번호 찾기</a>
                      <p class="mt-1">회원이 아니신가요? <a href="register.html"> 회원가입 하기</a></p>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div class="tab-pane fade" id="employer" role="tabpanel">
              <form class="mt-4" id="businessForm" name="businessForm">
                <div class="row">
                  <input type="hidden" name="gradeCode" id="BusinessGradeCode" value="20">
                  <div class="mb-3 col-12">
                    <label class="form-label" for="businessMemberId">아이디 *</label>
                    <input type="text" class="form-control" id="businessMemberId" name="memberId" data-name="아이디">
                  </div>
                  <div class="mb-3 col-12">
                    <label class="form-label" for="businessPassword">비밀번호 *</label>
                    <input type="password" class="form-control" id="businessPassword" name="password" data-name="비밀번호">
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <a class="btn btn-primary d-block" id="business_login" name="business_login">로그인</a>
                  </div>
                  <div class="col-md-6">
                    <div class="ms-md-3 mt-3 mt-md-0">
                      <a href="#">Forgot Password?</a>
                      <div class="form-check mt-2">
                        <input class="form-check-input" type="checkbox" value="" id="Remember-02">
                        <label class="form-check-label" for="Remember-02">Remember Password</label>
                      </div>
                    </div>
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
                    <a href="#"> <i class="fab fa-facebook-f me-4"></i>Login with Facebook</a>
                  </li>
                  <li class="twitter text-center">
                    <a href="#"> <i class="fab fa-twitter me-4"></i>Login with Twitter</a>
                  </li>
                  <li class="google text-center">
                    <a href="#"> <i class="fab fa-google me-4"></i>Login with Google</a>
                  </li>
                  <li class="linkedin text-center">
                    <a href="#"> <i class="fab fa-linkedin-in me-4"></i>Login with Linkedin</a>
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
Signin -->

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
          <a class="ms-auto align-self-center" href="#">Apply now<i class="fas fa-long-arrow-alt-right"></i> </a>
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
          <a class="ms-auto align-self-center" href="#">Post a job<i class="fas fa-long-arrow-alt-right"></i> </a>
        </div>
      </div>
    </div>
  </div>
</section>
<!--=================================
feature-info-->





