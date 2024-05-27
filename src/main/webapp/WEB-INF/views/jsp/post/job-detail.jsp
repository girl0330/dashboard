<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
  // let update = {
  //   init : function (jobPostId) {
  //     alert("id"+jobPostId );
  //     this.update(jobPostId);
  //   },
  //   update : function () {
  //
  //     const url = "/business/updateView";
  //     window.location.href = url;
  //   }
  // }
// function goToUpdate(jobPostId) {
//   alert("id"+jobPostId )
//   const url = "/business/updateView";
//   window.location.href =url;
// }
  //DOM 실행 후 안의 내용이 실행 됨

  // document.addEventListener('DOMContentLoaded', function () {
  //   $('#button_update').click(function() {
  //     update.init();
  //   });
  // });

</script>

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
      <div class="col-lg-8">
        <form class="col-md-12" id="updateForm" name="updateForm">
          <div class="row">
            <div class="col-md-12">
              <div class="job-list border">
                <div class=" job-list-logo">
                  <img class="img-fluid" src="/images/svg/10.svg" alt="">
                </div>
                <div class="job-list-details">
                  <div class="job-list-info">
                    <div class="job-list-title">
                      <h5 class="mb-0">회사 이름</h5>
                    </div>
                    <div class="job-list-option">
                      <ul class="list-unstyled">
                        <li><i class="fas fa-map-marker-alt pe-1"></i>${detail.address}</li>
                        <li><i class="fas fa-phone fa-flip-horizontal fa-fw"></i><span class="ps-2">${detail.managerNumber}</span></li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="job-list-favourite-time">
                  <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                  <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>마감날</span>
                </div>
              </div>
            </div>
          </div>
          <div class="border p-4 mt-4 mt-lg-5">
            <div class="row">
              <h5 class="mb-4">모집조건</h5>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">모집직종</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.jobTypeCode}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">모집인원</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.numberOfStaff}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">우대조건</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.requirement}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">우대조건</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.requirement}</span>
                  </div>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <h5 class="mb-4">근무조건</h5>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">급여타입</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.salaryTypeCode}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">금액</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.salary}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">근무유형</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.employmentTypeCode}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">근무요일</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.jobDayTypeCode}</span>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 mb-4">
                <div class="d-flex">
                  <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                  <div class="feature-info-content ps-3">
                    <label class="mb-1">근무시간</label>
                    <span class="mb-0 fw-bold d-block text-dark">${detail.jobTime}</span>
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
              <div class="company-address-map">
                <iframe src="/https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434509374!2d144.95373531590414!3d-37.817323442021134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d4c2b349649%3A0xb6899234e561db11!2sEnvato!5e0!3m2!1sen!2sin!4v1559039794237!5m2!1sen!2sin"  height="230" allowfullscreen></iframe>
              </div>
              <ul class="list-unstyled mt-3">
                <li><a href="#"><i class="fas fa-link fa-fw"></i><span class="ps-2">www.infojob.com</span></a></li>
                <li><a href="tel:+905389635487"><i class="fas fa-phone fa-flip-horizontal fa-fw"></i><span class="ps-2">+(456) 478-2589</span></a></li>
                <li><a href="mailto:ali.potenza@job.com"><i class="fas fa-envelope fa-fw"></i><span class="ps-2">support@jobber.demo</span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-12 text-center mt-4 mt-sm-5">
            <a class="btn btn-outline-primary mb-3 mb-sm-0" onclick="location.href='/business/update?jobId=${detail.jobId}'" id="button_update" name="button_update">수정하기</a>
            <a class="btn btn-outline-primary mb-3 mb-sm-0"  onclick="location.href='/business/delete?jobId=${detail.jobId}'" id="button_delete" name="button_delete">삭제하기</a>
          </div>
        </form>
      </div>
      <!--=================================
      sidebar -->
      <div class="col-lg-4">
        <div class="sidebar mb-0">
          <div class="widget d-grid">
            <a class="btn btn-primary" href="#"><i class="far fa-paper-plane"></i>Apply for job</a>
          </div>
          <div class="widget">
            <div class="company-detail-meta">
              <ul class="list-unstyled">
                <li class="linkedin"><a href="#"><i class="fab fa-linkedin-in"></i><span class="ps-2">Apply with Linkedin</span></a></li>
                <li><div class="share-box share-dark-bg">
                  <a href="#"> <i class="fas fa-share-alt"></i><span class="ps-2">Share</span></a>
                  <ul class="list-unstyled share-box-social">
                    <li> <a href="#"><i class="fab fa-facebook-f"></i></a> </li>
                    <li> <a href="#"><i class="fab fa-twitter"></i></a> </li>
                    <li> <a href="#"><i class="fab fa-linkedin"></i></a> </li>
                    <li> <a href="#"><i class="fab fa-instagram"></i></a> </li>
                    <li> <a href="#"><i class="fab fa-pinterest"></i></a> </li>
                  </ul>
                </div></li>
                <li><a href="#"><i class="fas fa-print"></i><span class="ps-2">Print</span></a></li>
              </ul>
            </div>
          </div>

          <div class="widget">
            <div class="jobber-company-view">
              <ul class="list-unstyled">
                <li>
                  <div class="widget-box">
                    <div class="d-flex">
                      <i class="flaticon-clock fa-2x fa-fw text-primary"></i>
                      <span class="ps-3">35 Days</span>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="widget-box">
                    <div class="d-flex">
                      <i class="flaticon-loupe fa-2x fa-fw text-primary"></i>
                      <span class="ps-3">35697 Displayed</span>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="widget-box">
                    <div class="d-flex">
                      <i class="flaticon-personal-profile fa-2x fa-fw text-primary"></i>
                      <span class="ps-3">300-500 Application</span>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <div class="widget">
            <div class="widget-title">
              <h5>Similar Jobs</h5>
            </div>
            <div class="similar-jobs-item widget-box">
              <div class="job-list">
                <div class="job-list-logo">
                  <img class="img-fluid" src="/images/svg/17.svg" alt="">
                </div>
                <div class="job-list-details">
                  <div class="job-list-info">
                    <div class="job-list-title">
                      <h6><a href="#">Designer Required</a></h6>
                    </div>
                    <div class="job-list-option">
                      <ul class="list-unstyled">
                        <li>
                          <span>via</span>
                          <a href="employer-detail.html">Trout Design Ltd</a>
                        </li>
                        <li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>Freelance</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="job-list">
                <div class="job-list-logo">
                  <img class="img-fluid" src="/images/svg/18.svg" alt="">
                </div>
                <div class="job-list-details">
                  <div class="job-list-info">
                    <div class="job-list-title">
                      <h6><a href="#">Post Room Operative</a></h6>
                    </div>
                    <div class="job-list-option">
                      <ul class="list-unstyled">
                        <li>
                          <span>via</span>
                          <a href="employer-detail.html">LawnHopper</a>
                        </li>
                        <li><a class="part-time" href="#"><i class="fas fa-suitcase pe-1"></i>Part-Time</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="job-list">
                <div class="job-list-logo">
                  <img class="img-fluid" src="/images/svg/19.svg" alt="">
                </div>
                <div class="job-list-details">
                  <div class="job-list-info">
                    <div class="job-list-title">
                      <h6><a href="#">Stockroom Assistant</a></h6>
                    </div>
                    <div class="job-list-option">
                      <ul class="list-unstyled">
                        <li>
                          <span>via</span>
                          <a href="employer-detail.html">Rippin LLC</a>
                        </li>
                        <li><a class="temporary" href="#"><i class="fas fa-suitcase pe-1"></i>Temporary</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="job-list">
                <div class="job-list-logo">
                  <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 726 726"><path fill="#4D4D4D" d="M332.45 400.625l22.501-81.37c.683-2.276 2.039-3.187 4.321-3.187h18.179c2.505 0 3.644.911 4.328 3.187l23.184 81.827 20.223-66.375h-10.908c-2.277 0-3.415-1.128-3.415-3.405v-11.83c0-2.494 1.138-3.405 3.415-3.405h29.084c3.871 0 5.464 2.959 4.553 6.137l-31.37 103.187c-.674 2.277-2.039 3.188-4.315 3.188h-20.453c-2.275 0-3.642-.911-4.325-3.405l-21.591-80.242-22.5 80.459c-.684 2.277-2.05 3.188-4.316 3.188h-20.461c-2.272 0-3.638-.911-4.316-3.188l-24.778-90.684h-11.814c-2.277 0-3.415-1.128-3.415-3.405v-11.83c0-2.494 1.138-3.405 3.415-3.405h29.772c2.271 0 3.638.911 4.326 3.405l20.676 81.153z"/><path fill="#24BAC9" d="M477.723 542.344c-28.339-15.399-46.472-42.319-51.937-71.734-36.432 21.135-82.665 23.536-122.342 1.946-29.927-16.218-67.384-5.133-83.644 24.798-16.26 29.922-5.169 67.356 24.757 83.648 91.365 49.616 200.396 35.634 276.19-26.724-14.976-.891-29.734-4.74-43.024-11.934z"/><path fill="#F03955" d="M554.54 205.553c-.89 14.78-4.927 29.342-12.213 42.735-14.903 27.499-41.036 46.314-71.745 51.945 21.185 36.43 23.575 82.673 2.018 122.313-16.26 29.921-5.165 67.396 24.747 83.678 29.933 16.239 67.398 5.143 83.649-24.777 49.597-91.254 35.665-200.092-26.456-275.894z"/><path fill="#59B89C" d="M183.66 477.732c14.965-27.51 41.058-46.295 71.761-51.967-21.161-36.421-23.567-82.622-2.013-122.345 16.239-29.911 5.169-67.356-24.758-83.595-29.942-16.28-67.383-5.185-83.643 24.736-49.618 91.254-35.655 200.175 26.517 275.957.879-14.584 4.75-29.186 12.136-42.786z"/><path fill="#F09502" d="M481.447 145.018C390.079 95.36 281.052 109.384 205.26 171.72c14.96.9 29.755 4.751 43.024 11.954 28.333 15.4 46.477 42.269 51.957 71.744 36.437-21.195 82.665-23.557 122.316-2.007 29.933 16.249 67.39 5.174 83.649-24.757 16.26-29.963 5.195-67.376-24.759-83.636z"/></svg>
                </div>
                <div class="job-list-details mb-0">
                  <div class="job-list-info">
                    <div class="job-list-title">
                      <h6><a href="#">Research Administrator</a></h6>
                    </div>
                    <div class="job-list-option">
                      <ul class="list-unstyled">
                        <li>
                          <span>via</span>
                          <a href="employer-detail.html">Trophy and Sons</a>
                        </li>
                        <li><a class="full-time" href="#"><i class="fas fa-suitcase pe-1"></i>Full time</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
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
Signin Modal Popup -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header p-4">
        <h4 class="mb-0 text-center">Login to Your Account</h4>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <div class="login-register">
          <fieldset>
            <legend class="px-2">Choose your Account Type</legend>
            <ul class="nav nav-tabs nav-tabs-border d-flex" role="tablist">
              <li class="nav-item me-4">
                <a class="nav-link active"  data-bs-toggle="tab" href="#candidate" role="tab" aria-selected="false">
                  <div class="d-flex">
                    <div class="tab-icon">
                      <i class="flaticon-users"></i>
                    </div>
                    <div class="ms-3">
                      <h6 class="mb-0">Candidate</h6>
                      <p class="mb-0">Log in as Candidate</p>
                    </div>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link"  data-bs-toggle="tab" href="#employer" role="tab" aria-selected="false">
                  <div class="d-flex">
                    <div class="tab-icon">
                      <i class="flaticon-suitcase"></i>
                    </div>
                    <div class="ms-3">
                      <h6 class="mb-0">Employer</h6>
                      <p class="mb-0">Log in as Employer</p>
                    </div>
                  </div>
                </a>
              </li>
            </ul>
          </fieldset>
          <div class="tab-content">
            <div class="tab-pane active" id="candidate" role="tabpanel">
              <form class="mt-4">
                <div class="row">
                  <div class="form-group col-12 mb-3">
                    <label class="form-label" for="Email2">Username / Email Address:</label>
                    <input type="text" class="form-control" id="Email22">
                  </div>
                  <div class="form-group col-12 mb-3">
                    <label class="form-label" for="password2">Password*</label>
                    <input type="password" class="form-control" id="password32">
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <a class="btn btn-primary d-grid" href="#">Sign In</a>
                  </div>
                  <div class="col-md-6">
                    <div class="ms-md-3 mt-3 mt-md-0 forgot-pass">
                      <a href="#">Forgot Password?</a>
                      <p class="mt-1">Don't have account? <a href="register.html">Sign Up here</a></p>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div class="tab-pane fade" id="employer" role="tabpanel">
              <form class="mt-4">
                <div class="row">
                  <div class="form-group col-12 mb-3">
                    <label class="form-label" for="Email2">Username / Email Address:</label>
                    <input type="text" class="form-control" id="Email2">
                  </div>
                  <div class="form-group col-12 mb-3">
                    <label class="form-label" for="password2">Password*</label>
                    <input type="password" class="form-control" id="password2">
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <a class="btn btn-primary d-grid" href="#">Sign In</a>
                  </div>
                  <div class="col-md-6">
                    <div class="ms-md-3 mt-3 mt-md-0">
                      <a href="#">Forgot Password?</a>
                      <div class="form-check mt-2">
                        <input class="form-check-input" type="checkbox" value="" id="Remember-02">
                        <label class="form-check-label" for="Remember-02">Remember Password</label>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="mt-4">
            <fieldset>
              <legend class="px-2">Login or Sign up with</legend>
              <div class="social-login">
                <ul class="list-unstyled d-flex mb-0">
                  <li class="facebook text-center">
                    <a href="#"> <i class="fab fa-facebook-f me-3 me-md-4"></i>Login with Facebook</a>
                  </li>
                  <li class="twitter text-center">
                    <a href="#"> <i class="fab fa-twitter me-3 me-md-4"></i>Login with Twitter</a>
                  </li>
                  <li class="google text-center">
                    <a href="#"> <i class="fab fa-google me-3 me-md-4"></i>Login with Google</a>
                  </li>
                  <li class="linkedin text-center">
                    <a href="#"> <i class="fab fa-linkedin-in me-3 me-md-4"></i>Login with Linkedin</a>
                  </li>
                </ul>
              </div>
            </fieldset>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--=================================
Signin Modal Popup -->

