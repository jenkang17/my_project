<!--#include virtual="/include/dbcon.asp"-->
<!--#include virtual="/include/session_check.asp"-->
<%
    mode = RequestAllUS("mode", 50)

    result = 0

    if mode = "deposit" then
        money = RequestNum("requestMoney", 50)

        response.write result
        response.end

    elseif mode = "exchange" then
        money = RequestNum("requestMoney", 50)

        response.write result
        response.end

    elseif mode = "check_pw" then
        request_pw = RequestAllUS("exchangePw", 50)

        sql = "SELECT password FROM members WHERE userid = '" & Session("IU_ID") & "'"
        set RS = dbcon.execute(sql)

        if not Rs.eof Then
            password = RS("password")
        end if

        if request_pw <> password then
            result = "1"
        else
            result = "0"
        end if

        response.write result
        response.end

    end if
%>