let validation = {
	email: function (emailValue) {
		let valid = true;
		console.log("emailValue ::::     "+emailValue);
		let emailRegex = /^[a-zA-Z0-9.!@#$%^&*]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if (!emailRegex.test(emailValue)) {
			alert("이메일 형식으로 입력해주세요.")
			$('#'+focusId).focus();
			valid = false;
		}
		return valid;
	},
}
