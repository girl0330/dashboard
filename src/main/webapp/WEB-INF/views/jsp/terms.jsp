<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    let tab = {
        tabChange : function (termsTypeCode) {
            let jsonData = {}
            jsonData["termsTypeCode"] = termsTypeCode;
            alert(JSON.stringify(termsTypeCode));
            console.log("@@@@:::::: "+JSON.stringify(termsTypeCode));

            const options = {
                url: '/user/ajax/terms',
                type: 'GET',
                contentType: 'application/json',
                data: jsonData,

                done: function(response) {
                    console.log("?? "+JSON.stringify(response ));

                    termsInfo(response, termsTypeCode);
                }
            };
            ajax.call(options);
        }
    };
    function termsInfo(response, termsTypeCode) {
        // termsTypeCode가 10이면 "#tab-06 p"를 선택하고, 그렇지 않으면 "#tab-07 p"를 선택합니다.
        const content = termsTypeCode === 10 ? "#tab-06 p" : "#tab-07 p";

        // 선택된 요소의 텍스트 내용을 서버에서 받은 response.termsContent로 변경합니다.
        $(content).text(response.termsContent);

        // 서버에서 받은 전체 응답을 콘솔에 출력합니다.
        console.log("결과: ", response);
    }


    $(document).ready(function() {
        $("#termsAndConditions").on("click", function () {
            const termsTypeCode = $("#termTypeCode").val();
            console.log("termsTypeCode 타입코드 ::: "+termsTypeCode);
            tab.tabChange(termsTypeCode);
        })
        $("#privacyPolicyAgreed").on("click", function () {
            const termsTypeCode = $("#privacyTypeCode").val();
            console.log("privacyTypeCode 타입코드 ::: "+termsTypeCode);
            tab.tabChange(termsTypeCode);
        })
    });


</script>

<!--=================================
Terms and conditions -->

<section class="space-ptb">
    <div class="container">
        <div class="col-md-12">
            <div class="col-md-6">
                <div class="section-title-02 mt-4 mt-md-0">
                    <h2>이용약관</h2>
                </div>
                <div class="browse-job d-flex titleContainer">
                    <div class="justify-content-start">
                        <ul class="nav nav-tabs nav-tabs-02" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active ms-0" id="termsAndConditions" data-bs-toggle="tab" href="#tab-06" role="tab" aria-selected="true">TAB 01</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="privacyPolicyAgreed" data-bs-toggle="tab" href="#tab-07" role="tab" aria-controls="tab-07" aria-selected="false" >TAB 02</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content contentContainer">
                    <div class="tab-pane fade active show" id="tab-06" role="tabpanel" aria-labelledby="tab-03">
                        <input type="hidden" name="termsTypeCode" id="termTypeCode" value="10">
                        <p class="mt-4 mb-20">${termsTypeCode10.termsContent}</p>
                    </div>
                    <div class="tab-pane fade" id="tab-07" role="tabpanel" aria-labelledby="tab-04">
                        <input type="hidden" name="termsTypeCode" id="privacyTypeCode" value="20">
                        <p class="mt-4 mb-20">${termsTypeCode20.termsContent}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Terms and conditions -->
