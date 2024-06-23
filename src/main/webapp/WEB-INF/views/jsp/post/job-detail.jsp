<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afcb905c7668725d0a22469ede432941"></script>
<script>
  const application = {
    init: function () {

    },

    apply: function () {

      const jobId = $("#jobId").val();

      const motivationDescription = $("#motivationDescription").val();

      let jsonData = {};
      jsonData["jobId"] = jobId;
      jsonData["motivationDescription"] = motivationDescription;

      console.log("jsonData: " + JSON.stringify(jsonData));

      $.ajax({
        url: "/business/apply", // Spring 컨트롤러 URL
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
        success: function (data) {
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드

          const modalPopup = new bootstrap.Modal(document.getElementById('commonModal'), {
            keyboard: false
          });

          $('#modalBody').text(data.message);
          modalPopup.show();

          switch(data.code) {
            case 'loginError':
              $('#confirmBtn').off('click').on('click', function() {
                location.href = '/user/login';
              });
              break;
            case 'profileError':
              $('#confirmBtn').off('click').on('click', function() {
                location.href = '/personal/myProfile';
              });
              break;
            case 'applyError':
            case 'success':
              $('#exampleModalCenter').modal('hide');
              $('#confirmBtn').off('click').on('click', function() {
                modalPopup.hide();
              });
              break;
          }
        },
        error: function (xhr, status, error) {
          // 오류 발생 시 실행할 코드
          console.error(error);
        }
      });
    },

    cancel: function () {

      const jobId = $("#jobId").val();

      // 해당 값을 JSON 데이터로 변환
      // const jsonData = {"jobId": jobIdInt};
      const jsonData = jobId;
      console.log("jsonData: " + JSON.stringify(jsonData));

      $.ajax({
        url: "/business/applyCancel", // Spring 컨트롤러 URL
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
        success: function (data) {
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
          console.log(JSON.stringify(data));
          if (data.code === 'success') {
            alert(data.message);
            location.reload();
          } else if (data.code === 'error') {
            alert(data.message);
            location.reload();
          } else if (data.code === 'loginError') {
            alert(data.message);
            location.href = '/user/login'
          }
        },
        error: function (xhr, status, error) {
          // 오류 발생 시 실행할 코드
          console.error(error);
        }
      });
    },

    like: function () {

      const jobId = $("#jobId").val();

      $.ajax({
        url: "/business/like/"+jobId, // Spring 컨트롤러 URL
        type: 'POST',
        contentType: 'application/json',
        data: '',
        success: function (data) {
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
          if (data.code === 'success') {
            $('#likeIcon').removeClass().addClass(data.like === 1 ? 'fas fa-heart' : 'far fa-heart');

          } else if (data.code === 'error') {
            alert(data.message);
            location.href = '/user/login';
          }
        },
        error: function (xhr, status, error) {
          // 오류 발생 시 실행할 코드
          console.error(error);
        }
      });
    }
  }

  // DOM 실행 후 안의 내용이 실행 됨

  document.addEventListener('DOMContentLoaded', function () {

    $('#exampleModalCenter').on('hidden.bs.modal', function () { //hidden.bs.modal 팝이 완전 닫치고난다음 실행
      $('#motivationDescription').val("");
    });

    $('#button_apply').click(function () {
      application.apply();
    });

    $('#button_applyCancel').click(function () {
      application.cancel(); <!-- 고칠 부분 -->
    });

    $('#like').click(function () {
      application.like();
    })



    const latitude = $('#latitude').val(); //위도
    const longitude = $('#longitude').val(); //경도
    console.log("위도, 경도 "+latitude +"/"+longitude);
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
              center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
            };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(latitude, longitude);

// 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      position: markerPosition
    });

// 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);


  });



</script>
<!-- Button trigger modal 일단 대기 갑자기 생김-->
<%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
<%--  Open Modal--%>
<%--</button>--%>

<!--=================================
banner -->
<section class="header-inner header-inner-big bg-holder text-white" style="background-image: url(/images/bg/banner-01.jpg);">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="job-search-field">
          <div class="job-search-item">
            <form class="form row">
              <div class="col-lg-5">
                <div class="form-group left-icon mb-3">
                  <input type="text" class="form-control" name="job_title" placeholder="What?">
                <i class="fas fa-search"></i> </div>
              </div>
              <div class="col-lg-5">
                <div class="form-group left-icon mb-3">
                  <input type="text" class="form-control" name="job_title" placeholder="Where?">
                <i class="fas fa-search"></i> </div>
              </div>
              <div class="col-lg-2 col-sm-12">
                <div class="form-group form-action">
                  <button type="submit" class="btn btn-primary mt-0"><i class="fas fa-search-location"></i> Find Job</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--=================================
banner -->

<!--=================================
job list -->
<section class="space-ptb">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <form class="col-md-12" id="updateForm" name="updateForm">
          <h2 class="mb-4">${detail.title}</h2>
          <div class="row">
            <div class="col-md-12">
              <div class="job-list border">
                <div class=" job-list-logo">
                  <img class="img-fluid" src="/business/uploadedFileGet/${detail.fileId}" alt="">
                </div>
                <div class="job-list-details">
                  <div class="job-list-info">
                    <div class="job-list-title">
                      <input type="hidden" id="jobId" name="jobId" value="${detail.jobId}">
                      <input type="hidden" id="statusTypeCode" name="statusTypeCode" value="${detail.statusTypeCode}">
                      <h5 class="mb-0">${detail.companyName}</h5>
                    </div>
                    <div class="job-list-option">
                      <ul class="list-unstyled">
                        <li><i class="fas fa-map-marker-alt pe-1"></i>${detail.address}</li>
                        <li><i class="fas fa-phone fa-flip-horizontal fa-fw"></i><span class="ps-2">${detail.managerNumber}</span></li>
                        <input type="hidden" class="form-control" id="latitude" name="latitude" data-name="위도" value="${detail.latitude}">
                        <input type="hidden" class="form-control" id="longitude" name="longitude" data-name="경도" value="${detail.longitude}">
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="job-list-favourite-time">
                  <a class="job-list-favourite order-2" id="like" href="#"><i id='likeIcon' class="${like == '1' ? 'fas fa-heart text-danger' : 'far fa-heart'}"></i></a>
                  <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>${detail.systemRegisterDatetime}</span>
                </div>
              </div>
            </div>
          </div>
          <div class="border p-4 mt-4 mt-lg-5">
            <div class="row">
              <h5 class="mb-4">모집조건</h5>
              <div class="col-md-6 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-users"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">모집직종</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.jobTypeCodeName}</span>
                  </div>
                </div>
              </div>
              <c:if test="${detail.requirement}!= 'null'">
              <div class="col-md-6 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-tick"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">우대조건</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.requirement}</span>
                  </div>
                </div>
              </div>
              </c:if>
              <div class="col-md-6 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-users"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">모집인원</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.numberOfStaff}</span>
                  </div>
                </div>
              </div>
              <c:if test="${detail.requirement}!= 'null'">
                <div class="col-md-6 col-sm-6 mb-4">
                  <div class="d-flex">
                    <i class="font-xll text-primary align-self-center flaticon-tick"></i>
                    <div class="feature-info-content ps-3">
                      <label class="mb-1">기타사항</label>
                      <span class="mb-0 fw-bold d-block text-dark">${detail.etc}</span>
                    </div>
                  </div>
                </div>
              </c:if>
            </div>
            <hr>
            <div class="row">
              <h5 class="mb-4">근무조건</h5>

              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-hand-shake"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">근무유형</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.employmentTypeCodeName}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-hand-shake"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">근무요일</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.jobDayTypeCodeName}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-hand-shake"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">근무시간</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.jobTime}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-money"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">급여타입</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.salaryTypeCodeName}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-money"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">금액</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.salary}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="border p-4 mt-4 mt-lg-5">
            <div class="my-4 my-lg-2">
              <h5 class="mb-3 mb-md-4">${detail.title}</h5>
              <p>${detail.description}</p>
            </div>
          </div>
          <div class="border p-4 mt-4 mt-lg-5">
            <div class="company-address widget-box">
              <div class="company-address-map" id="map" style="width: 100%; height: 400px;"></div>
              <ul class="list-unstyled mt-3">
                <li><a href="tel:+905389635487"><i class="fas fa-phone fa-flip-horizontal fa-fw"></i><span class="ps-2">${detail.officePhone}</span></a></li>
                <li><a href="mailto:ali.potenza@job.com"><i class="fas fa-envelope fa-fw"></i><span class="ps-2">${detail.email}</span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-12 text-center mt-4 mt-sm-5">
            <a class="btn btn-outline-primary mb-3 mb-sm-0"  onclick="location.href='/business/list'">공고목록</a>
          <c:if test="${sessionScope.userNo eq detail.userNo}">
            <a class="btn btn-outline-primary mb-3 mb-sm-0" onclick="location.href='/business/update?jobId=${detail.jobId}'" id="button_update" name="button_update">수정하기</a>
            <a class="btn btn-outline-primary mb-3 mb-sm-0"  onclick="location.href='/business/delete?jobId=${detail.jobId}'" id="button_delete" name="button_delete">삭제하기</a>
          </c:if>
          </div>
        </form>
      </div>
      <!--=================================
      sidebar -->
      <div class="col-lg-6">
        <c:if test="${sessionScope.userTypeCode == 10 }">
          <div class="sidebar mb-0">
            <c:if test="${detail.statusTypeCode == 'OPEN'}">
            <a class="btn btn-primary" href="#" data-bs-toggle="modal" data-bs-target="#exampleModalCenter"><i class="far fa-paper-plane"></i>지원하기</a>
<%--              <c:if test="${detail.jaiStatusTypeCode == 'APPLIED'}">--%>
            <a class="btn btn-primary" href="#" id="button_applyCancel" name="button_applyCancel"><i class="far fa-paper-plane"></i>지원취소하기</a>
<%--              </c:if>--%>
            </c:if>
          </div>
        </c:if>
      </div>
      <!--=================================
      sidebar -->
    </div>
  </div>
</section>
<!--=================================
job list -->

<!--=================================
feature -->
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
feature -->


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