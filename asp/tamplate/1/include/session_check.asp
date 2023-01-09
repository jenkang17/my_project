<%
    if Session("IU_ID") = "" then
        response.write "<script>alert('서버와의 연결이 끊어졌습니다. 다시 로그인해주세요.'); location.href='/member/proc.asp?mode=session_out';</script>"
        response.end
    end if
%>