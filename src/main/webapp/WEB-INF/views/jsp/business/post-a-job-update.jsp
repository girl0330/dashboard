<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

    let postSave = {
        init : function () {
            this.formSubmit();
        },

        //전송 함수
        formSubmit : function () {
            alert("전송함수")
            const formData = $("#postJobForm").serializeArray();
            console.log("formDtat::: "+JSON.stringify(formData));

            let jsonData = {};
            $.each(formData, function () {
                jsonData[this.name] = this.value;
            });

            const url = "/business/postAJob";
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
                        location.href='/business/detail'
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        }
    }

    //DOM
    document.addEventListener('DOMContentLoaded', function () {
        test();


        function test() {
            // 시 데이터 가져오기
            $.ajax({
                url: '/business/getSiGroup',
                method: 'GET',
                success: function (data) {
                    console.log("data:::   " + data);
                    data.forEach(function (si) {
                        $('#code1').append('<option value="' + si + '">' + si + '</option>');
                    });
                }
            });


            // 시 값 선택  이벤트 처리
            $('#code1').on('select2:select', function (e) {
                const selectedValue = e.params.data.id; // 선택된 값의 ID
                console.log("selectedValue_____"+selectedValue);

                $.ajax({
                    url: '/business/getGunGroup',
                    data: {gun: selectedValue},
                    method: 'GET',
                    success: function (data) {
                        console.log("시 data:::   " + data);
                        data.forEach(function (gun) {
                            $('#code2').append('<option value="' + gun + '">' + gun + '</option>');
                        });
                    }
                });

            });

            $('#code2').on('select2:select', function (e) {
                const selectedValue = e.params.data.id; // 선택된 값의 ID
                console.log("selectedValue_____"+selectedValue);

                $.ajax({
                    url: '/business/getGuGroup',
                    data: {gu: selectedValue},
                    method: 'GET',
                    success: function (data) {
                        console.log("시 data:::   " + data);
                        data.forEach(function (gu) {
                            $('#code3').append('<option value="' + gu + '">' + gu + '</option>');
                        });
                    }
                });

            });
        }


        document.getElementById("profile_sava_button").addEventListener("click",function () {
            postSave.init();
        });
    });
</script>
<!--=================================
tab -->
<section class="space-ptb bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="section-title text-center">
                    <h2 class="text-primary">Post a New Job</h2>
                </div>
            </div>
            <div class="col-md-8">
                <div class=" justify-content-center">
                    <ul class="nav nav-tabs nav-tabs-03 justify-content-center d-sm-flex d-block text-center" id="myTab" role="tablist">
                        <li class="flex-fill">
                            <a class="nav-item active" id="Job-detail-tab" data-bs-toggle="tab" href="#Job-detail" role="tab" aria-controls="Job-detail" aria-selected="false">
                                <div class="feature-info-icon mb-3">
                                    <i class="flaticon-suitcase"></i>
                                </div>
                                <span>Job Detail</span>
                            </a>
                        </li>
                        <li class="flex-fill">
                            <a class="nav-item" id="Package-tab" data-bs-toggle="tab" href="#Package" role="tab" aria-controls="Package" aria-selected="false">
                                <div class="feature-info-icon mb-3">
                                    <i class="flaticon-debit-card"></i>
                                </div>
                                <span>Package &amp; Payments</span>
                            </a>
                        </li>
                        <li class="flex-fill">
                            <a class="nav-item" id="Confirm-tab" data-bs-toggle="tab" href="#Confirm" role="tab" aria-controls="Confirm" aria-selected="false">
                                <div class="feature-info-icon mb-3">
                                    <i class="flaticon-tick"></i>
                                </div>
                                <span>Confirmation</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade active show" id="Job-detail" role="tabpanel" aria-labelledby="Job-detail-tab">
        <section class="space-ptb">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <form class="row" id="postJobForm" name="postJobForm">
                            <div class="row mt-4 mt-lg-5">
                                <div class="col-12">
                                    <h5 class="mb-4">공고글 작성</h5>
                                </div>
                            </div>
                            <div class="form-group col-md-12 mb-3">
                                <label class="mb-2">공고 제목 *</label>
                                <input type="text" class="form-control" value="${board.title}" placeholder="공고 제목을 입력해주세요." name="title" id="title">
                            </div>
                            <div class="form-group col-md-12 mb-3">
                                <label class="mb-2">상세모집내용 </label>
                                <textarea class="form-control" rows="4" value="${board.content}"placeholder="상세모집내용을 작성해주세요"  name="content" id="content"></textarea>
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="mb-2">가게 이름 *</label>
                                <input type="text" class="form-control" value="${board.storeName}" placeholder="가게이름을 입력해주세요." name="storeName" id="storeName">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="mb-2">가게 전화번호 *</label>
                                <input type="text" class="form-control" value="${board.storeCallNumber}" placeholder="연락처를 입력해주세요." name="storeCallNumber" id="storeCallNumber">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="mb-2">담당자 이름 *</label>
                                <input type="text" class="form-control" value="${board.manager}" placeholder="이름을 입력해주세요." name="manager" id="manager">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="mb-2">이메일 *</label>
                                <input type="email" class="form-control" value="${board.email}" placeholder="이메일을 입력해주세요." name="email" id="email">
                            </div>
                            <div class="row mt-4 mt-lg-5">
                                <div class="col-12">
                                    <h5 class="mb-4">모집조건</h5>
                                </div>
                            </div>
                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2"  for="workType">모집직종 *</label>
                                <select class="form-control basic-select" value="${board.workType}" id="workType" name="workType">
                                    <option value=" 외식/음료" >외식/음료</option>
                                    <option value=" 유통/판매" >유통/판매</option>
                                    <option value=" 문화/여가/생활" >문화/여가/생활</option>
                                    <option value=" 서비스" >서비스</option>
                                    <option value=" 사무/회계" >사무/회계</option>
                                    <option value=" 고객상담/영업/리서치" >고객상담/영업/리서치</option>
                                    <option value=" 생산/건설/노무" >생산/건설/노무</option>
                                    <option value=" IT/인터넷" >IT/인터넷</option>
                                    <option value=" 교육/강사" >교육/강사</option>
                                    <option value=" 디자인" >디자인</option>
                                    <option value=" 미디어" >미디어</option>
                                    <option value=" 운전/배달" >운전/배달</option>
                                    <option value=" 병호/간호/연구" >병호/간호/연구</option>

                                </select>
                            </div>
                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2"  for="employmentType">고용형태 *</label>
                                <select class="form-control basic-select" value="${board.employmentType}" id="employmentType" name="employmentType">
                                    <option value="value 아르바이트" >아르바이트</option>
                                    <option value="value 정직원" >정직원</option>

                                </select>
                            </div>
                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2"  for="numberOfStaff">모집인원 *</label>
                                <select class="form-control basic-select" value="${board.numberOfStaff}" id="numberOfStaff" name="numberOfStaff">
                                    <option value=" 1명" >1명</option>
                                    <option value=" 0명(10명 미만)" >0명</option>
                                    <option value=" 00명(100명 미만)" >00명</option>

                                </select>
                            </div>
                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2" for="gender">성별 *</label>
                                <select class="form-control basic-select" value="${board.gender}" id="gender" name="gender">
                                    <option value="무관">무관</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2"for="qualifications">학력 *</label>
                                <select class="form-control basic-select" value="${board.qualifications}" id="qualifications" name="qualifications">
                                    <option value="무관">무관</option>
                                    <option value="고졸 이상">고졸 이상</option>
                                    <option value="대졸 이상">대졸 이상</option>
                                </select>
                            </div>
                            <div class="form-group mb-12 col-md-12">
                                <label class="d-block mb-3">우대사항</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="none"   id="etc" value="선택안함">
                                    <label class="form-check-label" for="etc">선택안함</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="industry-experience" id="etc" value="동종업계 경력자">
                                    <label class="form-check-label" for="etc">동종업계 경력자</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="long-term" id="etc" value="장기근무 가능자">
                                    <label class="form-check-label" for="etc">장기근무 가능자</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="local" id="etc" value="인근거주자">
                                    <label class="form-check-label" for="etc">인근거주자</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="beginner" id="etc" value="기타: 초보자가능">
                                    <label class="form-check-label" for="etc">기타: 초보자가능</label>
                                </div>
                            </div>
                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2"  for="code1">시</label>
                                <select class="form-control basic-select" value="${board.code1}" id="code1" name="code1">
                                    <option value="선택">선택</option>
                                </select>
                            </div>

                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2"  for="code2">군</label>
                                <select class="form-control basic-select" value="${board.code2}" id="code2" name="code2">
                                    <option value="선택">선택</option>
                                </select>
                            </div>

                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2"  for="code3">구</label>
                                <select class="form-control basic-select" value="${board.code3}" id="code3" name="code3">
                                    <option value="선택">선택</option>
                                </select>
                            </div>

                            <div class="row mt-4 mt-lg-5">
                                <div class="col-12">
                                    <h5 class="mb-4">근무조건</h5>
                                </div>
                            </div>
                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2"  for="salaryType">급여 타입 *</label>
                                <select class="form-control basic-select" value="${board.salaryType}" id="salaryType" name="salaryType">
                                    <option value="시급">시급</option>
                                    <option value="일급">일급</option>
                                    <option value="월급">월급</option>

                                </select>
                            </div>
                            <div class="form-group col-md-4 mb-3">
                                <label class="mb-2" for="salary">급여 액수 *</label>
                                <input type="text" class="form-control" value="${board.salaryType}" placeholder="이름을 입력해주세요." name="salary" id="salary">
                            </div>
                            <div class="form-group col-md-4 select-border mb-3">
                                <label class="mb-2" for="otherSalary">기타 급여 *</label>
                                <select class="form-control basic-select" value="${board.otherSalary}"  id="otherSalary" name="otherSalary">
                                    <option value=" " >선택안함</option>
                                    <option value="식비 별도지급/식사제공" >식비 별도지급/식사제공</option>
                                    <option value="차비 별도지급" >차비 별도지급</option>

                                </select>
                            </div>
                            <div class="form-group col-md-3 select-border mb-3">
                                <label class="mb-2"  for="workingTime">근무기간 *</label>
                                <select class="form-control basic-select" value="${board.workingTime}"id="workingTime" name="workingTime">
                                    <option value="1일">1일</option>
                                    <option value="1주일 이내">1주일 이내</option>
                                    <option value="1주일~1개월">1주일~1개월</option>
                                    <option value="1개월~3개월">1개월~3개월</option>
                                    <option value="3개월~6개월">3개월~6개월</option>
                                    <option value="6개월~1년">6개월~1년</option>
                                    <option value="1년이상">1년이상</option>

                                </select>
                            </div>
                            <div class="form-group col-md-3 mb-3">
                                <label class="mb-2" for="workingDays">근무요일 *</label>
                                <select class="form-control basic-select" value="${board.workingDays}"id="workingDays" name="workingDays">
                                    <option value="평일(월,화,수,목,금)">평일(월,화,수,목,금)</option>
                                    <option value="주말(토,일)">주말(토,일)</option>
                                    <option value="월요일">월요일</option>
                                    <option value="화요일">화요일</option>
                                    <option value="수요일">수요일</option>
                                    <option value="목요일">목요일</option>
                                    <option value="금요일">금요일</option>
                                    <option value="토요일">토요일</option>
                                    <option value="일요일">일요일</option>
                                    <option value="요일협의">요일협의</option>

                                </select>
                            </div>
                            <div class="form-group col-md-3 select-border mb-3">
                                <label class="mb-2" for="workingHours">근무시간 *</label>
                                <input type="text" class="form-control" value="${board.workingHours}" placeholder="00:00~00:00로 입력해주세요" name="workingHours" id="workingHours">
                            </div>

                            <div class="form-group col-md-3 select-border mb-md-0 mb-3">
                                <label class="mb-2" for="deadLine">모집기한 *</label>
                                <input type="text" class="form-control" value="${board.deadLine}" name="deadLine" id="deadLine">
                            </div>
                            <div class="col-md-12">
                                <a class="btn btn-primary" id="profile_sava_button">작성완료</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="tab-pane fade show" id="Package" role="tabpanel" aria-labelledby="Package-tab">
        <section class="space-ptb">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h5 class="mb-4">Buy New Package</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table class="table table-striped mb-0">
                                <thead class="bg-light">
                                <tr>
                                    <th scope="col">Select</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Total Jobs</th>
                                    <th scope="col">Job Expiry</th>
                                    <th scope="col">Package Expiry</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="pachage-01">
                                            <label class="custom-control-label" for="pachage-01"></label>
                                        </div>
                                    </td>
                                    <th>Golden</th>
                                    <td>$90.00</td>
                                    <td>15</td>
                                    <td>30 Days</td>
                                    <td>30 Days</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="pachage-02">
                                            <label class="custom-control-label" for="pachage-02"></label>
                                        </div>
                                    </td>
                                    <th>Premium</th>
                                    <td>$159.00</td>
                                    <td>25</td>
                                    <td>60 Days</td>
                                    <td>60 Days</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="pachage-03">
                                            <label class="custom-control-label" for="pachage-03"></label>
                                        </div>
                                    </td>
                                    <th>Silver</th>
                                    <td>$50.00</td>
                                    <td>10</td>
                                    <td>20 Days</td>
                                    <td>20 Days</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="pachage-04">
                                            <label class="custom-control-label" for="pachage-04"></label>
                                        </div>
                                    </td>
                                    <th>Standard</th>
                                    <td>Free</td>
                                    <td>1</td>
                                    <td>15 Days</td>
                                    <td>15 Days</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-12 mt-4">
                        <a class="btn btn-primary" href="#">Update Package</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="tab-pane fade show" id="Confirm" role="tabpanel" aria-labelledby="Confirm-tab">
        <section class="space-ptb">
            <div class="container">
                <div class="row text-center">
                    <div class="col-12 mb-4">
                        <svg class="text-primary" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="200" height="200" viewBox="0 0 60 60" version="1.1"><!-- Generator: Sketch 51.3 (57544) - http://www.bohemiancoding.com/sketch --><title>036 - Device Cover</title><desc>Created with Sketch.</desc><defs/><g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g fill="#ff8a00" fill-rule="nonzero"><path d="M36.608,26.522 L44.42,32.083 C44.7671643,32.330178 45.2328357,32.330178 45.58,32.083 L53.392,26.523 C55.0192795,25.3702451 55.9904167,23.5031892 56,21.509 L56,9.677 C56.000591,9.27883898 55.7649212,8.91826415 55.4,8.759 L45.4,4.439 C45.1472508,4.33000068 44.8607492,4.33000068 44.608,4.439 L34.608,8.759 C34.2430788,8.91826415 34.007409,9.27883898 34.008,9.677 L34.008,21.509 C34.0158969,23.5014219 34.9839074,25.3678205 36.608,26.522 Z M36,10.334 L45,6.446 L54,10.334 L54,21.509 C53.9910962,22.8566812 53.3323369,24.117224 52.231,24.894 L45,30.042 L37.769,24.894 C36.6675346,24.1173365 36.0087381,22.8567225 36,21.509 L36,10.334 Z"/><path d="M42.4,23.8 C42.8320438,24.1242308 43.4434866,24.0467489 43.781,23.625 L51.781,13.625 C52.1217114,13.1934254 52.0500699,12.5677379 51.6206245,12.2243466 C51.1911792,11.8809554 50.5650579,11.9487006 50.219,12.376 L42.819,21.619 L39.6,19.2 C39.3141875,18.9856406 38.9357266,18.9400436 38.6071797,19.0803848 C38.2786328,19.2207259 38.0499141,19.5256842 38.0071797,19.8803848 C37.9644453,20.2350853 38.1141875,20.5856406 38.4,20.8 L42.4,23.8 Z"/><path d="M5,60 L55,60 C57.7600532,59.9966939 59.9966939,57.7600532 60,55 L60,51 C60,50.4477153 59.5522847,50 59,50 L57,50 L57,28.669 C58.9092563,26.7741494 59.98827,24.1989035 60,21.509 L60,7.047 C60.000591,6.64883898 59.7649212,6.28826415 59.4,6.129 L45.4,0.082 C45.1474495,-0.0279576698 44.8605505,-0.0279576698 44.608,0.082 L30.608,6.129 C30.2430788,6.28826415 30.007409,6.64883898 30.008,7.047 L30.008,12 L6,12 C4.34314575,12 3,13.3431458 3,15 L3,50 L1,50 C0.44771525,50 6.76353751e-17,50.4477153 0,51 L0,55 C0.00330611633,57.7600532 2.23994685,59.9966939 5,60 Z M40,50 L9,50 L9,18 L30,18 L30,21.509 C30.0104682,24.797038 31.6077945,27.8777289 34.289,29.781 L43.965,36.669 C44.5844619,37.1102315 45.4155381,37.1102315 46.035,36.669 L51,33.135 L51,50 L40,50 Z M37.383,54 L31,54 L31,52 L38.382,52 L37.382,54 L37.383,54 Z M22.618,54 L21.618,52 L29,52 L29,54 L22.618,54 Z M53,31.711 L55,30.287 L55,50 L53,50 L53,31.711 Z M32,7.705 L45,2.089 L58,7.705 L58,21.505 C57.9926625,23.8066487 57.0139816,25.9982404 55.305,27.54 L55.29,27.552 C55.0554562,27.7660987 54.8087098,27.9664341 54.551,28.152 L45,34.951 L35.449,28.151 C33.294533,26.6235813 32.010049,24.1499534 32,21.509 L32,7.705 Z M5,15 C5,14.4477153 5.44771525,14 6,14 L30,14 L30,16 L9,16 C7.8954305,16 7,16.8954305 7,18 L7,50 L5,50 L5,15 Z M4,52 L19.382,52 L20.829,54.894 C21.165329,55.5739318 21.8594388,56.0030461 22.618,56 L37.382,56 C38.1391514,56.0039364 38.8328012,55.5774329 39.171,54.9 L40.618,52 L58,52 L58,54 L51,54 C50.4477153,54 50,54.4477153 50,55 C50,55.5522847 50.4477153,56 51,56 L57.816,56 C57.3937454,57.1943509 56.2667854,57.9947486 55,58 L5,58 C3.73321457,57.9947486 2.60625455,57.1943509 2.184,56 L9,56 C9.55228475,56 10,55.5522847 10,55 C10,54.4477153 9.55228475,54 9,54 L2,54 L2,52 L4,52 Z"/><path d="M13,56 L15,56 C15.5522847,56 16,55.5522847 16,55 C16,54.4477153 15.5522847,54 15,54 L13,54 C12.4477153,54 12,54.4477153 12,55 C12,55.5522847 12.4477153,56 13,56 Z"/><path d="M45,56 L47,56 C47.5522847,56 48,55.5522847 48,55 C48,54.4477153 47.5522847,54 47,54 L45,54 C44.4477153,54 44,54.4477153 44,55 C44,55.5522847 44.4477153,56 45,56 Z" /><path d="M12.707,24.707 L15.707,21.707 C16.0859722,21.3146211 16.0805524,20.6909152 15.6948186,20.3051814 C15.3090848,19.9194476 14.6853789,19.9140278 14.293,20.293 L11.293,23.293 C11.0330434,23.5440745 10.9287874,23.9158779 11.0203028,24.2655073 C11.1118183,24.6151368 11.3848632,24.8881817 11.7344927,24.9796972 C12.0841221,25.0712126 12.4559255,24.9669566 12.707,24.707 Z" /><path d="M13.707,30.707 L21.707,22.707 C22.0859722,22.3146211 22.0805524,21.6909152 21.6948186,21.3051814 C21.3090848,20.9194476 20.6853789,20.9140278 20.293,21.293 L12.293,29.293 C12.0330434,29.5440745 11.9287874,29.9158779 12.0203028,30.2655073 C12.1118183,30.6151368 12.3848632,30.8881817 12.7344927,30.9796972 C13.0841221,31.0712126 13.4559255,30.9669566 13.707,30.707 Z"/><path d="M26.293,22.293 L13.293,35.293 C13.0330434,35.5440745 12.9287874,35.9158779 13.0203028,36.2655073 C13.1118183,36.6151368 13.3848632,36.8881817 13.7344927,36.9796972 C14.0841221,37.0712126 14.4559255,36.9669566 14.707,36.707 L27.707,23.707 C28.0859722,23.3146211 28.0805524,22.6909152 27.6948186,22.3051814 C27.3090848,21.9194476 26.6853789,21.9140278 26.293,22.293 Z"/></g></g></svg>
                    </div>
                    <div class="col-sm-12">
                        <h1 class="mb-4">Thank You For Submitting</h1>
                        <h6 class="mb-2 text-light">Thank you for submitting, your job has been published. if you need help please contact us via </h6>
                        <h6 class="mb-0 text-light">Email support@jobber.com</h6>
                    </div>
                    <div class="col-12 text-center mt-4 mt-sm-5">
                        <a class="btn btn-outline-primary mb-3 mb-sm-0" href="#">Manage Jobs</a>
                        <a class="btn btn-outline-primary mb-3 mb-sm-0" href="#">View Job</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<!--=================================
feature-info-->

<!--=================================
feature-info-->
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
