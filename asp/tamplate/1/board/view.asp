<!--#include virtual="/include/dbcon.asp"-->
<!--#include virtual="/include/session_check.asp"-->
<%
    idx = RequestAllUS("idx", 50)
%>
<!DOCTYPE html>
<html class="has-sidemenu" lang="en-US" dir="ltr">

<head>
    <!--#include virtual="/include/head.asp"-->
</head>

<body class="overflow-hidden-x px-4">
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <%
        sql = "select * from notify where id =" & idx
        set RS = dbcon.execute(sql)

        if not Rs.eof Then
            title = rs("title")
            text = rs("text")
            updatetime = rs("updatetime")
        end if

    %>
    <main class="main min-vh-100 py-3" id="top">
        <div class="view-header p-2 mb-3 flex-between-center">
            <!-- <span class="me-2" id="boardIdx"></span> -->
            <span><%=title%></span>
            <span class="date"><%=left(updatetime, 11)%></span>
        </div>
        <div class="view-body">
            <p>
                <%=text%>
            </p>
        </div>
        <div class="view-footer text-center py-4">
            <a href="/board/index.asp?tab=1" class="btn-light btn">목록</a>
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
        var idx = $.fn.getUrlParameter('idx');
        // $(document).ready(function () {
        //     $("#boardIdx").text(idx);
        // })

    </script>
</body>

</html>