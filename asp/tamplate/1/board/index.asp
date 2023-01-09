<!--#include virtual="/include/dbcon.asp"-->
<!--#include virtual="/include/session_check.asp"-->
<!DOCTYPE html>
<html class="has-sidemenu" lang="en-US" dir="ltr">

<head>
    <!--#include virtual="/include/head.asp"-->
</head>

<body class="overflow-hidden-x deposit-wrap px-4">
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main min-vh-100 py-3" id="top">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="col nav-item" role="presentation">
                <button class="nav-link active" id="ntc-tab" data-bs-toggle="tab" data-bs-target="#ntc-tab-pane"
                    type="button" role="tab" aria-controls="ntc-tab-pane" aria-selected="true">공지사항</button>
            </li>
            <li class="col nav-item" role="presentation">
                <button class="nav-link" id="cs-tab" data-bs-toggle="tab" data-bs-target="#cs-tab-pane"
                    type="button" role="tab" aria-controls="cs-tab-pane" aria-selected="false">고객센터</button>
            </li>
            <li class="col nav-item" role="presentation">
                <button class="nav-link" id="qna-tab" data-bs-toggle="tab" data-bs-target="#qna-tab-pane"
                    type="button" role="tab" aria-controls="qna-tab-pane" aria-selected="false">자주 묻는 질문</button>
            </li>
        </ul>
        <div class="tab-content py-4" id="myTabContent">
            <div class="tab-pane fade show active" id="ntc-tab-pane" role="tabpanel" aria-labelledby="ntc-tab"
                tabindex="0">

                <!-- LIST -->
                <div class="table-box">
                    <table class="table-style2">
                        <colgroup>
                            <col width="80%">
                            <col width="20%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <div class="btn-box text-center py-4">
                        <button type="button" class="btn-light btn btn-sm" onclick="listMore('notice', 3);">더보기</button>
                    </div>
                </div>
                <!-- //LIST -->

            </div>
            <div class="tab-pane fade" id="cs-tab-pane" role="tabpanel" aria-labelledby="cs-tab"
                tabindex="0">

                <!-- WRITE -->
                <div class="write-box mb-6">
                    <form id="csFrm">
                        <textarea name="ask" id="" placeholder="문의 내용을 입력해주세요."></textarea>
                        <div class="text-center mt-4">
                            <button type="button" class="btn-danger btn" onclick="accountAsk();">계좌문의</button>
                            <button type="button" class="btn-dark btn ms-2" onclick="insertAsk();">등록</button>
                        </div>
                    </form>
                </div>
                <!-- //WRITE -->

                <!-- LIST -->
                <div class="accordion-box">
                    <div class="accordion custom-accordion" id="csAccordion"></div>
                    <div class="btn-box text-center py-4">
                        <button type="button" class="btn-light btn btn-sm" onclick="listMore('customer', 3);">더보기</button>
                    </div>
                </div>
                <!-- //LIST -->
            </div>
            <div class="tab-pane fade" id="qna-tab-pane" role="tabpanel" aria-labelledby="qna-tab"
                tabindex="0">

                <!--#include virtual="/board/include/qna.asp"-->
                
            </div>
        </div>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->


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

        // 파라미터 받기
        var tab = $.fn.getUrlParameter('tab');
        var page = $.fn.getUrlParameter('page');
        if( !page || page.length == 0)
        {
            page = 1;
        }

        $(document).ready(function () {

            ntcList();
            csList();

             // 파라미터 값에 따라 탭 활성화
            if (tab == "1" || !tab) {
                $(".nav-tabs .nav-link").removeClass().addClass("nav-link");
                $(".tab-pane").removeClass().addClass("tab-pane fade");
                $("#ntc-tab").removeClass().addClass("nav-link active");
                $("#ntc-tab-pane").removeClass().addClass("tab-pane fade show active");
            }
            else if (tab == "2") {
                $(".nav-tabs .nav-link").removeClass().addClass("nav-link");
                $(".tab-pane").removeClass().addClass("tab-pane fade");
                $("#cs-tab").removeClass().addClass("nav-link active");
                $("#cs-tab-pane").removeClass().addClass("tab-pane fade show active");
            }
            else if (tab == "3") {
                $(".nav-tabs .nav-link").removeClass().addClass("nav-link");
                $(".tab-pane").removeClass().addClass("tab-pane fade");
                $("#qna-tab").removeClass().addClass("nav-link active");
                $("#qna-tab-pane").removeClass().addClass("tab-pane fade show active");
            }
            else
            {
                $(".nav-tabs .nav-link").removeClass().addClass("nav-link");
                $(".tab-pane").removeClass().addClass("tab-pane fade");
                $("#ntc-tab").removeClass().addClass("nav-link active");
                $("#ntc-tab-pane").removeClass().addClass("tab-pane fade show active");
            }
        })

    </script>
</body>

</html>