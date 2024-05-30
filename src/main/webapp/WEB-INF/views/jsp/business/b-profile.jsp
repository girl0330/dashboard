<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--=================================
Dashboard Nav -->
<%@ include file="businessMenuInclude.jsp"%>
<!--=================================
Dashboard Nav -->

<!--=================================
My Profile -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box">
                    <div class="section-title-02 mb-4">
                        <h4>Basic Information</h4>
                    </div>
                    <div class="cover-photo-contact">
                        <div class="cover-photo">
                            <img class="img-fluid " src="images/bg/cover-bg.png" alt="">
                            <i class="fas fa-times-circle"></i>
                        </div>
                        <div class="upload-file">
                            <label for="formFile" class="form-label">Upload Cover Photo</label>
                            <input class="form-control" type="file" id="formFile">
                        </div>
                    </div>
                    <form>
                        <div class="row">
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">Company Name</label>
                                <input type="text" class="form-control" value="Fleet Improvements Pvt">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" value="support@fleetimprovements.com">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">First Name</label>
                                <input type="text" class="form-control" value="Melissa">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">Last Name</label>
                                <input type="text" class="form-control" value="Doe">
                            </div>
                            <div class="form-group col-md-6 mb-3 datetimepickers">
                                <label class="form-label">Date of Founded</label>
                                <div class="input-group date" id="datetimepicker-01" data-target-input="nearest">
                                    <input type="text" class="form-control datetimepicker-input" value="02/03/2012" data-target="#datetimepicker-01">
                                    <div class="input-group-append d-flex" data-target="#datetimepicker-01" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">Phone</label>
                                <input type="text" class="form-control" value="+(123) 345-6789">
                            </div>
                            <div class="form-group col-md-6 mb-3 select-border">
                                <label class="form-label">Sector</label>
                                <select class="form-control basic-select">
                                    <option value="value 01" selected="selected">Taunton, London</option>
                                    <option value="value 02">Needham, MA</option>
                                    <option value="value 03">New Castle, PA</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6 mb-3 mb-md-0">
                                <label class="form-label">Website</label>
                                <input type="text" class="form-control" value="example.com">
                            </div>
                            <div class="form-group col-md-12 mb-0">
                                <label class="form-label">Description</label>
                                <textarea class="form-control" rows="5" placeholder="Use a past defeat as a motivator. Remind yourself you have nowhere to go except up as you have already been at the bottom"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="user-dashboard-info-box">
                    <div class="section-title-02 mb-3">
                        <h4>Social Links</h4>
                    </div>
                    <form>
                        <div class="row">
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">Facebook</label>
                                <input type="text" class="form-control" value="https://www.facebook.com/">
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <label class="form-label">Twitter</label>
                                <input type="email" class="form-control" value="https://www.twitter.com/">
                            </div>
                            <div class="form-group col-md-12 mb-0">
                                <label class="form-label">Linkedin</label>
                                <input type="text" class="form-control" value="https://www.linkedin.com/">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="user-dashboard-info-box">
                    <div class="section-title-02 mb-3">
                        <h4>Address</h4>
                    </div>
                    <form>
                        <div class="row">
                            <div class="form-group col-md-12 mb-3">
                                <label class="form-label">Enter Your  location</label>
                                <input type="text" class="form-control" value="214 West Arnold St. New York, NY 10002" placeholder="Enter Your  location">
                            </div>
                        </div>
                        <div class="location-map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3027.6199313908783!2d-74.09468078428908!3d40.63826305005958!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1s214+West+Arnold+St.+New+York%2C+NY+10002!5e0!3m2!1sen!2sin!4v1559195958100!5m2!1sen!2sin" height="370" style="border:0" allowfullscreen></iframe>
                        </div>
                    </form>
                </div>
                <a class="btn btn-md btn-primary" href="#">Save Settings</a>
            </div>
        </div>
    </div>
</section>
<!--=================================
My Profile -->