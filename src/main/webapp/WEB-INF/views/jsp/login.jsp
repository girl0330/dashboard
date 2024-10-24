<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script>
  let user_login = {
    init : function () {
    // 공백함수실행
      if (!this.emptyChkFn()) {
        return;
      }
      //조건함수실행
      if (!this.validationChk()){
        return;
      }
    // submit 함수 실행
      this.formSubmit();
    },
    // 공백함수
    emptyChkFn : function () {
      let valid = true;
      const form = $('#userForm');
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
      let valid = true;
      const loginId = $('#email').val();
      const loginPassword = $('#password').val();

      // 아이디 조건, 길이
      let emailRegex = /^[a-zA-Z0-9.!@#$%^&*]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      if (!emailRegex.test(loginId)) {
        alert("이메일을 확인해주세요.");
        // $("#email").addClass("is-invalid");
        // $("#emailError").text("유효한 이메일 형식으로 입력해주세요.").show();
        $('#email').focus();
        valid = false;
        return valid;
      }

      // 비밀번호 조건, 길이, 비밀번호 확인
      let pwRegex = /^[a-zA-Z0-9.!@#$%^&*]+$/;
      if (!pwRegex.test(loginPassword)) {
        alert("비밀번호 형식을 확인해주세요");
        $('#password').focus();
        valid = false;
        return valid;
      }
      if (loginPassword.length > 15 || loginPassword.length < 8) {
        alert("비밀번호를 8~15자로 사용해주세요");
        $('#password').focus();
        valid = false;
        return valid;
      }

      return valid;
    },

    //submit 함수
    formSubmit : function () {
      const formData = $("#userForm").serializeArray();
      console.log("data check :::" + JSON.stringify(formData));
      // const userTypeCode = $('#userTypeCode').val();
      // console.log("userTypeCode :: " +userTypeCode);

      // JSON 객체로 변환
      let jsonData = {};
      $.each(formData, function() {
        jsonData[this.name] = this.value;
      });

      console.log("jsonData :" + JSON.stringify(jsonData));

      const options = {
        url: "/user/doLogin", // Spring 컨트롤러 URL
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송

        done: function(response) {
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
          console.log(JSON.stringify(response));
          if (response.code === 200) {
            if (response.redirectUrl != null) {
              window.location.href = response.redirectUrl;
            } else {
              location.href = '/'
            }
          }
        },
        fail: function(jqXHR) {
          console.error('요청 실패:', jqXHR.responseText); // 서버에서 반환된 응답
          const errorResponse = JSON.parse(jqXHR.responseText); // JSON 파싱
          alert(errorResponse.userMessage); // 사용자에게 에러 메시지 노출
        }
      };

      ajax.call(options);

    }
  }

  function updateFindPasswordLink() {
    let userTypeCode = $("#userTypeCode").val();
    let updateFindPasswordLink = "/user/findPassword?userTypeCode=" + userTypeCode;
    console.log("Updated Link: " + updateFindPasswordLink);
    $("#findPasswordLink").attr("href", updateFindPasswordLink)
  }

  //DOM이 실행 후 실행 됨
  $(document).ready(function() {
    $("#user_login").on("click",function () {
      user_login.init();
    });

    $("#userTypeCode").val("10");
    updateFindPasswordLink();

    $("#personalTypeCode").on("click",function () {
      $("#userTypeCode").val("10");
      updateFindPasswordLink();
    });

    $("#companyTypeCode").on("click",function () {
      $("#userTypeCode").val("20");
      updateFindPasswordLink();
    });

  });
  // // Kakao 초기화
  // Kakao.init('afcb905c7668725d0a22469ede432941'); // 카카오 앱 키 입력
  // Kakao.isInitialized();

  // 카카오 로그인 함수
  // function loginWithKakao() {
  //   window.Kakao.Auth.authorize({
  //     scope:'profile_nickname',
  //     success: function (authObj) {
  //       console.log(authObj);
  //       window.Kakao.API.request({
  //         url:'/v2/user/me',
  //         success: res => {
  //           const kakao_account = res.kakao_account;
  //           console.log(kakao_account);
  //         }
  //       })
  //     }
  //     // redirectUri: 'http://localhost:8080/kakao_callback' // 등록한 리다이렉트 URI 입력
  //   });
  // }
</script>

<!--=================================
inner banner -->
<div class="header-inner bg-light text-center">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="text-primary">로그인</h2>
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
          <fieldset>
            <legend class="px-2">계정 타입 선택</legend>
            <ul class="nav nav-tabs nav-tabs-border d-flex" role="tablist">
              <li class="nav-item me-4">
                <a class="nav-link active" id="personalTypeCode" data-bs-toggle="tab" href="#candidate" role="tab" aria-selected="false">
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
                <a class="nav-link" id="companyTypeCode" data-bs-toggle="tab" href="#candidate" role="tab" aria-selected="false">
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
              <form class="mt-4" id="userForm" name="userForm">
                <div class="row">
                  <input type="hidden" name="userTypeCode" id="userTypeCode" value="10">
                  <div class="mb-3 col-6">
                    <label class="form-label" for="email">아이디 *</label>
                    <input type="text" class="form-control" id="email" name="email" data-name="아이디">
                  </div>
                  <div class="mb-3 col-6">
                    <label class="form-label" for="password">비밀번호 *</label>
                    <input type="password" class="form-control" id="password" name="password" data-name="비밀번호">
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <a class="btn btn-primary d-block" id="user_login" name="user_login">로그인</a>
                  </div>
                  <div class="col-md-6">
                    <div class="mt-3 mt-md-0 forgot-pass">
                      <a href="/user/findPassword?userTypeCode=" id="findPasswordLink">비밀번호 찾기</a>
                      <p class="mt-1">회원이 아니신가요? <a href="/user/signUp" > 회원가입 하기</a></p>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="mt-4">
            <fieldset>
              <legend class="px-2">소셜 로그인 / 회원가입</legend>
              <!-- kakao button -->
              <div class="text-center">
                <a href="/kakao/login">
                  <img src="/images/kakao_login_medium_wide.png" alt="KakaoLogin">
                </a>
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





