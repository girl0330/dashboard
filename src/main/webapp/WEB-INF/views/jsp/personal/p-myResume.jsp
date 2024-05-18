<!--=================================
inner banner -->
<div class="header-inner bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="candidates-user-info">
                    <div class="jobber-user-info">
                        <div class="profile-avatar">
                            <img class="img-fluid " src="images/avatar/04.jpg" alt="">
                            <i class="fas fa-pencil-alt"></i>
                        </div>
                        <div class="profile-avatar-info ms-4">
                            <h3>Felica Queen</h3>
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
    <%@ include file="personalMenuInclude.jsp"%>
</section>
<!--=================================
Dashboard Nav -->
<!--=================================
My Resume -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="section-title-02">
                    <h3>My Resume</h3>
                </div>
            </div>
            <div class="col-lg-4 text-lg-end">
                <a class="btn btn-primary btn-md mb-4 mb-lg-0" href="my-resume.html">Preview My Resume</a>
            </div>
            <div class="col-12">
                <div class="user-dashboard-info-box">
                    <div class="form-group col-md-12 p-0">
                        <label class="form-label">Cover Letter</label>
                        <textarea class="form-control" rows="4"></textarea>
                    </div>
                </div>
                <div class="user-dashboard-info-box">
                    <div class="dashboard-resume-title d-flex align-items-center">
                        <div class="section-title-02 mb-sm-0">
                            <h4 class="mb-0">Education</h4>
                        </div>
                        <a class="btn btn-md ms-sm-auto btn-primary" data-bs-toggle="collapse" href="#dateposted" role="button" aria-expanded="false" aria-controls="dateposted">Add Education</a>
                    </div>
                    <div class="collapse show" id="dateposted">
                        <div class="bg-light p-3 mt-4">
                            <form class="row">
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" value="">
                                </div>
                                <div class="form-group mb-3 col-md-6 select-border">
                                    <label class="form-label">Year</label>
                                    <select class="form-control basic-select">
                                        <option value="value 01" selected="selected">2020</option>
                                        <option value="value 02">2008</option>
                                        <option value="value 03">2009</option>
                                        <option value="value 04">2010</option>
                                        <option value="value 05">2011</option>
                                        <option value="value 06">2012</option>
                                        <option value="value 07">2013</option>
                                        <option value="value 08">2014</option>
                                        <option value="value 09">2015</option>
                                        <option value="value 10">2016</option>
                                        <option value="value 11">2017</option>
                                        <option value="value 12">2018</option>
                                        <option value="value 13">2019</option>
                                        <option value="value 14">2020</option>
                                        <option value="value 15">2021</option>
                                        <option value="value 16">2022</option>
                                        <option value="value 17">2023</option>
                                        <option value="value 18">2024</option>
                                        <option value="value 19">2025</option>
                                        <option value="value 20">2026</option>
                                        <option value="value 21">2027</option>
                                        <option value="value 22">2028</option>
                                        <option value="value 23">2029</option>
                                        <option value="value 14">2030</option>
                                    </select>
                                </div>
                                <div class="form-group mb-3 col-md-6">
                                    <label class="form-label">Institute</label>
                                    <input type="text" class="form-control" value="">
                                </div>
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">Description</label>
                                    <textarea class="form-control" rows="4"></textarea>
                                </div>
                                <div class="form-group col-md-12 mb-0">
                                    <a class="btn btn-md btn-primary" href="#">Add</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="jobber-candidate-timeline mt-4">
                        <div class="jobber-timeline-icon">
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                        <div class="jobber-timeline-item">
                            <div class="jobber-timeline-cricle">
                                <i class="far fa-circle"></i>
                            </div>
                            <div class="jobber-timeline-info">
                                <div class="dashboard-timeline-info">
                                    <div class="dashboard-timeline-edit">
                                        <ul class="list-unstyled d-flex">
                                            <li><a class="text-end" data-bs-toggle="collapse" href="#dateposted-02" role="button" aria-expanded="false" aria-controls="dateposted"> <i class="fas fa-pencil-alt text-info me-2"></i> </a></li>
                                            <li><a href="#"><i class="far fa-trash-alt text-danger"></i></a></li>
                                        </ul>
                                    </div>
                                    <span class="jobber-timeline-time">2018 - Pres</span>
                                    <h6 class="mb-2">Masters in Software Engineering</h6>
                                    <span>- Engineering University</span>
                                    <p class="mt-2">This is the beginning of creating the life that you want to live. Know what the future holds for you as a result of the choice you can make today.</p>
                                </div>
                                <div class="collapse show" id="dateposted-02">
                                    <div class="bg-light p-3">
                                        <form class="row collapse show" id="dateposted-01">
                                            <div class="form-group mb-3 col-md-12">
                                                <label class="form-label">Title</label>
                                                <input type="text" class="form-control" value="Masters in Software Engineering">
                                            </div>
                                            <div class="form-group mb-3 col-md-6 select-border">
                                                <label class="form-label">Year</label>
                                                <select class="form-control basic-select">
                                                    <option value="value 01" selected="selected">2020</option>
                                                    <option value="value 02">2008</option>
                                                    <option value="value 03">2009</option>
                                                    <option value="value 04">2010</option>
                                                    <option value="value 05">2011</option>
                                                    <option value="value 06">2012</option>
                                                    <option value="value 07">2013</option>
                                                    <option value="value 08">2014</option>
                                                    <option value="value 09">2015</option>
                                                    <option value="value 10">2016</option>
                                                    <option value="value 11">2017</option>
                                                    <option value="value 12">2018</option>
                                                    <option value="value 13">2019</option>
                                                    <option value="value 14">2020</option>
                                                    <option value="value 15">2021</option>
                                                    <option value="value 16">2022</option>
                                                    <option value="value 17">2023</option>
                                                    <option value="value 18">2024</option>
                                                    <option value="value 19">2025</option>
                                                    <option value="value 20">2026</option>
                                                    <option value="value 21">2027</option>
                                                    <option value="value 22">2028</option>
                                                    <option value="value 23">2029</option>
                                                    <option value="value 14">2030</option>
                                                </select>
                                            </div>
                                            <div class="form-group mb-3 col-md-6">
                                                <label class="form-label">Institute</label>
                                                <input type="text" class="form-control" value="Engineering University">
                                            </div>
                                            <div class="form-group mb-3 col-md-12">
                                                <label class="form-label">Description</label>
                                                <textarea class="form-control" rows="4" placeholder="This is the beginning of creating the life that you want to live. Know what the future holds for you as a result of the choice you can make today."></textarea>
                                            </div>
                                            <div class="form-group col-md-12 mb-0">
                                                <a class="btn btn-md btn-primary" href="#">Update</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="jobber-timeline-item mb-0">
                            <div class="jobber-timeline-cricle">
                                <i class="far fa-circle"></i>
                            </div>
                            <div class="jobber-timeline-info">
                                <div class="dashboard-timeline-info">
                                    <div class="dashboard-timeline-edit">
                                        <ul class="list-unstyled d-flex">
                                            <li><a class="text-end" data-bs-toggle="collapse" href="#dateposted-03" role="button" aria-expanded="false" aria-controls="dateposted"> <i class="fas fa-pencil-alt text-info me-2"></i> </a></li>
                                            <li><a href="#"><i class="far fa-trash-alt text-danger"></i></a></li>
                                        </ul>
                                    </div>
                                    <span class="jobber-timeline-time">2014 - 2018</span>
                                    <h6 class="mb-2">Diploma in Graphics Design</h6>
                                    <span>- Graphic Arts Institute</span>
                                    <p class="mt-2">Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.</p>
                                </div>
                                <div class="collapse" id="dateposted-03">
                                    <div class="bg-light p-3">
                                        <form class="row collapse show" id="dateposted-04">
                                            <div class="form-group mb-3 col-md-12">
                                                <label class="form-label">Title</label>
                                                <input type="text" class="form-control" value="Diploma in Graphics Design">
                                            </div>
                                            <div class="form-group mb-3 col-md-6 select-border">
                                                <label class="form-label">Year</label>
                                                <select class="form-control basic-select">
                                                    <option value="value 01" selected="selected">2020</option>
                                                    <option value="value 02">2008</option>
                                                    <option value="value 03">2009</option>
                                                    <option value="value 04">2010</option>
                                                    <option value="value 05">2011</option>
                                                    <option value="value 06">2012</option>
                                                    <option value="value 07">2013</option>
                                                    <option value="value 08">2014</option>
                                                    <option value="value 09">2015</option>
                                                    <option value="value 10">2016</option>
                                                    <option value="value 11">2017</option>
                                                    <option value="value 12">2018</option>
                                                    <option value="value 13">2019</option>
                                                    <option value="value 14">2020</option>
                                                    <option value="value 15">2021</option>
                                                    <option value="value 16">2022</option>
                                                    <option value="value 17">2023</option>
                                                    <option value="value 18">2024</option>
                                                    <option value="value 19">2025</option>
                                                    <option value="value 20">2026</option>
                                                    <option value="value 21">2027</option>
                                                    <option value="value 22">2028</option>
                                                    <option value="value 23">2029</option>
                                                    <option value="value 14">2030</option>
                                                </select>
                                            </div>
                                            <div class="form-group mb-3 col-md-6">
                                                <label class="form-label">Institute</label>
                                                <input type="text" class="form-control" value="Graphic Arts Institute">
                                            </div>
                                            <div class="form-group mb-3 col-md-12">
                                                <label class="form-label">Description</label>
                                                <textarea class="form-control" rows="4" placeholder="Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you."></textarea>
                                            </div>
                                            <div class="form-group col-md-12 mb-0">
                                                <a class="btn btn-md btn-primary" href="#">Update</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--=================================
                Work & Experience -->
                <div class="user-dashboard-info-box">
                    <div class="dashboard-resume-title d-flex align-items-center">
                        <div class="section-title-02 mb-sm-0">
                            <h4 class="mb-0">Work & Experience</h4>
                        </div>
                        <a class="btn btn-md ms-sm-auto btn-primary" data-bs-toggle="collapse" href="#dateposted-05" role="button" aria-expanded="false" aria-controls="dateposted">Add Experience</a>
                    </div>
                    <div class="collapse show" id="dateposted-05">
                        <div class="bg-light p-3 mt-4">
                            <form class="row">
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" value="">
                                </div>
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">Company name</label>
                                    <input type="text" class="form-control" value="">
                                </div>
                                <div class="mb-3 col-md-6 datetimepickers">
                                    <label class="form-label">From</label>
                                    <div class="input-group date" id="datetimepicker-01" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-01">
                                        <div class="input-group-append d-flex" data-target="#datetimepicker-01" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                    <label class="form-label">Two</label>
                                    <div class="input-group date" id="datetimepicker-02" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-02">
                                        <div class="input-group-append d-flex" data-target="#datetimepicker-02" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">Description</label>
                                    <textarea class="form-control" rows="4"></textarea>
                                </div>
                                <div class="form-group col-md-12 mb-0">
                                    <a class="btn btn-md btn-primary" href="#">Add</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="jobber-candidate-timeline mt-4">
                        <div class="jobber-timeline-icon">
                            <i class="fas fa-briefcase"></i>
                        </div>
                        <div class="jobber-timeline-item">
                            <div class="jobber-timeline-cricle">
                                <i class="far fa-circle"></i>
                            </div>
                            <div class="jobber-timeline-info">
                                <div class="dashboard-timeline-info">
                                    <div class="dashboard-timeline-edit">
                                        <ul class="list-unstyled d-flex">
                                            <li><a class="text-end" data-bs-toggle="collapse" href="#dateposted-06" role="button" aria-expanded="false" aria-controls="dateposted"> <i class="fas fa-pencil-alt text-info me-2"></i> </a></li>
                                            <li><a href="#"><i class="far fa-trash-alt text-danger"></i></a></li>
                                        </ul>
                                    </div>
                                    <span class="jobber-timeline-time">2020-6-01 to 2020-6-01</span>
                                    <h6 class="mb-2">Web Designer</h6>
                                    <span>- Inwave Studio</span>
                                    <p class="mt-2">One of the main areas that I work on with my clients is shedding these non-supportive beliefs and replacing them with beliefs that will help them to accomplish their desires.</p>
                                </div>
                                <div class="collapse show" id="dateposted-06">
                                    <div class="bg-light p-3">
                                        <form class="row collapse show" id="dateposted-form-01">
                                            <div class="form-group mb-3 col-md-12">
                                                <label class="form-label">Title</label>
                                                <input type="text" class="form-control" value="Web Designer">
                                            </div>
                                            <div class="form-group mb-3 col-md-12">
                                                <label class="form-label">Company name</label>
                                                <input type="text" class="form-control" value="Inwave Studio">
                                            </div>
                                            <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                                <label class="form-label">From</label>
                                                <div class="input-group date" id="datetimepicker-05" data-target-input="nearest">
                                                    <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-05">
                                                    <div class="input-group-append d-flex" data-target="#datetimepicker-05" data-toggle="datetimepicker">
                                                        <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                                <label class="form-label">Two</label>
                                                <div class="input-group date" id="datetimepicker-06" data-target-input="nearest">
                                                    <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-06">
                                                    <div class="input-group-append d-flex" data-target="#datetimepicker-06" data-toggle="datetimepicker">
                                                        <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mb-3 col-md-12">
                                                <label class="form-label">Description</label>
                                                <textarea class="form-control" rows="4" placeholder="One of the main areas that I work on with my clients is shedding these non-supportive beliefs and replacing them with beliefs that will help them to accomplish their desires."></textarea>
                                            </div>
                                            <div class="form-group col-md-12 mb-0">
                                                <a class="btn btn-md btn-primary" href="#">Update</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="jobber-timeline-item mb-0">
                            <div class="jobber-timeline-cricle">
                                <i class="far fa-circle"></i>
                            </div>
                            <div class="jobber-timeline-info">
                                <div class="dashboard-timeline-info">
                                    <div class="dashboard-timeline-edit">
                                        <ul class="list-unstyled d-flex">
                                            <li><a class="text-end" data-bs-toggle="collapse" href="#dateposted-07" role="button" aria-expanded="false" aria-controls="dateposted"> <i class="fas fa-pencil-alt text-info me-2"></i> </a></li>
                                            <li><a href="#"><i class="far fa-trash-alt text-danger"></i></a></li>
                                        </ul>
                                    </div>
                                    <span class="jobber-timeline-time">2020-6-01 to 2020-6-01</span>
                                    <h6 class="mb-2">Secondary School Certificate</h6>
                                    <span>- Engineering High School</span>
                                    <p class="mt-2">Figure out what you want, put a plan together to achieve it, understand the cost, believe in yourself then go and get it!</p>
                                </div>
                                <div class="collapse" id="dateposted-07">
                                    <div class="bg-light p-3">
                                        <form class="row collapse show" id="dateposted-form-02">
                                            <div class="form-group col-md-12">
                                                <label class="form-label">Title</label>
                                                <input type="text" class="form-control" value="Secondary School Certificate">
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="form-label">Company name</label>
                                                <input type="text" class="form-control" value="Engineering High School">
                                            </div>
                                            <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                                <label class="form-label">From</label>
                                                <div class="input-group date" id="datetimepicker-07" data-target-input="nearest">
                                                    <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-07">
                                                    <div class="input-group-append d-flex" data-target="#datetimepicker-07" data-toggle="datetimepicker">
                                                        <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                                <label class="form-label">Two</label>
                                                <div class="input-group date" id="datetimepicker-08" data-target-input="nearest">
                                                    <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-08">
                                                    <div class="input-group-append d-flex" data-target="#datetimepicker-08" data-toggle="datetimepicker">
                                                        <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="form-label">Description</label>
                                                <textarea class="form-control" rows="4" placeholder="Figure out what you want, put a plan together to achieve it, understand the cost, believe in yourself then go and get it!"></textarea>
                                            </div>
                                            <div class="form-group col-md-12 mb-0">
                                                <a class="btn btn-md btn-primary" href="#">Update</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--=================================
                Work & Experience -->
                <!--=================================
                Professional Skill -->
                <div class="user-dashboard-info-box">
                    <div class="dashboard-resume-title d-flex align-items-center">
                        <div class="section-title-02 mb-sm-0">
                            <h4 class="mb-0">Professional Skill</h4>
                        </div>
                        <a class="btn btn-md ms-sm-auto btn-primary" href="#">Add Skill</a>
                    </div>
                    <div class="collapse show" id="dateposted-11">
                        <div class="bg-light p-3 mt-4">
                            <form class="row align-items-center">
                                <div class="form-group mb-3 col-md-6">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" value="Photoshop">
                                </div>
                                <div class="form-group mb-3 col-md-5">
                                    <label class="form-label">Percentage</label>
                                    <input type="text" class="form-control" value="70%">
                                </div>
                                <div class="form-group mb-3 col-md-1 text-center">
                                    <a class="mt-3 d-block" href="#"><i class="far fa-trash-alt text-danger"></i></a>
                                </div>
                            </form>
                            <form class="row align-items-center">
                                <div class="form-group mb-3 col-md-6">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" value="HTML/CSS">
                                </div>
                                <div class="form-group mb-3 col-md-5">
                                    <label class="form-label">Percentage</label>
                                    <input type="text" class="form-control" value="55%">
                                </div>
                                <div class="form-group mb-3 col-md-1 text-center">
                                    <a class="mt-3 d-block" href="#"><i class="far fa-trash-alt text-danger"></i></a>
                                </div>
                            </form>
                            <form class="row align-items-center">
                                <div class="form-group mb-3 col-md-6">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" value="JavaScript80">
                                </div>
                                <div class="form-group mb-3 col-md-5">
                                    <label class="form-label">Percentage</label>
                                    <input type="text" class="form-control" value="80%">
                                </div>
                                <div class="form-group mb-3 col-md-1 text-center">
                                    <a class="mt-3 d-block" href="#"><i class="far fa-trash-alt text-danger"></i></a>
                                </div>
                            </form>
                            <form class="row align-items-center">
                                <div class="form-group col-md-6">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" value="PHP">
                                </div>
                                <div class="form-group col-md-5">
                                    <label class="form-label">Percentage</label>
                                    <input type="text" class="form-control" value="60%">
                                </div>
                                <div class="form-group col-md-1 text-center">
                                    <a class="mt-3 d-block" href="#"><i class="far fa-trash-alt text-danger"></i></a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--=================================
                Professional Skill -->
                <!--=================================
                Awards -->
                <div class="user-dashboard-info-box">
                    <div class="dashboard-resume-title d-flex align-items-center">
                        <div class="section-title-02 mb-sm-0">
                            <h4 class="mb-0">Awards</h4>
                        </div>
                        <a class="btn btn-md ms-sm-auto btn-primary" data-bs-toggle="collapse" href="#dateposted-15" role="button" aria-expanded="false" aria-controls="dateposted">Add Awards</a>
                    </div>
                    <div class="collapse show" id="dateposted-15">
                        <div class="bg-light p-3 mt-4">
                            <form class="row">
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" value="">
                                </div>
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">Institute</label>
                                    <input type="text" class="form-control" value="">
                                </div>
                                <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                    <label class="form-label">From</label>
                                    <div class="input-group date" id="datetimepicker-09" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-09">
                                        <div class="input-group-append d-flex" data-target="#datetimepicker-09" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                    <label class="form-label">Two</label>
                                    <div class="input-group date" id="datetimepicker-10" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-10">
                                        <div class="input-group-append d-flex" data-target="#datetimepicker-10" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-3 col-md-12">
                                    <label class="form-label">Description</label>
                                    <textarea class="form-control" rows="4"></textarea>
                                </div>
                                <div class="form-group col-md-12 mb-0">
                                    <a class="btn btn-md btn-primary" href="#">Add</a>
                                </div>
                            </form>
                        </div>
                        <div class="jobber-candidate-timeline mt-4">
                            <div class="jobber-timeline-icon">
                                <i class="fas fa-trophy"></i>
                            </div>
                            <div class="jobber-timeline-item">
                                <div class="jobber-timeline-cricle">
                                    <i class="far fa-circle"></i>
                                </div>
                                <div class="jobber-timeline-info">
                                    <div class="dashboard-timeline-info">
                                        <div class="dashboard-timeline-edit">
                                            <ul class="list-unstyled d-flex">
                                                <li><a class="text-end" data-bs-toggle="collapse" href="#dateposted-16" role="button" aria-expanded="false" aria-controls="dateposted"> <i class="fas fa-pencil-alt text-info me-2"></i> </a></li>
                                                <li><a href="#"><i class="far fa-trash-alt text-danger"></i></a></li>
                                            </ul>
                                        </div>
                                        <span class="jobber-timeline-time">2008 - 2012</span>
                                        <h6 class="mb-2">Perfect Attendance Programs</h6>
                                        <span>- Engineering High School</span>
                                        <p class="mt-2">Having clarity of purpose and a clear picture of what you desire, is probably the single most important factor in achievement. Why is Clarity so important?</p>
                                    </div>
                                    <div class="collapse show" id="dateposted-16">
                                        <div class="bg-light p-3">
                                            <form class="row collapse show" id="dateposted-form-07">
                                                <div class="form-group mb-3 col-md-12">
                                                    <label class="form-label">Title</label>
                                                    <input type="text" class="form-control" value="Perfect Attendance Programs">
                                                </div>
                                                <div class="form-group mb-3 col-md-12">
                                                    <label class="form-label">Institute</label>
                                                    <input type="text" class="form-control" value="Engineering High School">
                                                </div>
                                                <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                                    <label class="form-label">From</label>
                                                    <div class="input-group date" id="datetimepicker-11" data-target-input="nearest">
                                                        <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-11">
                                                        <div class="input-group-append d-flex" data-target="#datetimepicker-11" data-toggle="datetimepicker">
                                                            <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                                    <label class="form-label">Two</label>
                                                    <div class="input-group date" id="datetimepicker-12" data-target-input="nearest">
                                                        <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-12">
                                                        <div class="input-group-append d-flex" data-target="#datetimepicker-12" data-toggle="datetimepicker">
                                                            <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-3 col-md-12">
                                                    <label class="form-label">Description</label>
                                                    <textarea class="form-control" rows="4" placeholder="Having clarity of purpose and a clear picture of what you desire, is probably the single most important factor in achievement. Why is Clarity so important?"></textarea>
                                                </div>
                                                <div class="form-group col-md-12 mb-0">
                                                    <a class="btn btn-md btn-primary" href="#">Update</a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="jobber-timeline-item mb-0">
                                <div class="jobber-timeline-cricle">
                                    <i class="far fa-circle"></i>
                                </div>
                                <div class="jobber-timeline-info">
                                    <div class="dashboard-timeline-info">
                                        <div class="dashboard-timeline-edit">
                                            <ul class="list-unstyled d-flex">
                                                <li><a class="text-end" data-bs-toggle="collapse" href="#dateposted-17" role="button" aria-expanded="false" aria-controls="dateposted"> <i class="fas fa-pencil-alt text-info me-2"></i> </a></li>
                                                <li><a href="#"><i class="far fa-trash-alt text-danger"></i></a></li>
                                            </ul>
                                        </div>
                                        <span class="jobber-timeline-time">2012 - 2014</span>
                                        <h6 class="mb-2">Secondary School Certificate</h6>
                                        <span>- Engineering High School</span>
                                        <p class="mt-2">So, make the decision to move forward. Commit your decision to paper, just to bring it into focus. Then, go for it!</p>
                                    </div>
                                    <div class="collapse" id="dateposted-17">
                                        <div class="bg-light p-3">
                                            <form class="row collapse show" id="dateposted-form-08">
                                                <div class="form-group mb-3 col-md-12">
                                                    <label class="form-label">Title</label>
                                                    <input type="text" class="form-control" value="Secondary School Certificate">
                                                </div>
                                                <div class="form-group mb-3 col-md-12">
                                                    <label class="form-label">Institute</label>
                                                    <input type="text" class="form-control" value="Engineering High School">
                                                </div>
                                                <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                                    <label class="form-label">From</label>
                                                    <div class="input-group date" id="datetimepicker-13" data-target-input="nearest">
                                                        <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-13">
                                                        <div class="input-group-append d-flex" data-target="#datetimepicker-13" data-toggle="datetimepicker">
                                                            <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-3 col-md-6 select-border datetimepickers">
                                                    <label class="form-label">Two</label>
                                                    <div class="input-group date" id="datetimepicker-14" data-target-input="nearest">
                                                        <input type="text" class="form-control datetimepicker-input" value="08/11/1999" data-target="#datetimepicker-14">
                                                        <div class="input-group-append d-flex" data-target="#datetimepicker-14" data-toggle="datetimepicker">
                                                            <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-3 col-md-12">
                                                    <label class="form-label">Description</label>
                                                    <textarea class="form-control" rows="4" placeholder="So, make the decision to move forward. Commit your decision to paper, just to bring it into focus. Then, go for it!"></textarea>
                                                </div>
                                                <div class="form-group col-md-12 mb-0">
                                                    <a class="btn btn-md btn-primary" href="#">Update</a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--=================================
                Awards -->
                <a class="btn btn-md btn-primary" href="#">Save Settings</a>
            </div>
        </div>
    </div>
</section>
<!--=================================
My Resume -->