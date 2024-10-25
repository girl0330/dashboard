<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

    passwordChange = {
        init : function () {
            if (!this.validationChk()) {
                return;
            }
            this.submitForm();
        },

        validationChk : function () {
            let valid = true;
            const current_password = $('#password').val();
            const new_password = $('#newPassword').val();
            const password2 = $('#password2').val();

            let passwordRegex = /^[a-zA-Z0-9.!@#$%^&*]+$/;
            if (!passwordRegex.test(current_password)) {
                alert("비밀번호 형식을 확인해주세요.")
                $('#password').focus();
                valid = false;
                return valid;
            }
            if (!passwordRegex.test(new_password)) {
                alert("비밀번호 형식을 확인해주세요.")
                $('#newPassword').focus();
                valid = false;
                return valid;
            }
            if (current_password.length > 15 || current_password.length < 8) {
                alert("비밀번호를 8~15자로 사용해주세요")
                $('#password').focus()
                valid = false;
                return valid;
            }
            if (new_password.length > 15 || new_password.length < 8) {
                alert("비밀번호를 8~15자로 사용해주세요")
                $('#newPassword').focus()
                valid = false;
                return valid;
            }
            if (new_password !== password2 ) {
                alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.")
                $('#password2').focus();
                valid = false;
                return valid;
            }
            return valid;
        },

        submitForm: function () {
            console.log("비밀번호 변경 함수 실행")
            const formData = $('#changePassword').serializeArray();
            let jsonData = {};

            $.each(formData, function () {
                jsonData[this.name] = this.value;
            });
            console.log("formData " + JSON.stringify(formData));

            const options = {
                url: '/business/ajax/changePassword',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData),

                done: function (response) {
                    console.log(response.data);
                    if (response.code === 200) {
                        alert(response.message);
                        location.href='/business/changePassword'
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
        document.getElementById('changeButton').addEventListener("click", function () {
            passwordChange.init();
        })
    })
</script>
<!--=================================
Dashboard Nav -->
<%@ include file="businessMenuInclude.jsp"%>
<!--=================================
Dashboard Nav -->

<!--=================================
Change Password -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box">
                    <div class="row">
                        <form class="mt-4" id="changePassword" name="changePassword">
                            <div class="col-12">
                                <div class="form-group col-md-12 mb-3">
                                    <label class="form-label">사용중인 비밀번호</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>
                                <div class="form-group col-md-12 mb-3">
                                    <label class="form-label">새로운 비밀번호</label>
                                    <input type="password" class="form-control" id="newPassword" name="newPassword">
                                </div>
                                <div class="form-group col-md-12 mb-0">
                                    <label class="form-label">비밀번호 확인</label>
                                    <input type="password" class="form-control" id="password2" name="password2">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <a class="btn btn-lg btn-primary" id="changeButton">변경</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Change Password -->
