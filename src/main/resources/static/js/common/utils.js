/**
 * AJAX 요청
 *
 * @param {Object} options - AJAX 요청 옵션.
 * @param {string} options.url - 요청을 보낼 URL.
 * @param {string} [options.type='POST'] - 요청 유형 (예: "POST", "GET").
 * @param {string} [options.dataType='json'] - 서버로부터 기대하는 데이터 유형.
 * @param {string} [options.contentType='application/x-www-form-urlencoded;charset=UTF-8'] - 전송할 데이터의 콘텐츠 유형, 파일첨부 -> false 설정할것
 * @param {Object} [options.data={}] - 서버로 보낼 데이터.
 * @param {boolean} [options.async=true] - 요청을 비동기식으로 할지 여부.
 * @param {Function} [options.beforeSend=() => {}] - 요청 전에 수행할 콜백 함수.
 * @param {boolean} [options.processData=true] - 데이터를 자동으로 처리할지 여부, 파일첨부 -> false 설정할것
 * @param {Function} [options.fail] - 요청이 실패했을 때 실행할 콜백 함수.
 * @param {Function} [options.done] - 요청이 성공했을 때 실행할 콜백 함수.
 *
 * @returns {Promise<void>} AJAX 요청이 완료되면 Promise가 반환됩니다.
 */
const ajax = {
	call: async (options) => {
		const {
			url,
			type = 'POST',
			dataType = 'json',
			contentType = 'application/x-www-form-urlencoded;charset=UTF-8',
			data = {},
			async = true,
			beforeSend = () => {},//요청 전 작업 수행
			processData = true,
			fail,
			done
		} = options;

		try {
			// 특정 요청에 대해서만 설정을 변경하고, 전역 설정은 건드리지 않음
			const response = await $.ajax({
				url,
				type,
				dataType,
				contentType,
				data,
				async,
				beforeSend,
				processData,
				traditional: true // 특정 요청에 대해서만 설정
			});
			//차후 customException 추가 시에 조건입력할것
			if(done) {
				done(response);
			}

		} catch (jqXHR) {
			if (fail) {
				fail(jqXHR);
			} else {
				// fail 콜백이 없는 경우에만 기본 에러 처리를 수행
				ajax.error(jqXHR.status, jqXHR.responseText);
			}
		}
	},
	error: (status, responseText) => {
		// 기본 에러 처리
		const jsonObj = JSON.parse(responseText);
		alert(jsonObj.userMessage);
	}
}

const validation = {
	email: (inputElement) => {
		const emailRegex = /^[a-zA-Z0-9.!@#$%^&*]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		const emailValue = inputElement.value;

		if (!emailRegex.test(emailValue)) {
			alert("이메일 형식으로 입력해주세요.")
			inputElement.focus();
			return false;
		}
		return true;
	},

	password : function (passwordInput1, passwordInput2) {
		const password1 = passwordInput1;
		const password2 = passwordInput2;
		const passwordRegex = /^[a-zA-Z0-9.!@#$%^&*]+$/;

		if (!passwordRegex.test(password1)){
			alert("비밀번호 형식을 확인해주세요");
			passwordInput1.focus();
			return false;
		}

		if (password1.length < 8 || password1.length > 15) {
			alert("비밀번호를 8~15자로 사용해주세요")
			passwordInput1.focus();
			return false;
		}

		if (password1 !== password2) {
			alert("비밀번호를 확인해주세요")
			passwordInput2.focus();
			return false;
		}
		return true;
	},
	changePassword : function (password1, password2, password3,  focusId1, focusId2, focusId3) {
		let valid = true;
		console.log("password1 ::::     " + password1 + "password2" + password2 + "password3" + password3);

		let passwordRegex = /^[a-zA-Z0-9.!@#$%^&*]+$/;
		if (!passwordRegex.test(password1)) {
			alert("사용중인 비밀번호를 다시 확인해주세요.")
			$('#'+focusId1).focus();
			valid = false;
			return valid;
		}
		if (!passwordRegex.test(new_password)) {
			alert("새로 사용할 비밀번호를 다시 확인해주세요.")
			$('#'+focusId2).focus();
			valid = false;
			return valid;
		}
		if (password1.length > 15 || password1.length < 8) {
			alert("사용중인 비밀번호를 8~15자로 사용해주세요")
			$('#'+focusId1).focus()
			valid = false;
			return valid;
		}
		if (password2.length > 15 || password2.length < 8) {
			alert("새로 사용할를 8~15자로 사용해주세요")
			$('#'+focusId2).focus()
			valid = false;
			return valid;
		}
		if (password2 !== password3 ) {
			alert("비밀번호를 확인해주세요.")
			$('#'+focusId3).focus();
			valid = false;
			return valid;
		}
		return valid;
	},

	profileValidation : function (name, phone, focusId1, focusId2) {
		let valid = true;
		console.log("password1 :" + name + "name" + phone + "phone" );

		// 특수문자 검사
		let nameRegex = /[.!@#$%^&*]+/;
		if (nameRegex.test(name)) {
			alert("특수문자는 사용할 수 없습니다.");
			$('#'+focusId1).focus();
			valid = false;
			return valid;
		}
		if (phone.length < 8 || phone.length > 11 ) {
			alert("휴대폰번호 형식에 맞지 않습니다.")
			$('#'+focusId2).focus();
			valid = false;
			return valid;
		}
		let phoneRegex = /^010/;
		if (!phoneRegex.test(phone)) {
			alert("전화번호는 010으로 시작해야 합니다.");
			$('#'+focusId2).focus();
			valid = false;
			return valid;
		}
		return valid;
	},

	numCheck: function () {
		let valid = true;
		$('input[name*="num"]').each(function () {
			console.log($(this).attr('name') + '-' + $(this).val());
			const numField = $(this).val();

			// 숫자 이외의 문자가 있는지 검사하는 정규 표현식
			let nonNumericPattern = /[^0-9]/g;
			if (nonNumericPattern.test(numField)) {
				let text = $(this).attr('data-name');
				alert(text + '에 숫자만 입력해주세요.');
				numField.focus();
				valid = false;
				return valid;
			}
		})
		return valid;
	}
}
// 공백검사
let emptyCheck = {
	emptyChkFn: function (something) {
		console.log("something ::::     " + something);
		let valid = true;
		// const email = $('#email');
		// const input = email.find("input[type='text']");

		const removeBlankData = something.val().replace(/\s*/g, "");
		if (removeBlankData === "") {
			let text = something.data('name');
			alert(text + "이 비어있습니다.");
			something.focus();
			valid = false;
		}
		return valid;
	},

	MultipleEmptyChkFn : function () {
		let valid = true;
		$('[valid="true"]').each(function() {
			// 각 요소의 이름과 값을 출력 (또는 다른 작업 수행)
			console.log($(this).attr('name') + ': ' + $(this).val());
			const fields = $(this);
			const removeBlank = fields.val().replace(/\s*/g, "");
			if (removeBlank === "") {
				let text = $(this).attr('data-name');
				alert(text+"반드시 입력해주세요");
				fields.focus();
				valid = false;
				return valid;
			}
		});
		return valid;
	},
}
checkboxFun = function (param) {
	let valid = true;
	const form = $('#userForm');
	const checkBox = form.find("input[type='checkbox']");
	const isChecked = checkBox.prop('checked');

	if (!isChecked) {
		alert("동의여부는 필수 입력 값입니다.");
		valid = false;
		return valid;
	}
	return valid;
}

const selectUtils = {
	/**
	 * select 박스생성 후 특정 부모요소 아래 추가
	 *
	 * @param {string} parentId - select 요소를 추가할 부모요소 id
	 * @param {string} selectClass - select 요소 class
	 * @param {string} selectId - select 요소 id
	 * @param {string} selectName - select 요소 name
	 * @param {Array} listData - select option에 넣을 객체 배열
	 * @param {Object} [option] - option 값 구조 ({value: '', text: '선택'})
	 */
	createSelect: (parentId, selectClass, selectId, selectName, listData, option) => {
		const parent = document.getElementById(parentId);

		// 부모 요소가 없으면 Error
		if (!parent) {
			console.error('Parent element with id '+parentId+' not found.');
			return;
		}

		// 새로운 select 요소를 생성하고 class, id, name 속성을 설정
		const select = document.createElement('select');
		select.id = selectId;
		select.name = selectName;
		select.className = selectClass;

		// listData에 있는 항목들을 select 요소에 추가합니다.
		selectUtils.createOption(select, listData, option);

		parent.appendChild(select);
	},

	/**
	 * 기존 select 요소에 옵션을 추가
	 *
	 * @param {HTMLSelectElement} select - 옵션을 추가할 select 요소 (예:document.getElementById('selectId');)
	 * @param {Array} listData - select option에 넣을 객체 배열
	 * @param {Object} [defaultOption] -  defaultOption 값 ({value: '', text: '선택'})
	 */
	createOption: (select, listData, defaultOption = { value: '', text: '선택' }) => {
		// select 요소나 listData가 유효하지 않으면 에러 메시지를 출력 후 함수를 종료
		if (!select || !Array.isArray(listData)) {
			console.error('Invalid select element or list data.');
			return;
		}

		// 기본 옵션(defaultOption)이 제공되었으면 해당 옵션을 select 요소에 추가
		listData = [defaultOption, ...listData];

		// listData 배열의 각 항목을 순회하면서 옵션 요소를 생성하고 select 요소에 추가
		for (const item of listData) {
			const option = document.createElement("option");
			option.value = item.value;
			option.text = item.text;
			select.appendChild(option);
		}
	},

	ajaxSelect: (parentIds, groupCodes) => {
		const options = {
			url: '/common/getSelectBoxOption',
			type: 'GET',
			data: { groupCodes: groupCodes.join(',') },
			done: (response) => {
				groupCodes.forEach((groupCode, index) => {
					const parentId = parentIds[index];
					selectUtils.createSelect(parentId, 'form-control basic-select', commonUtils.toCamelCase(groupCode), commonUtils.toCamelCase(groupCode), response[groupCode]);
				});
			}
		};
		ajax.call(options);
	},

	ajaxOption: (parentIds, groupCodes) => {
		const options = {
			url: '/common/getSelectBoxOption',
			type: 'GET',
			data: { groupCodes: groupCodes.join(',') },
			done: (response) => {
				groupCodes.forEach((groupCode, index) => {
					const parentId = document.getElementById(parentIds[index]);
					selectUtils.createOption(parentId, response[groupCode]);
				});
			}
		};
		ajax.call(options);
	}
}

const commonUtils = {

	//snake_case -> camelCase 변환
	toCamelCase: (str) => {
	return str
		.toLowerCase() // 소문자로 변환
		.split('_') // 언더스코어를 기준으로 분리
		.map((word, index) => {
			if (index === 0) {
				return word; // 첫 번째 단어는 소문자로 유지
			}
			return word.charAt(0).toUpperCase() + word.slice(1); // 첫 글자를 대문자로 변환하고 나머지는 그대로
		})
		.join(''); // 다시 합치기
	},

	customAlert: (message) => {
		const modalPopup = new bootstrap.Modal(document.getElementById('commonModal'), {
			keyboard: false
		});
		$('#modalBody').text(message);
		modalPopup.show();
	}
}