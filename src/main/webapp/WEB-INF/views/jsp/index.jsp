<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
  .okky-jobs-card-custom {
    position: relative;
    background-size: cover;
    color: white;
    text-align: center;
    border-radius: 20px;
    overflow: hidden;
    height: 443px;
    padding-top: 25px;
  }
  .okky-jobs-card-custom-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    z-index: 1;
  }
  .okky-jobs-card-custom-content {
    position: relative;
    z-index: 2;
    padding: 20px;
  }

  .btn-custom {
    width: 215px;
    height: 215px;
    border-radius: 20px;

    display: flex;
    align-content: center;
    justify-content: center;
    align-items: center;
    flex-direction: column;

  }

  .border-box {
    position: relative;
    border: 2px solid #8a2be2;
    border-radius: 10px;
    padding: 20px;
    text-align: center;
    margin-bottom: 20px;
    background-color: #fff; /* 배경색을 흰색으로 설정 */
  }
  .border-box::after {
    content: '';
    position: absolute;
    bottom: -10px; /* 말꼬리가 박스에 더 가까이 오도록 조정 */
    left: 75%;
    transform: translateX(-50%) rotate(315deg);
    width: 17px; /* 말꼬리 크기 조정 */
    height: 17px;
    background: #fff;
    border-left: 2px solid #8a2be2;
    border-bottom: 2px solid #8a2be2;
    z-index: 1; /* 말꼬리를 상위 요소로 설정 */
  }

  .p-custom {
    font-weight: 700;
    font-size: 2.25rem;
  }

</style>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const personalMembers = new CountUp('personal-members', 168796);
    const companyMembers = new CountUp('company-members', 3329);
    const totalPositions = new CountUp('total-positions', 7452);

    personalMembers.start();
    companyMembers.start();
    totalPositions.start();
  });
</script>

<section>
  <div class="container okky-jobs">
    <div class="px-lg-5 p-4 rounded-3 mb-4">
      <div class="row align-items-center">
        <div class="col-lg-9">
          <div class="px-md-5 px-4 pt-5 pt-lg-0">
            <div class="section-title">
              <h2 class="title">Browse Hundreds of Jobs</h2>
              <p class="lead">We are efficiently delivering tons of jobs straight to your pocket.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 mt-4 mt-md-5 text-center">
          <img class="img-fluid" src="images/hero.svg" alt="">
        </div>
      </div>
    </div>

    <div class="bg-dark p-4 rounded-3 mb-4 text-center">
      <div class="row">
        <div class="col-lg-4 col-sm-6">
          <div class="counter my-4 justify-content-center">
            <div class="counter-icon">
              <i class="flaticon-users"></i>
            </div>
            <div class="counter-content">
              <span class="timer mb-1 text-white" id="personal-members">0</span>
              <label class="mb-0 text-white">가입 개인회원 수</label>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-sm-6">
          <div class="counter my-4 justify-content-center">
            <div class="counter-icon">
              <i class="flaticon-resume"></i>
            </div>
            <div class="counter-content">
              <span class="timer mb-1 text-white" id="company-members">0</span>
              <label class="mb-0 text-white">가입 기업회원 수</label>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-sm-6">
          <div class="counter my-4 justify-content-center">
            <div class="counter-icon">
              <i class="flaticon-suitcase"></i>
            </div>
            <div class="counter-content">
              <span class="timer mb-1 text-white" id="total-positions">0</span>
              <label class="mb-0 text-white">최근 1년간 누적 구인구직 수</label>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="border-box">
      <h2 class="text-primary fw-bold">OKKY Talent</h2>
      <h3>지금 여기에서 멋진 만남이 시작됩니다.</h3>
      <p class="text-muted">"OKKY Talent를 통해 새로운 기회를 만들어보세요!"</p>
    </div>
  </div>
</section>

<section class="p-4 mb-4">
  <div class="container">
    <div class="row">
      <div class="browse-job d-flex">
        <h3 class="mb-3">Browse Listing </h3>
        <div class="justify-content-center flex-fill">
          <ul class="nav nav-tabs nav-tabs-02 justify-content-center d-flex mb-3 mb-md-0" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="Hot-tab" data-bs-toggle="tab" href="#Hot" role="tab" aria-controls="Hot" aria-selected="true">Hot Jobs</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="Recent-tab" data-bs-toggle="tab" href="#Recent" role="tab" aria-controls="Recent" aria-selected="false">Recent Jobs</a>
            </li>
          </ul>
        </div>
      </div>
        <div class="tab-content " id="myTabContent">
          <!-- Hot jobs -->
          <div class="tab-pane fade active show" id="Hot" role="tabpanel" aria-labelledby="Hot-tab">
            <div class="row">
              <c:forEach var="hotJob" items="${likeListUp}">
                <div class="col-lg-12 mb-4 mb-sm-0" data-job-id="${hotJob.jobId}">
                  <div class="job-list">
                    <div class="job-list-logo">
                      <c:choose>
                        <c:when test="${hotJob.fileId == 0}">
                          <img class="img-fluid" src="/images/svg/07.svg" alt="">
                        </c:when>
                        <c:otherwise>
                          <img class="img-fluid" src="/business/uploadedFileGet/${hotJob.fileId}" alt="">
                        </c:otherwise>
                      </c:choose>
                    </div>
                    <div class="job-list-details">
                      <div class="job-list-info">
                        <div class="job-list-title">
                          <input type="hidden" id="jobPostId" name="jobPostId" value="${hotJob.jobId}">
                          <h5 class="mb-0"><a href="/business/jobPostDetail?jobId= + ${hotJob.jobId}">${hotJob.title}</a></h5>
                        </div>
                        <div class="job-list-option">
                          <ul class="list-unstyled">
                            <li><a href="#"><i class="fas fa-filter pe-1"></i>${hotJob.jobTypeCodeName}</a></li>class="fas fa-suitcase pe-1"></i>${hotJob.salaryTypeCodeName}:${hotJob.salary}</a>
                            </li>
                          </ul>
                          <ul class="list-unstyled">
                            <li><i class="fas fa-map-marker-alt pe-1"></i>${hotJob.address}</li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="job-list-favourite-time">
                      <span class="job-list-time order-1">
                        <i class="far fa-clock pe-1"></i>${hotJob.systemRegisterDatetime}
                      </span>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <!-- Recent jobs -->
          <div class="tab-pane fade " id="Recent" role="tabpanel" aria-labelledby="Recent-tab">
            <div class="row">
              <c:forEach var="recentJob" items="${recentListUp}">
                <div class="col-lg-12 mb-4 mb-sm-0" data-job-id="${recentJob.jobId}">
                  <div class="job-list">
                    <div class="job-list-logo">
                      <c:choose>
                        <c:when test="${recentJob.fileId == 0}">
                          <img class="img-fluid" src="/images/svg/07.svg" alt="">
                        </c:when>
                        <c:otherwise>
                          <img class="img-fluid" src="/business/uploadedFileGet/${recentJob.fileId}" alt="">
                        </c:otherwise>
                      </c:choose>
                    </div>
                    <div class="job-list-details">
                      <div class="job-list-info">
                        <div class="job-list-title">
                          <h5 class="mb-0"><a href="/business/jobPostDetail?jobId= + ${recentJob.jobId}">${recentJob.title}</a></h5>
                        </div>
                        <div class="job-list-option">
                          <ul class="list-unstyled">
                            <li><a href="#"><i class="fas fa-filter pe-1"></i>${recentJob.jobTypeCodeName}</a></li>
                            <li><a class="freelance"><i
                                    class="fas fa-suitcase pe-1"></i>${recentJob.salaryTypeCodeName}:${recentJob.salary}</a>
                            </li>
                          </ul>
                          <ul class="list-unstyled">
                            <li><i class="fas fa-map-marker-alt pe-1"></i>${recentJob.address}</li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="job-list-favourite-time">
                      <span class="job-list-time order-1">
                        <i class="far fa-clock pe-1"></i>${recentJob.systemRegisterDatetime}
                      </span>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <!-- Popular jobs -->
        </div>
        <div class="col-12 justify-content-center d-flex mt-md-5 mt-4">
          <a class="btn btn-outline btn-lg" href="/business/postJobList">더 많은 공고 보기</a>
        </div>

    </div>
  </div>
</section>