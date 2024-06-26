<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--=================================
Banner -->
<section class="position-relative">
  <div class="banner bg-holder bg-overlay-black-20 text-dark" style="background-image: url(/images/bg/banner-02.jpg);">
    <div class="container-fluid">
      <div class="row">
        <div class="col-xl-9 text-start position-relative">
          <h1 class="text-dark">Drop <span class="text-primary"> Resume </span> & Get Your <span class="text-primary">Desire Job</span></h1>
          <p class="lead mb-4 mb-lg-5 fw-normal">Find Jobs, Employment & Career Opportunities</p>
          <div class="job-search-field">
            <div class="job-search-item">
              <form class="form row">
                <div class="col-lg-4">
                  <div class="form-group mb-3">
                    <div class="d-flex">
                      <label class="form-label">why</label>
                      <span class="ms-auto">e.g. job, company, title</span>
                    </div>
                    <div class="position-relative left-icon">
                      <input type="text" class="form-control" name="job_title" placeholder="Job title, skill or company">
                      <i class="fas fa-search"></i>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="form-group mb-3">
                    <div class="d-flex">
                      <label class="form-label">Where</label>
                      <span class="ms-auto">e.g. city, county or postcode</span>
                    </div>
                    <div class="position-relative left-icon">
                      <input type="text" class="form-control location-input" name="job_title" placeholder="Town, city or postcode">
                      <i class="far fa-compass"></i>
                      <a href="#">
                        <div class="detect">
                          <span class="d-none d-sm-block">Detect</span>
                          <i class="fas fa-crosshairs"></i>
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-sm-12">
                  <div class="form-group form-action mb-3">
                    <button type="submit" class="btn btn-primary btn-lg"><i class="fas fa-search"></i> Find Jobs</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="job-tag mt-4">
            <ul class="">
              <li class="text-primary">Trending Keywords :</li>
              <li><a href="#">Automotive,</a></li>
              <li><a href="#">Education,</a></li>
              <li><a href="#">Health and Care Engineering</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <svg  class="banner-shape" xmlns="http://www.w3.org/2000/svg" width="100%" height="100" viewBox="0 0 1920 100">
    <path class="cls-1" fill="#ffffff" d="M0,80S480,0,960,0s960,80,960,80v20H0V80Z"/></svg>
</section>
<!--=================================
Banner -->

<!--=================================
Jobs-listing -->
<section class="space-ptb">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="section-title">
          <h2 class="title">Jobs You May be Interested in</h2>
        </div>
      </div>
      <div class="col-12">
        <div class="browse-job d-flex border-0 pb-3">
          <div class="mb-4 mb-md-0">
            <ul class="nav nav-tabs justify-content-center d-flex" id="myTab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Hot Jobs</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Recent Jobs</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Popular Jobs</a>
              </li>
            </ul>
          </div>
          <div class="job-found ms-auto mb-0">
            <span class="badge badge-lg bg-primary">24123</span>
            <h6 class="ms-3 mb-0">Job Found</h6>
          </div>
        </div>
        <div class="tab-content" id="myTabContent">
          <!-- Hot jobs -->
          <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <div class="row mt-3">
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Freelance -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/10.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Post Room Operative</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Trout Design Ltd</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Wellesley Rd, London</li>
                          <li><i class="fas fa-filter pe-1"></i>Accountancy</li>
                          <li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>Freelance</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>1H ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Part-Time -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/09.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Web Developer</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Pendragon Green Ltd</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Needham, MA</li>
                          <li><i class="fas fa-filter pe-1"></i>IT & Telecoms</li>
                          <li><a class="part-time" href="#"><i class="fas fa-suitcase pe-1"></i>Part-Time</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>3D ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Temporary -->
                <div class="job-list">
                  <div class=" job-list-logo">
                    <img class="img-fluid" src="/images/svg/06.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Group Marketing Manager</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Wight Sound Hearing LLC</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>New Castle, PA</li>
                          <li><i class="fas fa-filter pe-1"></i>Banking</li>
                          <li><a class="temporary" href="#"><i class="fas fa-suitcase pe-1"></i>Temporary</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>2W ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Full time -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/17.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Data Entry Administrator</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Tan Electrics Ltd</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Park Avenue, Mumbai</li>
                          <li><i class="fas fa-filter pe-1"></i>Charity & Voluntary</li>
                          <li><a class="full-time" href="#"><i class="fas fa-suitcase pe-1"></i>Full-time</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>3M ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Freelance -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/18.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Stockroom Assistant</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Bright Sparks PLC</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Canyon Village, Ramon</li>
                          <li><i class="fas fa-filter pe-1"></i>Financial Services</li>
                          <li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>Freelance</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>6M ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6">
                <!-- Part-Time -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/19.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Land Development Marketer</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Carphone Warehouse</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Canyon Village, Ramon</li>
                          <li><i class="fas fa-filter pe-1"></i>IT & Telecoms</li>
                          <li><a class="part-time" href="#"><i class="fas fa-suitcase pe-1"></i>Part-Time</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>1M ago</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Recent jobs -->
          <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <div class="row mt-4">
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Freelance -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/11.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Marketing and Communications</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Fast Systems Consultants</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Wellesley Rd, London</li>
                          <li><i class="fas fa-filter pe-1"></i>Accountancy</li>
                          <li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>Freelance</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>1H ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Part-Time -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/12.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Senior Rolling Stock Technician</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html"> Pendragon Green Ltd</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Needham, MA</li>
                          <li><i class="fas fa-filter pe-1"></i>IT & Telecoms</li>
                          <li><a class="part-time" href="#"><i class="fas fa-suitcase pe-1"></i>Part-Time</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>3D ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Temporary -->
                <div class="job-list">
                  <div class=" job-list-logo">
                    <img class="img-fluid" src="/images/svg/13.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Operational Manager Part-Time</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html"> Wight Sound Hearing LLC</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>New Castle, PA</li>
                          <li><i class="fas fa-filter pe-1"></i>Banking</li>
                          <li><a class="temporary" href="#"><i class="fas fa-suitcase pe-1"></i>Temporary</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>2W ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Full time -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/14.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Communications Trainee Scheme</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Tan Electrics Ltd</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Park Avenue, Mumbai</li>
                          <li><i class="fas fa-filter pe-1"></i>Charity & Voluntary</li>
                          <li><a class="full-time" href="#"><i class="fas fa-suitcase pe-1"></i>Full-time</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>3M ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Freelance -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/15.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Part-Time Sales Assistant</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html"> Bright Sparks PLC</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Canyon Village, Ramon</li>
                          <li><i class="fas fa-filter pe-1"></i>Financial Services</li>
                          <li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>Freelance</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>6M ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6">
                <!-- Part-Time -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/16.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Customer Service Assistant</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Carphone Warehouse</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Canyon Village, Ramon</li>
                          <li><i class="fas fa-filter pe-1"></i>IT & Telecoms</li>
                          <li><a class="part-time" href="#"><i class="fas fa-suitcase pe-1"></i>Part-Time</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>1M ago</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Popular jobs -->
          <div class="tab-pane fade show" id="contact" role="tabpanel" aria-labelledby="contact-tab">
            <div class="row mt-4">
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Freelance -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/17.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Anticoagulation Receptionist</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Fast Systems Consultants</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Wellesley Rd, London</li>
                          <li><i class="fas fa-filter pe-1"></i>Accountancy</li>
                          <li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>Freelance</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>1H ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Part-Time -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/18.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Receptionist Office Administrator</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html"> Pendragon Green Ltd</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Needham, MA</li>
                          <li><i class="fas fa-filter pe-1"></i>IT & Telecoms</li>
                          <li><a class="part-time" href="#"><i class="fas fa-suitcase pe-1"></i>Part-Time</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>3D ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Temporary -->
                <div class="job-list">
                  <div class=" job-list-logo">
                    <img class="img-fluid" src="/images/svg/19.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Data Entry - Advanced Google Software</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Wight Sound Hearing LLC</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>New Castle, PA</li>
                          <li><i class="fas fa-filter pe-1"></i>Banking</li>
                          <li><a class="temporary" href="#"><i class="fas fa-suitcase pe-1"></i>Temporary</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>2W ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Full time -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/20.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Payroll and Office Administrator</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Tan Electrics Ltd</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Park Avenue, Mumbai</li>
                          <li><i class="fas fa-filter pe-1"></i>Charity & Voluntary</li>
                          <li><a class="full-time" href="#"><i class="fas fa-suitcase pe-1"></i>Full-time</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>3M ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4 mb-sm-0">
                <!-- Freelance -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/01.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Research Administrator</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Bright Sparks PLC</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Canyon Village, Ramon</li>
                          <li><i class="fas fa-filter pe-1"></i>Financial Services</li>
                          <li><a class="freelance" href="#"><i class="fas fa-suitcase pe-1"></i>Freelance</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>6M ago</span>
                  </div>
                </div>
              </div>
              <div class="col-lg-6">
                <!-- Part-Time -->
                <div class="job-list">
                  <div class="job-list-logo">
                    <img class="img-fluid" src="/images/svg/02.svg" alt="">
                  </div>
                  <div class="job-list-details">
                    <div class="job-list-info">
                      <div class="job-list-title">
                        <h5 class="mb-0"><a href="job-detail.html">Personal Shopping Receptionist</a></h5>
                      </div>
                      <div class="job-list-option">
                        <ul class="list-unstyled">
                          <li>
                            <span>via</span>
                            <a href="employer-detail.html">Carphone Warehouse</a>
                          </li>
                          <li><i class="fas fa-map-marker-alt pe-1"></i>Canyon Village, Ramon</li>
                          <li><i class="fas fa-filter pe-1"></i>IT & Telecoms</li>
                          <li><a class="part-time" href="#"><i class="fas fa-suitcase pe-1"></i>Part-Time</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="job-list-favourite-time">
                    <a  class="job-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                    <span class="job-list-time order-1"><i class="far fa-clock pe-1"></i>1M ago</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 justify-content-center d-flex mt-md-5 mt-4">
        <a class="btn btn-outline btn-lg" href="#">View More Jobs</a>
      </div>
    </div>
  </div>
</section>
<!--=================================
Jobs-listing -->
<!--=================================
Candidates & Companies -->
<section class="space-pb">
  <div class="container">
    <div class="row">
      <!-- Featured Candidates -->
      <div class="col-lg-7 mb-4 mb-lg-0">
        <div class="section-title">
          <h2 class="title">Featured Candidates</h2>
          <p>We know this in our gut, but what can we do about it? How can we motivate ourselves?</p>
        </div>
        <div class="candidate-list">
          <div class="candidate-list-image">
            <img class="img-fluid" src="/images/avatar/04.jpg" alt="" >
          </div>
          <div class="candidate-list-details">
            <div class="candidate-list-info">
              <div class="candidate-list-title">
                <h5 class="mb-0"><a href="/candidate-detail.html">Melissa Doe</a></h5>
              </div>
              <div class="candidate-list-option">
                <ul class="list-unstyled">
                  <li><i class="fas fa-filter pe-1"></i>Construction & Property</li>
                  <li><i class="fas fa-map-marker-alt pe-1"></i>Botchergate, Carlisle</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="candidate-list-favourite-time">
            <a class="candidate-list-favourite order-2" href="/#"><i class="far fa-heart"></i></a>
            <span class="candidate-list-time order-1"><i class="far fa-clock pe-1"></i>6D ago</span>
          </div>
        </div>
        <div class="candidate-list">
          <div class="candidate-list-image">
            <img class="img-fluid" src="/images/avatar/01.jpg" alt="" >
          </div>
          <div class="candidate-list-details">
            <div class="candidate-list-info">
              <div class="candidate-list-title">
                <h5 class="mb-0"><a href="/candidate-detail.html">Paul Flavius</a></h5>
              </div>
              <div class="candidate-list-option">
                <ul class="list-unstyled">
                  <li><i class="fas fa-filter pe-1"></i>General Insurance</li>
                  <li><i class="fas fa-map-marker-alt pe-1"></i>Ormskirk Rd, Wigan</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="candidate-list-favourite-time">
            <a class="candidate-list-favourite order-2" href="/#"><i class="far fa-heart"></i></a>
            <span class="candidate-list-time order-1"><i class="far fa-clock pe-1"></i>3D ago</span>
          </div>
        </div>
        <div class="candidate-list">
          <div class="candidate-list-image">
            <img class="img-fluid" src="/images/avatar/05.jpg" alt="" >
          </div>
          <div class="candidate-list-details">
            <div class="candidate-list-info">
              <div class="candidate-list-title">
                <h5 class="mb-0"><a href="/candidate-detail.html">Felica Queen</a></h5>
              </div>
              <div class="candidate-list-option">
                <ul class="list-unstyled">
                  <li><i class="fas fa-filter pe-1"></i>General Insurance</li>
                  <li><i class="fas fa-map-marker-alt pe-1"></i>Union St, New Delhi</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="candidate-list-favourite-time">
            <a class="candidate-list-favourite order-2" href="/#"><i class="far fa-heart"></i></a>
            <span class="candidate-list-time order-1"><i class="far fa-clock pe-1"></i>2D ago</span>
          </div>
        </div>
      </div>
      <div class="col-lg-1"></div>
      <!-- Top Companies -->
      <div class="col-lg-4">
        <div class="section-title">
          <h2 class="title">Top Companies</h2>
          <p>Here are some tips and methods for motivating yourself:</p>
        </div>
        <div class="owl-carousel owl-nav-bottom-center" data-nav-arrow="false" data-nav-dots="true" data-items="1" data-md-items="1" data-sm-items="2" data-xs-items="1" data-xx-items="1" data-space="15" data-autoheight="true">
          <div class="item">
            <div class="employers-grid">
              <div class="employers-list-logo">
                <img class="img-fluid" src="/images/svg/09.svg" alt="">
              </div>
              <div class="employers-list-details">
                <div class="employers-list-info">
                  <div class="employers-list-title">
                    <h5 class="mb-0"><a href="/employer-detail.html">Bright Sparks PLC</a></h5>
                  </div>
                  <div class="employers-list-option">
                    <ul class="list-unstyled">
                      <li><i class="fas fa-map-marker-alt pe-1"></i>Botchergate, Carlisle</li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="employers-list-position">
                <a class="btn btn-sm btn-dark" href="/#">17 Open position</a>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="employers-grid">
              <div class="employers-list-logo">
                <img class="img-fluid" src="/images/svg/10.svg" alt="">
              </div>
              <div class="employers-list-details">
                <div class="employers-list-info">
                  <div class="employers-list-title">
                    <h5 class="mb-0"><a href="/employer-detail.html">Fleet Improvements Pvt</a></h5>
                  </div>
                  <div class="employers-list-option">
                    <ul class="list-unstyled">
                      <li><i class="fas fa-map-marker-alt pe-1"></i>Green Lanes, London</li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="employers-list-position">
                <a class="btn btn-sm btn-dark" href="/#">20 Open position</a>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="employers-grid">
              <div class="employers-list-logo">
                <img class="img-fluid" src="/images/svg/08.svg" alt="">
              </div>
              <div class="employers-list-details">
                <div class="employers-list-info">
                  <div class="employers-list-title">
                    <h5 class="mb-0"><a href="/employer-detail.html">Suttons Financial Ltd</a></h5>
                  </div>
                  <div class="employers-list-option">
                    <ul class="list-unstyled">
                      <li><i class="fas fa-map-marker-alt pe-1"></i>Paris, Île-de-France</li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="employers-list-position">
                <a class="btn btn-sm btn-dark" href="/#">23 Open position</a>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="employers-grid">
              <div class="employers-list-logo">
                <img class="img-fluid" src="/images/svg/19.svg" alt="">
              </div>
              <div class="employers-list-details">
                <div class="employers-list-info">
                  <div class="employers-list-title">
                    <h5 class="mb-0"><a href="/employer-detail.html">Co-operative Funeralcare</a></h5>
                  </div>
                  <div class="employers-list-option">
                    <ul class="list-unstyled">
                      <li><i class="fas fa-map-marker-alt pe-1"></i>Lynch Lane, Weymouth</li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="employers-list-position">
                <a class="btn btn-sm btn-dark" href="/#">30 Open position</a>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="employers-grid">
              <div class="employers-list-logo">
                <img class="img-fluid" src="/images/svg/06.svg" alt="">
              </div>
              <div class="employers-list-details">
                <div class="employers-list-info">
                  <div class="employers-list-title">
                    <h5 class="mb-0"><a href="/employer-detail.html">Altenwerth and Hamill</a></h5>
                  </div>
                  <div class="employers-list-option">
                    <ul class="list-unstyled">
                      <li><i class="fas fa-map-marker-alt pe-1"></i>Taunton, London</li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="employers-list-position">
                <a class="btn btn-sm btn-dark" href="/#">35 Open position</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--=================================
Candidates & Companies -->


