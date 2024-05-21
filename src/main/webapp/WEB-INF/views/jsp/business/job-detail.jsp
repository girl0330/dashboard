<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Jobber - Job Board HTML5 Template" />
    <meta name="author" content="potenzaglobalsolutions.com" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Jobber - Job Board HTML5 Template</title>

    <!-- Favicon -->
    <link href="images/favicon.ico" rel="shortcut icon" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700" rel="stylesheet">

    <!-- CSS Global Compulsory (Do not remove)-->
    <link rel="stylesheet" href="css/font-awesome/all.min.css" />
    <link rel="stylesheet" href="css/flaticon/flaticon.css" />
    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css" />

    <!-- Template Style -->
    <link rel="stylesheet" href="css/style.css" />

  </head>
<body>

<!--=================================
header -->
<header class="header bg-dark">
  <nav class="navbar navbar-static-top navbar-expand-lg header-sticky">
    <div class="container-fluid">
      <button id="nav-icon4" type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse">
          <span></span>
          <span></span>
          <span></span>
      </button>
      <a class="navbar-brand" href="index.html">
        <img class="img-fluid" src="images/logo.svg" alt="logo">
      </a>
      <div class="navbar-collapse collapse justify-content-start">
        <ul class="nav navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home<i class="fas fa-chevron-down fa-xs"></i></a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="index.html">index Default</a></li>
              <li><a class="dropdown-item" href="index-02.html">index 02</a></li>
              <li><a class="dropdown-item" href="index-03.html">index 03</a></li>
              <li><a class="dropdown-item" href="index-map.html">index map</a></li>
              <li><a class="dropdown-item" href="index-slider.html">index Slider</a></li>
              <li><a class="dropdown-item" href="index-bg-video.html">index bg video</a></li>
              <li><a class="dropdown-item" href="index-splash.html">index splash</a></li>
            </ul>
          </li>
          <li class="dropdown nav-item">
            <a href="properties.html" class="nav-link" data-bs-toggle="dropdown">Pages<i class="fas fa-chevron-down fa-xs"></i></a>
            <ul class="dropdown-menu megamenu dropdown-menu-lg">
              <li>
                <div class="row">
                  <div class="col-sm-4 mb-2 mb-sm-0">
                    <h6 class="mb-3 nav-title">Pages</h6>
                    <ul class="list-unstyled mt-lg-3">
                      <li><a href="about.html">About</a></li>
                      <li><a href="services.html">Services</a></li>
                      <li><a href="pricing.html">Pricing</a></li>
                      <li><a href="career.html">Career</a></li>
                      <li><a href="advertising.html">Advertising</a></li>
                      <li><a href="contact-us.html">Contact Us</a></li>
                    </ul>
                  </div>
                  <div class="col-sm-4 mb-2 mb-sm-0">
                    <h6 class="mb-3 nav-title">Pages</h6>
                    <ul class="list-unstyled mt-lg-3">
                      <li><a href="blog.html">Blog</a></li>
                      <li><a href="blog-detail.html">Blog Detail</a></li>
                      <li><a href="post-a-job.html">Post a Job</a></li>
                      <li><a href="faqs.html">Faq</a></li>
                      <li><a href="browse-categories.html">Browse Categories</a></li>
                      <li><a href="browse-locations.html">Browse Locations</a></li>
                    </ul>
                  </div>
                  <div class="col-sm-4">
                    <h6 class="mb-3 nav-title">Pages</h6>
                    <ul class="list-unstyled mt-lg-3">
                      <li><a href="login.html">Login</a></li>
                      <li><a href="register.html">Register</a></li>
                      <li><a href="coming-soon.html">Coming soon</a></li>
                      <li><a href="404-error.html">404 Error</a></li>
                      <li><a href="terms-and-conditions.html">T&C</a></li>

                    </ul>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-12">
                    <div class="agency-logo pt-4 pb-3">
                      <h6 class="mb-3 nav-title">Top Agency</h6>
                      <ul class="list-unstyled">
                        <li>
                          <div class="job-list">
                            <div class="job-list-logo">
                              <img class="img-fluid" src="images/svg/07.svg" alt="">
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="job-list">
                            <div class="job-list-logo">
                              <img class="img-fluid" src="images/svg/06.svg" alt="">
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="job-list">
                            <div class="job-list-logo">
                              <img class="img-fluid" src="images/svg/05.svg" alt="">
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="job-list">
                            <div class="job-list-logo">
                              <img class="img-fluid" src="images/svg/04.svg" alt="">
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="job-list">
                            <div class="job-list-logo">
                              <img class="img-fluid" src="images/svg/03.svg" alt="">
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </li>
          <li class="nav-item dropdown active">
            <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Listing <i class="fas fa-chevron-down fa-xs"></i>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="job-grid.html">Job Grid</a></li>
              <li><a class="dropdown-item" href="job-listing.html">Job Listing</a></li>
              <li class="active"><a class="dropdown-item" href="job-detail.html">Job Detail</a></li>
              <li><a class="dropdown-item" href="job-listing-map.html">Job Listing Map</a></li>
            </ul>
          </li>
          <li class="dropdown nav-item mega-menu">
            <a href="javascript:void(0)" class="nav-link" data-bs-toggle="dropdown">Elements<i class="fas fa-chevron-down fa-xs"></i></a>
            <ul class="dropdown-menu megamenu">
              <li>
                <div class="row">
                  <div class="col-sm-6 col-lg-5 mb-3 mb-lg-0">
                    <h6 class="mb-3 nav-title">Search Types</h6>
                    <ul class="list-unstyled mt-lg-3">
                      <li><a href="search-style-under-banner.html">Search style under banner</a></li>
                      <li><a href="search-style-above-banner.html">Search style above banner</a></li>
                      <li><a href="search-style-below-banner.html">Search style below banner</a></li>
                      <li><a href="search-style-advanced.html">Advanced Search style</a></li>
                      <li><a href="search-style-classic.html">Search style classic</a></li>
                      <li><a href="search-style-with-filter.html">Search style with filter</a></li>
                      <li><a href="search-style-advanced-02.html">Advanced Search style 02 </a></li>
                      <li><a href="search-style-advanced-03.html">Advanced Search style 03 </a></li>
                    </ul>
                  </div>
                  <div class="col-sm-6 col-lg-3 mb-3 mb-sm-0">
                    <h6 class="mb-3 nav-title">Elements</h6>
                    <ul class="list-unstyled mt-lg-3">
                      <li><a href="element-feature-box.html">Feature box</a></li>
                      <li><a href="element-testimonials.html">Testimonials</a></li>
                      <li><a href="element-accordion.html">Accordion</a></li>
                      <li><a href="element-tabs.html">Tabs</a></li>
                      <li><a href="element-typography.html">Typography</a></li>
                      <li><a href="element-counter.html">counter</a></li>
                      <li><a href="element-countdown.html">Countdown</a></li>
                      <li><a href="element-category.html">Category</a></li>
                    </ul>
                  </div>
                  <div class="col-sm-6 col-lg-4">
                    <div class="menu-banner bg-dark p-3 pt-4 text-center border-radius h-100 d-none d-lg-block">
                        <h5 class="text-primary mb-3 pt-2">Advertise your job with us</h5>
                        <span class="text-light"> Starting from</span>
                        <h3 class="text-white my-3">$99 <small>/mo</small></h3>
                        <p class="text-primary p-2 small text-white">Save 30% for new customer</p>
                        <a class="btn btn-light btn-sm" href="post-a-job.html">Post a job now!</a>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Employer <i class="fas fa-chevron-down fa-xs"></i>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="employer-grid.html">Employer Grid</a></li>
              <li><a class="dropdown-item" href="employer-listing.html">Employer list</a></li>
              <li><a class="dropdown-item" href="employer-detail.html">Employer detail</a></li>
              <li><a class="dropdown-item" href="employer-listing-map.html">Employer Listing Map</a></li>
              <li class="dropdown-submenu">
                <a class="dropdown-item dropdown-toggle" href="javascript:void(0)">Dashboard <i class="fas fa-chevron-right fa-xs"></i></a>
                  <ul class="dropdown-menu left-side">
                    <li><a class="dropdown-item" href="dashboard-employer.html">Dashboard</a></li>
                    <li><a class="dropdown-item" href="dashboard-employer-my-profile.html">Profile</a></li>
                    <li><a class="dropdown-item" href="dashboard-employer-change-password.html">Change Password </a></li>
                    <li><a class="dropdown-item" href="dashboard-employer-manage-candidates.html">Manage Candidates</a></li>
                    <li><a class="dropdown-item" href="dashboard-employer-manage-jobs.html">Manage Jobs</a></li>
                    <li><a class="dropdown-item" href="dashboard-employer-post-new-job.html">Post New Job</a></li>
                    <li><a class="dropdown-item" href="dashboard-employer-pricing.html">Pricing</a></li>
                  </ul>
              </li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Candidates <i class="fas fa-chevron-down fa-xs"></i>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="candidates-grid.html">Candidates Grid</a></li>
              <li><a class="dropdown-item" href="candidates-listing.html">Candidates list</a></li>
              <li><a class="dropdown-item" href="candidate-detail.html">Candidates detail</a></li>
              <li><a class="dropdown-item" href="candidates-listing-map.html">Candidates Listing Map</a></li>
              <li class="dropdown-submenu">
                <a class="dropdown-item dropdown-toggle" href="javascript:void(0)">Dashboard <i class="fas fa-chevron-right fa-xs"></i></a>
                  <ul class="dropdown-menu left-side">
                    <li><a class="dropdown-item" href="dashboard-candidates.html">Dashboard</a></li>
                    <li><a class="dropdown-item" href="dashboard-candidates-my-profile.html">Profile</a></li>
                    <li><a class="dropdown-item" href="dashboard-candidates-change-password.html">Change Password </a></li>
                    <li><a class="dropdown-item" href="dashboard-candidates-my-resume.html">My Resume</a></li>
                    <li><a class="dropdown-item" href="dashboard-candidates-manage-jobs.html">Manage Jobs</a></li>
                    <li><a class="dropdown-item" href="dashboard-candidates-saved-jobs.html">Saved Jobs</a></li>
                    <li><a class="dropdown-item" href="dashboard-candidates-pricing.html">Pricing</a></li>
                  </ul>
              </li>
              <li><a class="dropdown-item" href="my-resume.html">My Resume <span class="badge bg-danger ms-2">CV</span></a></li>
            </ul>
          </li>
        </ul>
      </div>
      <div class="add-listing">
          <div class="login d-inline-block me-4">
            <a href="login.html" data-bs-toggle="modal" data-bs-target="#exampleModalCenter"><i class="far fa-user pe-2"></i>Sign in</a>
          </div>
          <a class="btn btn-white btn-md" href="post-a-job.html"> <i class="fas fa-plus-circle"></i>Post a job</a>
        </div>
    </div>
  </nav>
</header>
<!--=================================
header -->

<!--=================================
banner -->
<section class="header-inner header-inner-big bg-holder text-white" style="background-image: url(images/bg/banner-01.jpg);">
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
        <div class="row">
          <div class="col-md-12">
            <div class="job-list border">
              <div class=" job-list-logo">
                <img class="img-fluid" src="images/svg/10.svg" alt="">
              </div>
              <div class="job-list-details">
                <div class="job-list-info">
                  <div class="job-list-title">
                    <h5 class="mb-0">Payroll and Office Administrator</h5>
                  </div>
                  <div class="job-list-option">
                    <ul class="list-unstyled">
                      <li><i class="fas fa-map-marker-alt pe-1"></i>New Castle, PA</li>
                      <li><i class="fas fa-phone fa-flip-horizontal fa-fw"></i><span class="ps-2">(123) 345-6789</span></li>
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
        </div>
        <div class="border p-4 mt-4 mt-lg-5">
          <div class="row">
            <div class="col-md-4 col-sm-6 mb-4">
              <div class="d-flex">
                <i class="font-xll text-primary align-self-center flaticon-debit-card"></i>
                <div class="feature-info-content ps-3">
                  <label class="mb-1">Offered Salary</label>
                  <span class="mb-0 fw-bold d-block text-dark">£15,000 - £20,000</span>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-sm-6 mb-4">
              <div class="d-flex">
                <i class="font-xll text-primary align-self-center flaticon-love"></i>
                <div class="feature-info-content ps-3">
                  <label class="mb-1">Gender</label>
                  <span class="mb-0 fw-bold d-block text-dark">Female</span>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-sm-6 mb-4">
              <div class="d-flex">
                <i class="font-xll text-primary align-self-center flaticon-bar-chart"></i>
                <div class="feature-info-content ps-3">
                  <label class="mb-1">Career Level</label>
                  <span class="mb-0 fw-bold d-block text-dark">Executive</span>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-sm-6 mb-md-0 mb-4">
              <div class="d-flex">
                <i class="font-xll text-primary align-self-center flaticon-apartment"></i>
                <div class="feature-info-content ps-3">
                  <label class="mb-1">Industry</label>
                  <span class="mb-0 fw-bold d-block text-dark">Management</span>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-sm-6 mb-sm-0 mb-4">
              <div class="d-flex">
                <i class="font-xll text-primary align-self-center flaticon-medal"></i>
                <div class="feature-info-content ps-3">
                  <label class="mb-1">Experience</label>
                  <span class="mb-0 fw-bold d-block text-dark">2 Years</span>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-sm-6">
              <div class="d-flex">
                <i class="font-xll text-primary align-self-center flaticon-mortarboard"></i>
                <div class="feature-info-content ps-3">
                  <label class="mb-1">Qualification</label>
                  <span class="mb-0 fw-bold d-block text-dark">Bachelor Degree</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="my-4 my-lg-5">
          <h5 class="mb-3 mb-md-4">Job Description</h5>
          <p>One of the main areas that I work on with my clients is shedding these non-supportive beliefs and replacing them with beliefs that will help them to accomplish their desires.</p>
          <p class="fst-italic">It is truly amazing the damage that we, as parents, can inflict on our children. So why do we do it? For the most part, we don’t do it intentionally or with malice. In the majority of cases, the cause is a well-meaning but unskilled or un-thinking parent, who says the wrong thing at the wrong time, and the message sticks – as simple as that!</p>
        </div>
        <hr>
        <div class="my-4 my-lg-5">
          <h5 class="mb-3 mb-md-4">Required Knowledge, Skills, and Abilities</h5>
          <ul class="list-unstyled list-style">
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Commitment – understanding the price and having the willingness to pay that price</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Belief – believing in yourself and those around you</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Taking action – practice Ready, Fire, Aim…</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>You will drift aimlessly until you arrive back at the original dock</li>
            <li class="mb-0"><i class="far fa-check-circle font-md text-primary me-2"></i>You will run aground and become hopelessly stuck in the mud</li>
          </ul>
        </div>
        <hr>
        <div class="mt-4 mt-lg-5">
          <h5 class="mb-3 mb-md-4">Education + Experience</h5>
          <ul class="list-unstyled list-style mb-4 mb-lg-0">
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>You will sail along until you collide with an immovable object, after which you will sink to the bottom</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Clarity – developing the Vision</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Focus – having a plan</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Give yourself the power of responsibility. Remind yourself the only thing stopping you is yourself.</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Do it today. Remind yourself of someone you know who died suddenly and the fact that there is no guarantee that tomorrow will come.</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Now go push your own limits and succeed!</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Let success motivate you. Find a picture of what epitomizes success to you and then pull it out when you are in need of motivation.</li>
            <li><i class="far fa-check-circle font-md text-primary me-2"></i>Belief – believing in yourself and those around you</li>
            <li class="mb-0"><i class="far fa-check-circle font-md text-primary me-2"></i>So, make the decision to move forward. Commit your decision to paper, just to bring it into focus. Then, go for it!</li>
          </ul>
        </div>
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
            <div class="company-address widget-box">
              <div class="company-address-map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434509374!2d144.95373531590414!3d-37.817323442021134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d4c2b349649%3A0xb6899234e561db11!2sEnvato!5e0!3m2!1sen!2sin!4v1559039794237!5m2!1sen!2sin"  height="230" allowfullscreen></iframe>
              </div>
              <ul class="list-unstyled mt-3">
                <li><a href="#"><i class="fas fa-link fa-fw"></i><span class="ps-2">www.infojob.com</span></a></li>
                <li><a href="tel:+905389635487"><i class="fas fa-phone fa-flip-horizontal fa-fw"></i><span class="ps-2">+(456) 478-2589</span></a></li>
                <li><a href="mailto:ali.potenza@job.com"><i class="fas fa-envelope fa-fw"></i><span class="ps-2">support@jobber.demo</span></a></li>
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
                  <img class="img-fluid" src="images/svg/17.svg" alt="">
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
                  <img class="img-fluid" src="images/svg/18.svg" alt="">
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
                  <img class="img-fluid" src="images/svg/19.svg" alt="">
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
footer -->
<footer class="footer bg-light">
  <div class="position-relative">
    <svg class="footer-shape"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:xlink="http://www.w3.org/1999/xlink"
      width="100%" height="85px">
      <path fill-rule="evenodd"  fill="rgb(255, 255, 255)"
        d="M-0.000,-0.001 L1923.000,-0.001 L1923.000,84.999 C1608.914,41.669 1279.532,19.653 962.500,19.000 C635.773,18.326 323.692,40.344 -0.000,84.999 C-0.000,-83.334 -0.000,168.332 -0.000,-0.001 Z"/>
      </svg>
    </div>
    <div class="container pt-5">
      <div class="row mt-5">
        <div class="col-lg-3 col-md-6">
          <div class="footer-link">
            <h5 class="text-dark mb-4">Trending Job</h5>
            <ul class="list-unstyled">
              <li><a href="#">Browse Jobs</a></li>
              <li><a href="#">Browse Categories</a></li>
              <li><a href="#">Submit Resume</a></li>
              <li><a href="#">Candidate Dashboard</a></li>
              <li><a href="#">Job Alerts</a></li>
              <li><a href="#">My Bookmarks</a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 mt-4 mt-md-0">
          <div class="footer-link">
            <h5 class="text-dark mb-4">Trending Companies</h5>
            <ul class="list-unstyled">
              <li><a href="#">Shortcodes</a></li>
              <li><a href="#">Job Page</a></li>
              <li><a href="#">Job Page Alternative</a></li>
              <li><a href="#">Resume Page</a></li>
              <li><a href="#">Blog</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 mt-4 mt-lg-0">
          <h5 class="text-dark mb-4">Subscribe Us</h5>
          <div class="footer-subscribe">
            <p>Sign Up to our Newsletter to get the latest news and offers.</p>
            <form>
              <div class="form-group mb-3">
                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
              </div>
              <button type="submit" class="btn btn-primary btn-md">Get Notified</button>
            </form>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 mt-4 mt-lg-0">
          <h5 class="text-dark mb-4">Download App</h5>
          <div class="footer-subscribe">
            <p>Download the latest Slick new job apps now</p>
            <div class="d-inline-block">
              <a class="btn btn-white btn-sm btn-app " href="#">
                <i class="fab fa-apple"></i>
                <div class="btn-text text-start">
                  <small class="fw-normal">Download on the </small>
                  <span class="mb-0 d-block">App Store</span>
                </div>
              </a>
              <a class="btn btn-white btn-sm btn-app mt-3" href="#">
                <i class="fab fa-google-play"></i>
                <div class="btn-text text-start">
                  <small class="fw-normal">Get it on  </small>
                  <span class="mb-0 d-block">Google Play</span>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer-bottom bg-dark mt-5">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ">
            <div class="d-flex justify-content-md-start justify-content-center">
              <ul class="list-unstyled d-flex mb-0">
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="#">Team</a></li>
                <li><a href="contact-us.html">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-6 text-center text-md-end mt-4 mt-md-0">
            <p class="mb-0"> &copy;Copyright <span id="copyright"> <script>document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))</script></span> <a href="#"> Jobber </a> All Rights Reserved </p>
          </div>
        </div>
      </div>
    </div>
  </footer>
<!--=================================
footer-->

<!--=================================
Back To Top-->
   <div id="back-to-top" class="back-to-top">
     <i class="fas fa-angle-up"></i>
   </div>
<!--=================================
Back To Top-->

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

<!--=================================
Javascript -->

      <!-- JS Global Compulsory (Do not remove)-->
      <script src="js/jquery-3.6.0.min.js"></script>
      <script src="js/popper/popper.min.js"></script>
      <script src="js/bootstrap/bootstrap.min.js"></script>

      <!-- Template Scripts (Do not remove)-->
      <script src="js/custom.js"></script>

</body>
</html>
