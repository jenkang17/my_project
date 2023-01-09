<!--#include virtual="/include/dbcon.asp"-->
<!--#include virtual="/include/session_check.asp"-->
<%
    mode = RequestAllUS("mode", 50)

    if mode = "notice" then
        list_cnt = RequestAllUS("list_cnt", 50)
        'list_cnt = 10
        
        sql = "SELECT TOP " & list_cnt & " * FROM notify ORDER BY updatetime DESC"
        RS.Open SQL, dbcon, 3
        if (RS.BOF and RS.EOF) then
%>
            <tr>
                <td colspan="2" align="cneter">공지사항이 없습니다.</td>
            </tr>
<%        
        else
            Do while (NOT RS.EOF) and (list_cnt > 0 )
            ntc_id = trim(rs("id"))
            ntc_title = trim(rs("title"))
            ntc_text = trim(rs("text"))
            ntc_updatetime = trim(rs("updatetime"))
%>
            <tr>
                <td><a href="/board/view.asp?idx=<%=ntc_id%>"><%=ntc_title%></a></td>
                <td><%=left(ntc_updatetime, 11)%></td>
            </tr>
<%          
            RS.MoveNext
            Loop
        end if

    elseif mode = "customer" then

        list_cnt = RequestAllUS("list_cnt", 50)

        sql = "SELECT TOP " & list_cnt & " * FROM askanswer WHERE userid = '" & Session("IU_ID") & "' AND status = '0' ORDER BY updatetime DESC"
        RS.Open SQL, dbcon, 3
        if (RS.BOF and RS.EOF) then    
        else
            Do while (NOT RS.EOF) and (list_cnt > 0 )
            cs_id = trim(rs("id"))
            cs_ask = trim(rs("ask"))
            cs_answer = trim(rs("answer"))
            cs_updatetime = trim(rs("updatetime"))
%>
            <div class="accordion-item">
                <h2 class="accordion-header" id="heading<%=cs_id%>">
                    <button class="accordion-button fw-semi-bold collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapse<%=cs_id%>" aria-expanded="false"
                        aria-controls="collapse<%=cs_id%>">
                        <%=left(cs_ask, 60)%>

                        <% 
                            if len(cs_ask) > 60  then
                            response.write "..."
                            end if
                        %>

                        <% if cs_answer <> "" then %>
                        <sapn class="reply">Reply</sapn>
                        <% end if %>
                    </button>
                </h2>
                <div class="accordion-collapse collapse" id="collapse<%=cs_id%>" aria-labelledby="heading<%=cs_id%>"
                    data-bs-parent="#csAccordion">
                    <div class="accordion-body">
                        <div class="answer-box py-3">
                            <sapn class="answer mt-1 me-3">Answer</sapn>
                            <span><%=cs_ask%></span>
                        </div>
                        <% if cs_answer <> "" then %>
                        <div class="reply-box py-3">
                            <sapn class="reply mt-1 me-3">Reply</sapn>
                            <span><%=cs_answer%></span><span class="ms-3" style="font-size:12px"><%=left(cs_updatetime, 18)%></span>
                        </div>
                        <% end if %>
                    </div>
                </div>
            </div>
<% 
            RS.MoveNext
            Loop
        end if

    elseif mode = "insert_ask" or mode = "account_ask" then
        list_cnt = RequestAllUS("list_cnt", 50)

        if mode = "insert_ask" Then
            ask = RequestAllUS("ask", 50000)
            answer = NULL
        elseif mode = "account_ask" then
            ask = "빠른계좌문의"
            'answer = "우리은행 102-2773405-101011 홍길동"
            answer = NULL
        end if

        sql = "INSERT INTO askanswer (userid, usn, title, ask, answer, status, updatetime) VALUES('" & Session("IU_ID") & "', '" & Session("IU_IDX") & "', '" & ask & "', '" & ask & "', '" & answer & "', '0', getdate())"
        dbcon.execute(sql)

        sql = "SELECT TOP " & list_cnt & " * FROM askanswer WHERE userid = '" & Session("IU_ID") & "' AND status = '0' ORDER BY updatetime DESC"
        RS.Open SQL, dbcon, 3

        if (RS.BOF and RS.EOF) then
        else
            Do while (NOT RS.EOF) and (list_cnt > 0 )
            cs_id = trim(rs("id"))
            cs_ask = trim(rs("ask"))
            cs_answer = trim(rs("answer"))
            cs_updatetime = trim(rs("updatetime"))
%>
            <div class="accordion-item">
                <h2 class="accordion-header" id="heading<%=cs_id%>">
                    <button class="accordion-button fw-semi-bold collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapse<%=cs_id%>" aria-expanded="false"
                        aria-controls="collapse<%=cs_id%>">
                        <%=left(cs_ask, 60)%>

                        <% 
                            if len(cs_ask) > 60  then
                            response.write "..."
                            end if
                        %>

                        <% if cs_answer <> "" then %>
                        <sapn class="reply">Reply</sapn>
                        <% end if %>
                    </button>
                </h2>
                <div class="accordion-collapse collapse" id="collapse<%=cs_id%>" aria-labelledby="heading<%=cs_id%>"
                    data-bs-parent="#csAccordion">
                    <div class="accordion-body">
                        <div class="answer-box py-3">
                            <sapn class="answer mt-1 me-3">Answer</sapn>
                            <span><%=cs_ask%></span>
                        </div>
                        <% if cs_answer <> "" then %>
                        <div class="reply-box py-3">
                            <sapn class="reply mt-1 me-3">Reply</sapn>
                            <span><%=cs_answer%></span><span class="ms-3" style="font-size:12px"><%=left(cs_updatetime, 18)%></span>
                        </div>
                        <% end if %>
                    </div>
                </div>
            </div>
<%
            RS.MoveNext
            Loop
        end if
    end if
%>