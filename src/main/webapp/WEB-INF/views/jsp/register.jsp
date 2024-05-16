<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

  //회원 로그인 실행
  let personal_register = {
    init : function () {
      // if (!this.emptyChkFn()) {
      //   return;
      // }
      // if (!this.checkFn()) {
      //   return;
      // }
      // if (!this.validationChk) {
      //   return;
      // }

      this.formSubmit();
    },
    /*공백 검사*/
    emptyChkFn : function () {
      alert("공배검사")
      let valid = true;
      const form = document.getElementById("personalForm");
      const password = document.getElementById("password");
      const password2 = document.getElementById("password2");
      const inputs = form.querySelectorAll("input[type='text'], input[type='password']");

      for (const input of inputs) {
        const removeBlankData = input.value.replace(/\s*/, "");
        const removeB1 = password.value.replace(/\s*/, "");
        const removeB2 = password2.value.replace(/\s*/, "");
        if (removeBlankData === "" || removeB1 === "" || removeB2 === "") {
          let text = input.dataset.name;
          let text2 = removeB1.dataset.name;
          let text3 = removeB2.dataset.name;
          alert(text + "은/는 필수로 입력 값입니다." || text2 + "은/는 필수로 입력 값입니다." || text3 + "은/는 필수로 입력 값입니다.")
          input.focus();
          removeB1.focus();
          removeB2.focus();
          valid = false;
          break;
        }
      }
      return valid;
    },

    validationChk : function () {
      alert("유효성검사")
      let valid = true;
      const memberId = $('#memberId').val(); // 비밀번호1
      const password = $('#password').val(); // 비밀번호2
      const password2 = $('#password2').val();
      const email = $('#email').val();
      const phone = $('#phone').val();

      // id validation
      let idRegex = /^[a-zA-Z0-9]+$/;
      if (!idRegex.test(memberId)) {
        alert("아이디 형식을 확인해주세요")
        valid = false;
        return valid;
      }
      if (userId.length > 12 || userId.length < 2) {
        alert("아이디를 2~12자로 사용해주세요")
        valid = false;
        return valid;
      }
      // pw validation
      let passwordRegex = /^[a-zA-z0-9.@$!%*?&]+$/; // 정규표현식
      if (!passwordRegex.test(password)) {
        alert(" 영문 대소문자, 숫자, 그리고 특수 문자가 반드시 하나 이상 포함해야합니다.")
        valid = false;
        return valid;
      }

      if (password.length > 15 || password.length < 8) {
        alert("비밀번호를 8~15자로 사용해주세요")
        valid = false;
        return valid;
      }

      if (password !== password2) {
        alert("비밀번호가 일치 하지 않습니다.")
        valid = false;
        return valid;
      }

      // email validation
      let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      if (!emailRegex.test(email)) {
        alert("이메일 형식을 확인해주세요")
        valid = false;
        return valid;
      }

      // phone validation
      let phoneRegex = /^010\d{4}\d{4}$/;
      if (!phoneRegex.test(phone)) {
        alert("핸드폰 형식을 확인해주세요")
        valid = false;
        return valid;
      }
      return valid;
    },
    // 체크 검사 함수 정의
    checkFn : function () {
      alert("체크 검사")
      let valid = true;
      const terms = document.getElementById("terms");
      const checkBox = terms.querySelector("input[type='checkbox']");
      const isChecked = checkBox.checked;

      if (!isChecked) {
        alert("동의여부는 필수 입력 값입니다.");
        valid = false;
        return valid;
      }
      return valid;
    },
    // 전송 함수 정의
    formSubmit : function() {
      alert("클릭")
      const formData = $("#personal_register").serializeArray();

      console.log("x:::  "+JSON.stringify(formData));

      // JSON 객체로 변환
      let jsonData = {};
      $.each(formData, function() {
        jsonData[this.name] = this.value;
      });

      // 체크박스 값 추가
      jsonData['terms'] = $('#terms').is(':checked');

      console.log(jsonData);

      const url = "/member/register";

      $.ajax({
        url: url, // Spring 컨트롤러 URL
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
        success: function(data) {
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
          console.log(JSON.stringify(data));
          if(data.code === "error") {
            alert(data.message);
          } else {
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

  let business_register = {
    init : function () {

    }
  }





  //DOM이 실행 후 실행 됨
  document.addEventListener('DOMContentLoaded', function (){
    document.getElementById("personal_register").addEventListener("click",function () {
      personal_register.init();
    });

    document.getElementById("business_register").addEventListener("click",function () {
      business_register.init();
    });
  });
</script>



<!--=================================
header -->
<!--=================================
header -->

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
          <div class="section-title">
            <h4 class="text-center">Create Your Account</h4>
          </div>
          <fieldset>
            <legend class="px-2">Choose your Account Type</legend>
            <ul class="nav nav-tabs nav-tabs-border d-flex" role="tablist">
              <li class="nav-item me-4">
                <a class="nav-link active"  data-bs-toggle="tab" href="/#candidate" role="tab" >
                  <div class="d-flex">
                    <div class="tab-icon">
                      <i class="flaticon-users"></i>
                    </div>
                    <div class="ms-3">
                      <h6 class="mb-0">개인 회원</h6>
                    </div>
                  </div>
                </a>
              </li>
              <li class="nav-item ms-auto">
                <a class="nav-link" data-bs-toggle="tab" href="/#employer" role="tab">
                  <div class="d-flex">
                    <div class="tab-icon">
                      <i class="flaticon-suitcase"></i>
                    </div>
                    <div class="ms-3">
                      <h6 class="mb-0">기업 회원</h6>
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
                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="memberId">아이디 *</label>
                    <input type="text" class="form-control" id="memberId" name="memberId" data-name="아이디">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label"for="memberName">이름 *</label>
                    <input type="text" class="form-control" id="memberName" name="memberName" data-name="이름">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label"for="password">비밀번호 *</label>
                    <input type="password" class="form-control" id="password" name="password" data-name="비밀번호">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="password2">비밀번호 재입력 *</label>
                    <input type="password" class="form-control" id="password2" name="password2" data-name="비밀번호 재입력">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="email">이메일 *</label>
                    <input type="text" class="form-control" id="email" name="email" data-name="이메일">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="phone">핸드폰 *</label>
                    <input type="text" class="form-control" id="phone" name="phone" data-name="핸드폰">
                  </div>
                  <div class="mb-3 col-12">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="ture" id="terms" name="terms">
                      <label class="form-check-label" for="terms">
                        <a href="이용약관_링크_주소_입력">이용약관</a>에 전체동의
                      </label>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <a class="btn btn-primary d-block" id="personal_register" name="button_register">회원가입</a>
                  </div>
                  <div class="col-md-6 text-md-end mt-2 text-center">
                    <p>이미 회원이신가요? <a href="/#"> 로그인 </a></p>
                  </div>
                </div>
              </form>
            </div>
            <div class="tab-pane fade" id="employer" role="tabpanel">
              <form class="mt-4" id="businessForm" name="businessForm">
                <div class="row">
                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="memberId">아이디 *</label>
                    <input type="text" class="form-control" id="memberId" name="memberId" data-name="아이디">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label"for="memberName">이름 *</label>
                    <input type="text" class="form-control" id="memberName" name="memberName" data-name="이름">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label"for="password">비밀번호 *</label>
                    <input type="password" class="form-control" id="password" name="password" data-name="비밀번호">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="password2">비밀번호 재입력 *</label>
                    <input type="password" class="form-control" id="password2" name="password2" data-name="비밀번호 재입력">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="email">이메일 *</label>
                    <input type="text" class="form-control" id="email" name="email" data-name="이메일">
                  </div>
                  <div class="mb-3 col-md-6">
                    <label class="form-label" for="phone">핸드폰 *</label>
                    <input type="text" class="form-control" id="phone" name="phone" data-name="핸드폰">
                  </div>
                  <div class="mb-3 col-12">
                    <label class="form-label" for="businessRegistrationNumber">사업자 번호 *</label>
                    <input type="text" class="form-control" id="businessRegistrationNumber" name="businessRegistrationNumber" data-name="사업자 번호">
                  </div>
                  <div class="mb-3 col-12">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="ture" id="terms" name="terms">
                      <label class="form-check-label" for="terms">
                        <a href="이용약관_링크_주소_입력">이용약관</a>에 전체동의
                      </label>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <a class="btn btn-primary d-block" id="business_register" name="button_register">회원가입</a>
                  </div>
                  <div class="col-md-6 text-md-end mt-2 text-center">
                    <p>이미 회원이신가요? <a href="/#"> 로그인 </a></p>
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

