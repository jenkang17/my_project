<section class="font-sans-serif text-center py-0 bg-dark marquee-wrap">
    <div class="container-fluid">
        <div class="notice-marquee px-3 pt-3 pb-2">
            <MARQUEE id="NewsMarQuee" onmouseover="stop()" onmouseout="start()" style="MARGIN-TOP: 0px; width:100%;" behavior="scroll">
                
                <%
                    sql = "SELECT TOP 5 * FROM notify ORDER BY updatetime DESC"

                    RS.Open SQL, dbcon
                    IF Not (RS.BOF and RS.EOF) Then
                        Do while (NOT RS.EOF)
                        mn_id = RS("id")
                        mn_title = RS("title")
                %>

                        <% if Session("IU_ID") <> "" then %>
                        <a href="#boardModal" class="ntc" data-bs-toggle="modal" style="margin-left: 100px;" onclick="boardView(<%=mn_id%>);">
                        <% else %>
                        <a href="#memberModal" class="ntc" data-bs-toggle="modal" style="margin-left: 100px;">
                        <% end if %>
                            [공지]&nbsp;&nbsp;&nbsp;&nbsp;<%=mn_title%>
                        </a>
                <%
                        RS.MoveNext
                        Loop
                    End if
                    RS.Close
                %>

            </MARQUEE>
        </div>
    </div>
</section>