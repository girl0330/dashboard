
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
Manage Jobs -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box mb-0">
                    <div class="row mb-4">
                        <div class="col-md-7 col-sm-5 d-flex align-items-center">
                            <div class="section-title-02 mb-0 ">
                                <h4 class="mb-0">Manage Jobs</h4>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-7 mt-3 mt-sm-0">
                            <div class="search">
                                <i class="fas fa-search"></i>
                                <input type="text" class="form-control" placeholder="Search....">
                            </div>
                        </div>
                    </div>
                    <div class="user-dashboard-table table-responsive">
                        <table class="table table-bordered">
                            <thead class="bg-light">
                            <tr >
                                <th scope="col">Job Title</th>
                                <th scope="col">Applications</th>
                                <th scope="col">Featured</th>
                                <th scope="col">Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">Job 01
                                    <p class="mb-1 mt-2">Expiry: 2020-04-15</p>
                                    <p class="mb-0">Address: Wellesley Rd, London</p>
                                </th>
                                <td>Applications</td>
                                <td><i class="far fa-star"></i></td>
                                <td>
                                    <ul class="list-unstyled mb-0 d-flex">
                                        <li><a href="#" class="text-primary" data-bs-toggle="tooltip" title="view"><i class="far fa-eye"></i></a></li>
                                        <li><a href="#" class="text-info" data-bs-toggle="tooltip" title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                                        <li><a href="#" class="text-danger" data-bs-toggle="tooltip" title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Job 02
                                    <p class="mb-1 mt-2">Expiry: 2020-10-20</p>
                                    <p class="mb-0">Address: Ormskirk Rd, Wigan</p>
                                </th>
                                <td>Applications</td>
                                <td><i class="far fa-star"></i></td>
                                <td>
                                    <ul class="list-unstyled mb-0 d-flex">
                                        <li><a href="#" class="text-primary" data-bs-toggle="tooltip" title="view"><i class="far fa-eye"></i></a></li>
                                        <li><a href="#" class="text-info" data-bs-toggle="tooltip" title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                                        <li><a href="#" class="text-danger" data-bs-toggle="tooltip" title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Job 03
                                    <p class="mb-1 mt-2">Expiry: 2020-11-30</p>
                                    <p class="mb-0">Address: New Castle, PA</p>
                                </th>
                                <td>Applications</td>
                                <td><i class="far fa-star"></i></td>
                                <td>
                                    <ul class="list-unstyled mb-0 d-flex">
                                        <li><a href="#" class="text-primary" data-bs-toggle="tooltip" title="view"><i class="far fa-eye"></i></a></li>
                                        <li><a href="#" class="text-info" data-bs-toggle="tooltip" title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                                        <li><a href="#" class="text-danger" data-bs-toggle="tooltip" title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Job 04
                                    <p class="mb-1 mt-2">Expiry: 2020-12-14</p>
                                    <p class="mb-0">Address: Ormskirk Rd, Wigan</p>
                                </th>
                                <td>Applications</td>
                                <td><i class="far fa-star"></i></td>
                                <td>
                                    <ul class="list-unstyled mb-0 d-flex">
                                        <li><a href="#" class="text-primary" data-bs-toggle="tooltip" title="view"><i class="far fa-eye"></i></a></li>
                                        <li><a href="#" class="text-info" data-bs-toggle="tooltip" title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                                        <li><a href="#" class="text-danger" data-bs-toggle="tooltip" title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-12 text-center">
                            <ul class="pagination mt-3">
                                <li class="page-item disabled me-auto">
                                    <span class="page-link b-radius-none">Prev</span>
                                </li>
                                <li class="page-item active" aria-current="page"><span class="page-link">1 </span> <span class="sr-only">(current)</span></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item ms-auto">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Manage Jobs -->
