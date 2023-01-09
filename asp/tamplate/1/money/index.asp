<!--#include virtual="/include/dbcon.asp"-->
<!--#include virtual="/include/session_check.asp"-->
<!DOCTYPE html>
<html class="has-sidemenu" lang="en-US" dir="ltr">

<head>
    <!--#include virtual="/include/head.asp"-->
</head>

<% if Session("IU_ID") <> "" then %>
<body class="overflow-hidden-x deposit-wrap px-4" onload="getUserInfo()">
<% else %>
<body class="overflow-hidden-x deposit-wrap px-4">
<% end if %>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main min-vh-100 py-3" id="top">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="col nav-item" role="presentation">
                <button class="nav-link active" id="deposit-tab" data-bs-toggle="tab" data-bs-target="#deposit-tab-pane" type="button"
                    role="tab" aria-controls="deposit-tab-pane" aria-selected="true">입금 신청</button>
            </li>
            <li class="col nav-item" role="presentation">
                <button class="nav-link" id="exchange-tab" data-bs-toggle="tab" data-bs-target="#exchange-tab-pane" type="button"
                    role="tab" aria-controls="exchange-tab-pane" aria-selected="false">출금 신청</button>
            </li>
            <li class="col nav-item" role="presentation">
                <button class="nav-link" id="point-tab" data-bs-toggle="tab" data-bs-target="#point-tab-pane" type="button"
                    role="tab" aria-controls="point-tab-pane" aria-selected="false">포인트 전환</button>
            </li>
        </ul>
        <div class="tab-content py-4" id="myTabContent">
            <div class="tab-pane fade show active" id="deposit-tab-pane" role="tabpanel" aria-labelledby="deposit-tab" tabindex="0">
                <!--#include virtual="/money/include/deposit.asp"-->
            </div>
            <div class="tab-pane fade py-4 px-4" id="exchange-tab-pane" role="tabpanel" aria-labelledby="exchange-tab" tabindex="0">
                <!--#include virtual="/money/include/exchange.asp"-->
            </div>
            <div class="tab-pane fade" id="point-tab-pane" role="tabpanel" aria-labelledby="point-tab" tabindex="0">
                <!--#include virtual="/money/include/point.asp"-->
            </div>
        </div>
    </main>

    <!--#include virtual="/include/script.asp"-->

    <script>
        //파라미터 GET 함수
        $.fn.getUrlParameter = function (sParam) {
            var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : sParameterName[1];
                }
            }
        };

        // 파라미터 값에 따라 탭 활성화
        var tab = $.fn.getUrlParameter('tab');

        $(document).ready(function(){
            if(tab == "1" || !tab)
            {
                $(".nav-tabs .nav-link").removeClass().addClass("nav-link");
                $(".tab-pane").removeClass().addClass("tab-pane fade");
                $("#deposit-tab").removeClass().addClass("nav-link active");
                $("#deposit-tab-pane").removeClass().addClass("tab-pane fade show active");
            }
            else if (tab == "2")
            {
                $(".nav-tabs .nav-link").removeClass().addClass("nav-link");
                $(".tab-pane").removeClass().addClass("tab-pane fade");
                $("#exchange-tab").removeClass().addClass("nav-link active");
                $("#exchange-tab-pane").removeClass().addClass("tab-pane fade show active");
            }
            else if (tab == "3")
            {
                $(".nav-tabs .nav-link").removeClass().addClass("nav-link");
                $(".tab-pane").removeClass().addClass("tab-pane fade");
                $("#point-tab").removeClass().addClass("nav-link active");
                $("#point-tab-pane").removeClass().addClass("tab-pane fade show active");
            }

            // $.validator.addMethod("idCk", function(value, element){
            //     return this.optional(element) || value.match(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,12}$/);
            // }, "형식에 맞지 않습니다.");
            // $.validator.addMethod("pwCk", function(value, element){
            //     return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=*]).*$/.test(value);
            // }, "형식에 맞지 않습니다.");

            // $("#depositFrm").validate({
            //     onkeyup: false,
            //     onclick: false,
            //     rules: {
            //         requestMoney: { required: true }
            //     },
            //     messages: {
            //         requestMoney: { required: "입금 신청할 금액은 선택해주세요." }
            //     },
            //     submitHandler: function(form) {
            //         $.ajax({
            //             type: "POST",
            //             url: "/money/proc.asp",
            //             data: {mode: 'deposit'},
            //             success: function (data) {
            //                 //Sucess시, 처리
            //                 console.log(data);
            //             },
            //             error: function (jqXHR, textStatus, errorThrown) {
            //                 //Error시, 처리
            //                 alert('server error');
            //             },
            //         });
            //     }
            // });
        })
    </script>
</body>

</html>