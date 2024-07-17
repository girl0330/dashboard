<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

  .nav-link {
    font-size: 1.3em; /* 원하는 글자 크기로 조정하세요 */
  }

</style>


<!--=================================
Jobs-listing -->
<section class="space-ptb">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="section-title">
          <h2 class="title">알바자리 한 눈에 보기!</h2>
        </div>
      </div>
      <div class="col-12 user-dashboard-info-box ">
        <div class="browse-job d-flex border-0 pb-3">
          <div class="mb-4 mb-md-0">
            <ul class="nav nav-tabs justify-content-center d-flex" id="myTab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Hot Jobs</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Recent Jobs</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="tab-content " id="myTabContent">
          <!-- Hot jobs -->
          <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <div class="row mt-3">
              <c:forEach var="hotJob" items="${likeListUp}">
                <div class="col-lg-6 mb-4 mb-sm-0" data-job-id="${hotJob.jobId}">
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
                            <li><a href="#"><i class="fas fa-filter pe-1"></i>${hotJob.jobTypeCodeName}</a></li>
                            <li><a class="freelance"><i
                                    class="fas fa-suitcase pe-1"></i>${hotJob.salaryTypeCodeName}:${hotJob.salary}</a>
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
          <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <div class="row mt-4">
              <c:forEach var="recentJob" items="${recentListUp}">
                <div class="col-lg-6 mb-4 mb-sm-0" data-job-id="${recentJob.jobId}">
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
                          <h5 class="mb-0"><a
                                  href="/business/jobPostDetail?jobId= + ${recentJob.jobId}">${recentJob.title}</a></h5>
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
  </div>
</section>
<!--=================================
Jobs-listing -->


