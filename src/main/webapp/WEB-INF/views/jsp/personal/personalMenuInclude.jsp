<!--=================================
inner banner -->
<div class="header-inner bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="candidates-user-info">
                    <div class="jobber-user-info">
                        <div class="profile-avatar">
                            <img class="img-fluid " src="/images/avatar/04.jpg" alt="">
                            <i class="fas fa-pencil-alt"></i>
                        </div>
                        <div class="profile-avatar-info ms-4">
                            <h3>${personalInfo.email}</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="progress">
                    <div class="progress-bar" role="progressbar" style="width:85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                        <span class="progress-bar-number">85%</span>
                    </div>
                </div>
                <div class="candidates-skills">
                    <div class="candidates-skills-info">
                        <h3 class="text-primary">85%</h3>
                        <span class="d-block">Skills increased by job Title.</span>
                    </div>
                    <div class="candidates-required-skills ms-auto mt-sm-0 mt-3">
                        <a class="btn btn-dark" href="#">Complete Required Skills</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--=================================
inner banner -->
<!--=================================
Dashboard Nav -->
<section>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="sticky-top secondary-menu-sticky-top">
                <div class="secondary-menu">
                    <ul class="list-unstyled mb-0" id="menu">
                        <li><a href="/personal/dashboard">Dashboard</a></li>
                        <li><a href="/personal/myProfile">My Profile</a></li>
                        <li><a href="/personal/changePassword">Change Password</a></li>
                        <li><a href="/personal/myResume">My Resume</a></li>
                        <li><a href="/personal/manageJobs">Manage Jobs</a></li>
                        <li><a href="/personal/savedJobs">Saved Jobs</a></li>
                        <li><a href="/personal/pricingPlan">Pricing Plan</a></li>
                        <li><a href="/user/logout">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</section>
<!--=================================
Dashboard Nav -->
<script src="/js/jquery-3.7.1.min.js"></script>
<script>
    $(document).ready(function() {
        const path = window.location.pathname;
        $('#menu li a').removeClass('active').filter(function() {
            return $(this).attr('href') === path;
        }).addClass('active');
    });
</script>