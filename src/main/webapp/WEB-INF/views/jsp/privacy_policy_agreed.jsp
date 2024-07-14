<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--=================================
Terms and conditions -->

<section class="space-ptb">
    <div class="container">
        <div class="col-md-12">
            <%@ include file="termsMenuInclude.jsp"%>
            <div class="tab-content">
                <div class="tab-pane fade active show" id="tab-06" role="tabpanel" aria-labelledby="tab-03">
                    <p class="mt-4 mb-20">${termsTypeCode10.termsContent}</p>
                </div>
                <div class="tab-pane fade" id="tab-07" role="tabpanel" aria-labelledby="tab-04">
                    <p class="mt-4 mb-20">${termsTypeCode20.termsContent}</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Terms and conditions -->
