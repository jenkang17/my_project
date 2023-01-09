<div class="bottom-fixed">
    <div class="container-fluid">
        <div class="row mx-0">
            <div class="col-sm-12 col-md-4 col-lg-4 real-time">
                <div class="box">
                    <p>실시간 입금 현황</p>
                    <div class="list-wrap">
                        <ul id="verticalTiker1">
                            <li>
                                <span>2022-11-05</span>
                                <span>100,000</span>
                                <span>kt*******1</span>
                            </li>
                            <li>
                                <span>2022-11-06</span>
                                <span>100,000</span>
                                <span>kt*******1</span>
                            </li>
                            <li>
                                <span>2022-11-07</span>
                                <span>100,000</span>
                                <span>kt*******1</span>
                            </li>
                            <li>
                                <span>2022-11-08</span>
                                <span>100,000</span>
                                <span>kt*******1</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-4 real-time">
                <div class="box">
                    <p>실시간 출금 현황</p>
                    <div class="list-wrap">
                        <ul id="verticalTiker2">
                            <li>
                                <span>2022-11-05</span>
                                <span>100,000</span>
                                <span>kt*******1</span>
                            </li>
                            <li>
                                <span>2022-11-06</span>
                                <span>100,000</span>
                                <span>kt*******1</span>
                            </li>
                            <li>
                                <span>2022-11-07</span>
                                <span>100,000</span>
                                <span>kt*******1</span>
                            </li>
                            <li>
                                <span>2022-11-08</span>
                                <span>100,000</span>
                                <span>kt*******1</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-4 ntc-box">
                <div class="box">
                    <p>공지사항 </p>
                    <div class="list-wrap">
                        <ul>
                            <%
                                sql = "SELECT TOP 4 * FROM notify ORDER BY updatetime DESC"
                                RS.Open SQL, dbcon, 3
                                if (RS.BOF and RS.EOF) then
                            %>
                                <li>
                                    <a href="#" class="ntc">
                                        공지사항이 없습니다.
                                    </a>
                                </li>
                            <%
                                else 
                                    Do while (NOT RS.EOF) and (4 > 0 )
                                    tn_id = trim(rs("id"))
                                    tn_title = trim(rs("title"))
                                    tn_updatetime = trim(rs("updatetime"))
                            %>
                                    <li>
                                        <% if Session("IU_ID") <> "" then %>
                                        <a href="#boardModal" class="ntc" data-bs-toggle="modal" onclick="boardView(<%=tn_id%>);">
                                        <% else %>
                                        <a href="#memberModal" class="ntc" data-bs-toggle="modal">
                                        <% end if %>
                                            <span><%=tn_id%></span>
                                            <span><%=tn_title%></span>
                                            <span><%=left(tn_updatetime, 11)%></span>
                                        </a>
                                    </li>
                            <%
                                RS.MoveNext
                                Loop
                            end if
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>