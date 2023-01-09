<!--#include virtual="/include/dbcon.asp"-->
<%
    mode = RequestAllUS("mode", 50)

    if mode = "" then
        response.write "error"
        response.end
    end if 

    if mode = "login" Then
        userip = RequestAllUS("userip", 50)
        userid = RequestAllUS("userid", 50)
        userpw = RequestAllUS("userpw", 50)

        'response.write userip & userid & userpw
        if userip = "" or userid = "" or userpw = "" then
            response.write "error"
            response.end
        end if 
        

        sql = "SELECT * FROM members WHERE userid = '"& userid &"'"
        set RS = dbcon.execute(sql)

        if not Rs.eof Then
            user_idx = trim(rs("id"))
            user_id = trim(rs("userid"))
            user_nick = trim(rs("nickname"))
            user_pw = trim(rs("password"))
            isonline = trim(rs("isonline"))
            status = trim(rs("status"))
            level = trim(rs("level"))
        end if

        sql = "SELECT count(*) AS black_ip FROM blackips WHERE ip = '"& userip &"'"
        set RS = dbcon.execute(sql)
        if not Rs.eof Then
            black_ip = trim(rs("black_ip"))
        end if

        if user_idx <> "" Then
            if userpw = user_pw then

                '----- 접속제한 ------
                if isonline = 1 then
                    response.write "isonline" ' 접속중인 계정
                    response.end
                end if

                if status = 1 then
                    response.write "status" ' 접속 제한 계정
                    response.end
                end if

                if level <> 1 then
                    response.write "level" ' 일반 유저 계정이 아닌 계정
                    response.end
                end if

                if black_ip > 0 then
                    response.write "black_ip" ' 아이피 제한
                    response.end
                end if 

                Session("CODE") = ""
                Session("IU_ID") = ""
                Session("IU_IDX") = ""
                Session("IU_NICK") = ""


                Dim randStr, strlen, code, r
                randStr="123456789"
                strlen=5

                Randomize
                For i=1 To strlen
                    r = Int((9-1+1) * Rnd() + 1)
                    code = code+Mid(randStr,r,1)
                Next
                code = code + user_idx

                Session("CODE") = code
                Session("IU_ID") = user_id
                Session("IU_IDX") = user_idx
                Session("IU_NICK") = user_nick
                Session.Timeout = 1440

                response.write "0" ' 로그인 성공
                response.end
            else
                response.write "-2" ' 비밀번호 오류
                response.end
            end if
        else
            response.write "-1" '계정 없음
            response.end
        end if

    elseif mode = "get_info" Then

        if Session("IU_ID") = "" then
            response.write "error"
            response.end
        end if 

        'sql = "SELECT * FROM members WHERE userid = '"& Session("IU_ID") &"'"
        sql = "SELECT a.*, b.* FROM members AS a LEFT JOIN jungle_gold.dbo.users AS b ON a.id = b.muid WHERE a.userid = '" & Session("IU_ID") & "'"
        set RS = dbcon.execute(sql)

        if not Rs.eof Then
            user_idx = trim(rs("id"))
            user_id = Session("IU_ID")
            user_nick = trim(rs("nickname"))
            user_money = trim(rs("gamemoney"))
            user_phone = trim(rs("phonenumber"))
            user_bank = trim(rs("bankname"))
            user_account = trim(rs("bankaccount"))
        end if

        data = user_idx & "," & user_id & "," & user_nick & "," & user_money & "," & user_phone & "," & user_bank & "," & user_account
        
        response.write data
        response.end

    elseif mode = "logout" Then

        Session("CODE") = ""
        Session("IU_ID") = ""
        Session("IU_NICK") = ""
        Session.Abandon
    
    elseif mode = "session_out" Then

        Session("CODE") = ""
        Session("IU_ID") = ""
        Session("IU_NICK") = ""
        Session.Abandon

        response.write "<script>location.href='/'</script>"
        response.end

    end if
%>