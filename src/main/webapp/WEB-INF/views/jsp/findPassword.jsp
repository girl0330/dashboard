<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .nav-tabs.nav-tabs-03 li:after {
        border: none;
    }

    .breadcrumb-item+.breadcrumb-item::before {
        content: none;
    }
</style>
<script>
    findPassword = {
        emailInput: function () {
            if (!this.validationChk()) {
                return;
            }
            this.emailSubmit();
        },
        identityInput: function () {
            if (!this.validationChk2()) {
                return;
            }
            this.identitySubmit();
        },
        confirmStringInput: function () {
            this.confirmStringSubmit();
        },
        passwordInput: function () {
            if (!this.validationChk3()) {
                return;
            }
            this.passwordSubmit();
        },

        validationChk : function () {
            let valid = true;
            const userEmail = $('#userEmail').val();

            console.log("userEmail:: "+ userEmail);

            // 아이디 조건, 길이
            let emailRegex = /^[a-zA-Z0-9.!@#$%^&*]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test(userEmail)) {
                alert("이메일을 확인해주세요.");
                $('#userEmail').focus();
                valid = false;
                return valid;
            }
            return valid;
        },
        validationChk2 : function () {
            let valid = true;
            const name = $('#userName').val();
            const phone = $('#userPhone').val();

            console.log("name:: "+ name + ", phone"+ phone);

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
        validationChk3 : function() {
            let valid = true;
            const password = $('#password').val();
            const password2 = $('#password2').val();

            console.log("password:: "+password);
            console.log("password2::::" + password2);

            let passwordRegex = /^[a-zA-Z0-9.!@#$%^&*]+$/;
            if (!passwordRegex.test(password)) {
                alert("비밀번호 형식을 확인해주세요.")
                $('#password').focus();
                valid = false;
                return valid;
            }
            if (password.length > 15 || password.length < 8) {
                alert("비밀번호를 8~15자로 사용해주세요")
                $('#password').focus()
                valid = false;
                return valid;
            }
            if (password !== password2 ) {
                alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.")
                $('#password2').focus();
                valid = false;
                return valid;
            }
            return valid;
        },

        emailSubmit : function () {
                // JSON 객체로 변환
                const jsonData = {
                    email: $("#userEmail").val()
                };
                console.log(JSON.stringify(jsonData));

                const options = {
                    url: "/user/ajax/checkEmail", // Spring 컨트롤러 URL
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송

                    done: function(response) {
                        // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                        console.log(response);
                        if (response.code === 200) {
                            // 이메일 입력 탭의 active 클래스 제거
                            $("#email_input_tab").removeClass("active");
                            $("#email_input").removeClass("active show");

                            // 본인 확인 탭에 active 클래스 추가
                            $("#identity_check_tab").addClass("active");
                            $("#identity_check").addClass("active show");

                            // 탭이 전환되도록 이벤트 트리거
                            let tab = new bootstrap.Tab(document.getElementById('identity_check_tab'));
                            tab.show();
                        }
                    },
                    fail: function(jqXHR) {
                        console.error('요청 실패:', jqXHR.responseText); // 서버에서 반환된 응답
                        const errorResponse = JSON.parse(jqXHR.responseText); // JSON 파싱
                        alert("에러 발생: " + errorResponse.userMessage); // 사용자에게 에러 메시지 노출
                    }
                };

                ajax.call(options);
        },
        identitySubmit : function() {
            const jsonData = {
                name: $("#userName").val(),
                phone: $("#userPhone").val(),
                email: $("#userEmail").val(),
                userTypeCode: $("#userTypeCode").val()
            };

            console.log("jsonData확인 ;;;;  "+JSON.stringify(jsonData));

            const options = {
                url: "/user/ajax/checkIdentity", // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData),

                done: function(response) {
                    console.log(response.data);
                    $("#randomString").val(response.data);
                    $("#confirm_string_box").addClass("active show");
                    alert(`인증번호 확인란에 해당 인증번호를 입력하세요.
                        인증번호: ` + response.data);
                },
                fail: function(jqXHR) {
                    console.error('요청 실패:', jqXHR.responseText); // 서버에서 반환된 응답
                    const errorResponse = JSON.parse(jqXHR.responseText); // JSON 파싱
                    alert("에러 발생: " + errorResponse.userMessage); // 사용자에게 에러 메시지 노출
                }
            };
            ajax.call(options);
        },

        confirmStringSubmit : function () {
            let valid = true;
            const randomString = $("#randomString").val();
            const confirmString = $("#confirmString").val();

            if(randomString !== confirmString) {
                alert("인증번호가 틀렸습니다. 다시 인증번호를 받아주세요");
                valid = false;
                return valid;
            }
            // active 클래스 제거
            $("#identity_check_tab").removeClass("active");
            $("#identity_check").removeClass("active show");

            // active 클래스 추가
            $("#password_reset_tab").addClass("active");
            $("#password_reset").addClass("active show");

            // 탭이 전환되도록 이벤트 트리거
            let tab = new bootstrap.Tab(document.getElementById('confirm'));
            tab.show();
        },

        passwordSubmit: function () {
            const jsonData = {
                password: $("#password").val(),
                password2: $("#password2").val(),
                email: $("#userEmail").val()
            };
            console.log("jsonData확인 ;;;;  "+JSON.stringify(jsonData));
            const options = {
                url: "/user/api/passwordReset", // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송

                done: function(response) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log("넘어온 데이터 확인 : "+response);
                    if (response.code === 200){
                        alert(response.message);
                        location.href='/user/login'
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

    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('userEmailBtn').addEventListener("click", function () {
            findPassword.emailInput();
        })
        document.getElementById('identityCheckBtn').addEventListener("click", function () {
            $("#confirm_string_box").addClass("active show");
            findPassword.identityInput();
        })
        document.getElementById('confirm').addEventListener("click", function () {
            findPassword.confirmStringInput();
        })
        document.getElementById('passwordResetBtn').addEventListener("click", function () {
            findPassword.passwordInput();
        })
    })

</script>
<section class="header-inner bg-light text-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="section-title text-center">
                    <h2 class="text-primary">비밀번호 찾기</h2>
                    <input type="hidden" id="userTypeCode" value="${userTypeCode}">
                </div>
            </div>
            <div class="col-md-8">
                <div class=" justify-content-center">
                    <ul class="nav nav-tabs nav-tabs-03 justify-content-center d-sm-flex d-block text-center" id="myTab" role="tablist">
                        <li class="breadcrumb-item" >
                            <a class="nav-item active" id="email_input_tab" role="tab" aria-controls="email_input">
                                <span> 이메일 입력 </span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="nav-item" id="identity_check_tab" role="tab" aria-controls="identity_check">
                                <i class="fas fa-chevron-right"></i> <span> 본인 확인 </span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="nav-item" id="password_reset_tab" role="tab" aria-controls="password_reset">
                                <i class="fas fa-chevron-right"></i> <span> 비밀번호 재설정 </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade active show" id="email_input" role="tabpanel" aria-labelledby="email_input_tab">
        <section class="space-ptb">
            <div class="container">
                <div class="section-title-02 mb-4">
                    <h4>이메일 입력</h4>
                </div>
                <form class="row align-items-end justify-content-center">
                    <div class="form-group col-xl-6 col-md-9 col-sm-8 mb-3">
                        <label class="mb-2">사용중인 Email을 입력해주세요 *</label>
                        <input type="text" class="form-control" id="userEmail" name="email">
                    </div>
                    <div class="col-xl-2 col-md-3 col-sm-4 mb-3">
                        <a class="btn btn-outline-primary d-grid" id="userEmailBtn" href="#">다음</a>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <div class="tab-pane fade show" id="identity_check" role="tabpanel" aria-labelledby="identity_check_tab">
        <section class="space-ptb">
            <div class="container">
                <div class="section-title-02 mb-4">
                    <h4>본인 확인</h4>
                </div>
                <div class="row">
                    <form class="row align-items-end justify-content-center mb-3">
                        <div class="form-group col-md-2 mb-md-0 mb-3">
                            <label class="mb-2">이름(회사이름)</label>
                            <input type="text" id="userName" name="name" class="form-control" value="">
                        </div>
                        <div class="form-group col-md-3 mb-md-0 mb-3">
                            <label class="mb-2">휴대폰 번호(회사 대표번호)</label>
                            <input type="text" class="form-control" id="userPhone" name="phone" value="">
                        </div>
                        <div class="col-md-2">
                            <a class="btn btn-outline-primary d-grid" id="identityCheckBtn" href="#">확인</a>
                            <input type="hidden" id="randomString">
                        </div>
                    </form>
                    <div class="tab-pane fade" id="confirm_string_box">
                        <form class="row align-items-end justify-content-center">
                            <div class="form-group col-md-5">
                                <label class="mb-2">인증번호 확인</label>
                                <input type="text" id="confirmString" class="form-control" value="">
                            </div>
                            <div class="col-md-2">
                                <a class="btn btn-outline-primary d-grid" id="confirm" href="#">확인</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="tab-pane fade show" id="password_reset" role="tabpanel" aria-labelledby="password_reset_tab">
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="user-dashboard-info-box">
                            <div class="section-title-02 mb-4">
                                <h4>Change Password</h4>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <form class="row">
                                        <div class="form-group mb-3 col-md-12">
                                            <label class="form-label">새로운 비밀번호</label>
                                            <input type="password" class="form-control" id="password" name="password" value="">
                                        </div>
                                        <div class="form-group mb-3 col-md-12">
                                            <label class="form-label">비밀번호 재확인</label>
                                            <input type="password" class="form-control" id="password2" name="password2" value="">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <a class="btn btn-lg btn-primary" id="passwordResetBtn" href="#">Change Password</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<%--<div class="tab-content" id="myTabContent">--%>
<%--    <div class="tab-pane fade active show" id="Job-detail" role="tabpanel" aria-labelledby="Job-detail-tab">--%>
<%--            <div class="container">--%>
<%--                <form class="row align-items-end justify-content-center">--%>
<%--                    <div class="form-group col-xl-6 col-md-9 col-sm-8 mb-3">--%>
<%--                        <label class="mb-2">사용중인 Email을 입력해주세요 *</label>--%>
<%--                        <input type="text" class="form-control" value="">--%>
<%--                    </div>--%>
<%--                    <div class="col-xl-2 col-md-3 col-sm-4 mb-3">--%>
<%--                        <a class="btn btn-outline-primary d-grid" href="#">다음</a>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--    </div>--%>
<%--</div>--%>
