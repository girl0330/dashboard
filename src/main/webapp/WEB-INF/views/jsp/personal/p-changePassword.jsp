<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

    passwordChange = {
        init : function () {
            alert("click?")
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

            console.log("currentPassword:: "+ current_password);
            console.log("newPassword:: "+new_password);
            console.log("password2::::" + password2);

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
                alert("비밀번호를 확인해주세요.")
                $('#password2').focus();
                valid = false;
                return valid;
            }
            console.log("check all ok");
            return valid;
        },

        submitForm : function () {
            alert("비빌번호 전송");
            const formData = $('#changePassword').serializeArray();
            console.log("formData " + JSON.stringify(formData));

            let jsonData = {};
            $.each(formData, function () {
                jsonData[this.name] = this.value;
            });

            $.ajax({
                url: "/personal/goChangePassword",
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData),
                success: function (data) {
                    console.log(JSON.stringify(data));
                    if (data.code === 'error') {
                        alert(data.message);
                    } else if (data.code === 'success') {
                        alert(data.message);
                        location.href='/personal/changePassword'
                    }
                }
            })

        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('changeButton').addEventListener("click", function () {
            passwordChange.init();
        })
    })
</script>
<!--=================================
inner banner ,Dashboard Nav -->
<%@ include file="personalMenuInclude.jsp"%>
<!--=================================
Candidates Dashboard -->

<!--=================================
Change Password -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box">
                    <div class="section-title-02 mb-4">
                        <h4>Change Password</h4>
                    </div>
                    <div class="row">
                        <form class="mt-4" id="changePassword" name="changePassword">
                            <div class="col-12">
                            <div class="form-group col-md-12 mb-3">
                                <label class="form-label">Current Password</label>
                                <input type="password" class="form-control" id="password" name="password">
                            </div>
                            <div class="form-group col-md-12 mb-3">
                                <label class="form-label">New Password</label>
                                <input type="password" class="form-control" id="newPassword" name="newPassword">
                            </div>
                            <div class="form-group col-md-12 mb-0">
                                <label class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" id="password2" name="password2">
                            </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <a class="btn btn-lg btn-primary" id="changeButton">비밀번호 변경</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Change Password -->
