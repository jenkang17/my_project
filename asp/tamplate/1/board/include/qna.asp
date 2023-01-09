<!-- LIST -->
<div class="accordion-box">
    <div class="accordion custom-accordion" id="csAccordion">

        <% 
            sql = "SELECT COUNT(*) FROM commonquestion"
            RS.Open SQL, dbcon
            qa_cnt = rs(0)
            rs.close

            sql = "SELECT * FROM commonquestion ORDER BY listnum ASC"
            RS.Open SQL, dbcon, 3

            if (RS.BOF and RS.EOF) then    
            else
                Do while (NOT RS.EOF) and (qa_cnt > 0 )
                qa_id = trim(rs("id"))
                qa_title = trim(rs("title"))
                qa_text = trim(rs("text"))
        %>
        <div class="accordion-item">
            <h2 class="accordion-header" id="qaheading<%=qa_id%>">
                <button class="accordion-button fw-semi-bold collapsed" type="button"
                    data-bs-toggle="collapse" data-bs-target="#qacollapse<%=qa_id%>" aria-expanded="false"
                    aria-controls="qacollapse<%=qa_id%>">
                    <%=qa_title%>
                </button>
            </h2>
            <div class="accordion-collapse collapse" id="qacollapse<%=qa_id%>" aria-labelledby="qaheading<%=qa_id%>"
                data-bs-parent="#csAccordion">
                <div class="accordion-body">
                    <div class="answer-box">
                    </div>
                    <div class="reply-box py-3">
                        <span><%=qa_text%></span>
                    </div>
                </div>
            </div>
        </div>
        <%
            RS.MoveNext
            Loop
        end if
        %>
    </div>
</div>
<!-- //LIST -->