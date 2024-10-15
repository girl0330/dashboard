<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afcb905c7668725d0a22469ede432941"></script>
<script>
  const application = {
    checkDuplicateApply: function () {
      let jsonData = {};
      jsonData["jobId"] = $("#jobId").val();
      console.log("? :: "+JSON.stringify(jsonData))
      const options = {
        url: "/business/ajax/checkDuplicateApply", // Spring 컨트롤러 URL
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(jsonData),

        done: (response) => {
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
          if (response.code === 200) {
            $("#exampleModalCenter").modal('show');
          }

        },
        fail: function (jqXHR) {
          const jsonObj = JSON.parse(jqXHR.responseText);
          alert(jsonObj.userMessage);
          $(".modal-content").hide();
          location.href = '/personal/myProfile';
        }
      };

      ajax.call(options);

    },

    apply: function () {

      let jsonData = {};
      jsonData["jobId"] = $("#jobId").val();
      jsonData["motivationDescription"] = $("#motivationDescription").val();

      const options = {
        url: "/business/ajax/apply", // Spring 컨트롤러 URL
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(jsonData),

        done: (response) => {
          console.log(response);
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
          if (response.code === 200) {
            alert(response.message);
            location.reload();
          }
        },
        fail: function (jqXHR) {
          const jsonObj = JSON.parse(jqXHR.responseText);
          alert(jsonObj.userMessage);
          $(".modal-content").hide();
        }
      };
      ajax.call(options);
    },

    cancel: function () {
      const jobId = $("#jobId").val();

      // 해당 값을 JSON 데이터로 변환
      // const jsonData = {"jobId": jobIdInt};
      const jsonData = jobId;
      console.log("jsonData: " + JSON.stringify(jsonData));

      const options = {
        url: '/business/ajax/applyCancel',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(jsonData),

        done: (response) => {
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
          console.log(JSON.stringify(response));
          if (response.code === 200) {
            alert(response.message);
            location.reload();
          }
        },
        fail: function (jqXHR) {
          const jsonObj = JSON.parse(jqXHR.responseText);
          alert(jsonObj.userMessage);
          $(".modal-content").hide();
        }
      };
      ajax.call(options);
    },


    like: function () {
      const jobId = $("#jobId").val();

      const options = {
        url: "/business/ajax/like/"+jobId,
        type: 'POST',
        contentType: 'application/json',
        data: '',

        done: function (response) {
          // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
          console.log(response);
          if (response.code === 200) {
            $('#likeIcon').removeClass().addClass(response.data === 1 ? 'fas fa-heart' : 'far fa-heart');

          } else if (response.code === 'error') {
            alert(response.message);
            location.href = '/user/login';
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

  // DOM 실행 후 안의 내용이 실행 됨

  document.addEventListener('DOMContentLoaded', function () {

    $('#exampleModalCenter').on('hidden.bs.modal', function () { //hidden.bs.modal 팝이 완전 닫치고난다음 실행
      $('#motivationDescription').val("");
    });

    $('#check_duplicate_button').click(function () {
      application.checkDuplicateApply();
    });

    $('#button_apply').click(function () {
      application.apply();
      $(".modal-content").hide();
    });

    $('#button_applyCancel').click(function () {
      application.cancel();
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

<!--=================================
banner -->
<section class="header-inner bg-light">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="job-search-field">
          <div class="job-search-item">
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
          <h2 class="mb-4">${jobPostDetail.title}</h2>
          <div class="row">
            <div class="col-md-12">
              <div class="job-list border">
                <div class=" job-list-logo">
                  <img class="img-fluid" src="/business/uploadedFileGet/${jobPostDetail.fileId}" alt="">
                </div>
                <div class="job-list-details">
                  <div class="job-list-info">
                    <div class="job-list-title">
                      <input type="hidden" id="jobId" name="jobId" value="${jobPostDetail.jobId}">
                      <input type="hidden" id="statusTypeCode" name="statusTypeCode" value="${jobPostDetail.statusTypeCode}">
                      <h5 class="mb-0">${jobPostDetail.companyName}</h5>
                    </div>
                    <div class="job-list-option">
                      <ul class="list-unstyled">
                        <li><i class="fas fa-map-marker-alt pe-1"></i>${jobPostDetail.address}</li>
                        <li><i class="fas fa-phone fa-flip-horizontal fa-fw"></i><span class="ps-2">${jobPostDetail.managerNumber}</span></li>
                        <input type="hidden" class="form-control" id="latitude" name="latitude" data-name="위도" value="${jobPostDetail.latitude}">
                        <input type="hidden" class="form-control" id="longitude" name="longitude" data-name="경도" value="${jobPostDetail.longitude}">
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="job-list-favourite-time">
                  <c:if test="${sessionScope.userTypeCode == 10}">
                  <a class="job-list-favourite order-2" id="like" href="#"><i id='likeIcon' class="${like == '1' ? 'fas fa-heart text-danger' : 'far fa-heart'}"></i></a>
                  </c:if>
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
                    <span class="mb-0 fw-bold d-block text-dark">${jobPostDetail.jobTypeCodeName}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-users"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">모집인원</label>
                    <span class="mb-0 fw-bold d-block text-dark">${jobPostDetail.numberOfStaff} 명</span>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-tick"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">우대조건</label>
                    <span class="mb-0 fw-bold d-block text-dark">${jobPostDetail.requirement}</span>
                  </div>
                </div>
              </div>
                <div class="col-md-6 col-sm-6 mb-4">
                  <div class="d-flex">
                    <i class="font-xll text-primary align-self-center flaticon-tick"></i>
                    <div class="feature-info-content ps-3">
                      <label class="mb-1">기타사항</label>
                      <span class="mb-0 fw-bold d-block text-dark">${jobPostDetail.etc}</span>
                    </div>
                  </div>
                </div>
            </div>
            <hr>
            <div class="row">
              <h5 class="mb-4">근무조건</h5>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-hand-shake"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">근무유형</label>
                    <span class="mb-0 fw-bold d-block text-dark">${jobPostDetail.employmentTypeCodeName}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-hand-shake"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">근무요일</label>
                    <span class="mb-0 fw-bold d-block text-dark">${jobPostDetail.jobDayTypeCodeName}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-hand-shake"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">근무시간</label>
                    <span class="mb-0 fw-bold d-block text-dark">${jobPostDetail.jobTime} 시간</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-money"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">급여타입</label>
                    <span class="mb-0 fw-bold d-block text-dark">${jobPostDetail.salaryTypeCodeName}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-money"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">금액</label>
                    <span class="mb-0 fw-bold d-block text-dark">${jobPostDetail.salary} 원</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="border p-4 mt-4 mt-lg-5">
            <h5 class="mb-4">모집내용</h5>
            <div class="my-4 my-lg-2">
              <h5 class="mb-3 mb-md-4"></h5>
              <p>${jobPostDetail.description}</p>
            </div>
          </div>
          <div class="border p-4 mt-4 mt-lg-5">
            <h5 class="mb-4">근무지 위치</h5>
            <div class="company-address widget-box">
              <div class="company-address-map" id="map" style="width: 100%; height: 400px;"></div>
              <ul class="list-unstyled mt-3">
                <li><a href="tel:+905389635487"><i class="fas fa-phone fa-flip-horizontal fa-fw"></i><span class="ps-2">${jobPostDetail.managerNumber}</span></a></li>
                <li><a href="mailto:ali.potenza@job.com"><i class="fas fa-envelope fa-fw"></i><span class="ps-2">${jobPostDetail.email}</span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-12 text-center mt-4 mt-sm-5">
            <a class="btn btn-outline-primary mb-3 mb-sm-0"  onclick="location.href='/business/postJobList'">공고목록</a>
          <c:if test="${sessionScope.userNo eq jobPostDetail.userNo}">
            <a class="btn btn-outline-primary mb-3 mb-sm-0" onclick="location.href='/business/updateJobPost?jobId=${jobPostDetail.jobId}'" id="button_update" name="button_update">수정하기</a>
            <a class="btn btn-outline-primary mb-3 mb-sm-0"  onclick="location.href='/business/deleteJobPost?jobId=${jobPostDetail.jobId}'" id="button_delete" name="button_delete">삭제하기</a>
          </c:if>
          </div>
        </form>
      </div>
      <!--=================================
      sidebar -->
      <div class="col-lg-6">
        <c:if test="${jobPostDetail.statusTypeCode == 'OPEN' && sessionScope.userNo != null && userTypeCode == 10}" >
          <c:choose>
            <c:when test="${userStatusCode == 0}">
              <a class="btn btn-primary" href="#" id="check_duplicate_button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter"><i class="far fa-paper-plane"></i>지원하기</a>
            </c:when>
            <c:otherwise>
              <a class="btn btn-primary" href="#" id="button_applyCancel" name="button_applyCancel"><i class="far fa-paper-plane"></i>지원취소하기</a>
            </c:otherwise>
          </c:choose>
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
      <div class="modal-content" id="modal-content">
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