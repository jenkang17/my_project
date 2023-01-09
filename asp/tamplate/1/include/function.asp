<%
	Sub SbMsgBox(sText, sAction)
		Response.Write "<script language='javascript'> " & VbCrLf
		Response.Write "Swal.fire({" & VbCrLf
		Response.Write "title: '" & sText & "'," & VbCrLf
		Response.Write "confirmButtonText: `닫기`," & VbCrLf
		Response.Write "}).then((result) => {" & VbCrLf  
        Response.Write "if (result.isConfirmed) {" & VbCrLf
		Response.Write  sAction & VbCrLf
		Response.Write "}" & VbCrLf
		Response.Write "})" & VbCrLf
		Response.Write "</script> " & VbCrLf
		Response.End
	End Sub

	Sub SbMsgBox1(sText, sAction)
		Response.Write "<script language='javascript'> " & VbCrLf
		Response.Write "	alert('" & sText & "'); " & VbCrLf
		Response.Write sAction & VbCrLf
		Response.Write "</script> " & VbCrLf
		Response.End
	End Sub

	Function fncCheckLogin(nGrade)
		If Session("LOGINID") = "" Or Session("GRADE") <> nGrade Then
			fncCheckLogin = False
		Else
			fncCheckLogin = True
		End If 
	End Function 

'----------------------------------------------------------------
' 정규식을 이용한 문자열 치환
' 한글 : [^-가-힝]
' 숫자 : [^-0-9]
' 영문 : [^-a-zA-Z]
' 영문+숫자 : [^-a-zA-Z0-9/]
' 한글+영문+숫자 : [^-가-힝a-zA-Z0-9/]
' 스트립트 : \<(\/?)(ㄴㅊ갸ㅔㅅ)([^<>]*)>
' 태그이외 : <[^>]*>
'----------------------------------------------------------------
Function RegReplace(str, pattern)
	Dim objRegExp, strOutput

	Set objRegExp = New RegExp


	objRegExp.Pattern = pattern		' 패턴설정
	objRegExp.IgnoreCase = True		' 대소문자 구문안함
	objRegExp.Global = True			' 전체문자 검색

	strOutput = objRegExp.Replace(str, "")
	Set objRegExp = Nothing

	RegReplace = strOutput
End Function

' 영어만 받아온다
Function RequestEng(param, length)
	RequestEng = Left(RegReplace(request(param), "[^a-zA-Z]"), length)
End Function

' 한글만 받아온다
Function RequestKor(param, length)
	RequestKor = Left(RegReplace(request(param), "[^가-힝]"), length)
End Function

' 한글만 받아온다 (UTF-8)
Function RequestKorU(param, length)
	RequestKorU = Left(RegReplace(request(param), "[^\uac00-\ud7af\u3130-\u318f\u1100-\u11FF]"), length)
End Function 

' 숫자만 받아온다 
Function RequestNum(param, length)
	RequestNum = Left(RegReplace(request(param), "[^[+-]?\d*$]"), length)
End Function

' 한글+영어+숫자만 받아온다 
Function RequestAll(param, length)
	RequestAll = Left(RegReplace(request(param), "[^가-힝a-zA-Z0-9]"), length)
End Function

' 한글+영어+숫자만 받아온다 (UTF-8)
Function RequestAllU(param, length)
	RequestAllU = Left(RegReplace(request(param), "[^\uac00-\ud7af\u3130-\u318f\u1100-\u11FFa-zA-Z0-9]"), length)
End Function

' 숫자(음수,실수 포함)만 받아온다 
Function RequestFNum(param, length)
	RequestFNum = Left(RegReplace(request(param), "[^[+-]?\d*(\.?\d)$]"), length)
End Function

' 한글+영어+숫자+특수문자(32개)만 받아온다 
Function RequestAllS(param, length)
	RequestAllS = Left(RegReplace(request(param), "[^가-힝a-zA-Z0-9!\""\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~]"), length)
End Function

' 한글+영어+숫자+특수문자(32개)만 받아온다 (UTF-8)
Function RequestAllUS(param, length)
	RequestAllUS = Left(RegReplace(request(param), "[^\uac00-\ud7af\u3130-\u318f\u1100-\u11FFa-zA-Z0-9!\""\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~]"), length)
End Function



' ######################################################################
'	Function name	: checkResNo
'	Parameter		:
'			resno1						= 주민등록번호 앞자리
'			resno2						= 주민등록번호 뒷자리
'	Return				: Boolean
'	Description		: 주민등록번호 유효성 확인
' ######################################################################
Function checkResNo(ByVal resno1, ByVal resno2)
	Dim resno
	Dim arrKey
	Dim total, result
	Dim f

	checkResNo = False

	total = 0
	resno = resno1 & resno2

	If Len(resno) <> 13 Then Exit Function

	arrKey = Array(2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5)
	For f=1 To 12
		total = total + (CInt(Mid(resno, f, 1)) * arrKey(f - 1))
	Next

	result = (11 - (total Mod 11)) Mod 10

	If CStr(result) = Mid(resno, 13, 1) Then checkResNo = True
End Function

Function Money2String(money)
	Dim result : result = ""
	Dim nLen : nLen = Len(money)
	Dim bZero : bZero = True
	Dim strMoney : strMoney = ""

	For i=nLen To 1 Step -1
		cChar = mid(money, nLen-i+1, 1)
		If cChar <> "0" Then
			bZero = False
		end If
		strMoney = strMoney & cChar
		Select Case ((i-1)/4)
			Case 3: 
				If bZero = False Then
					strMoney = CStr(CInt(strMoney)) & "조"
				Else
					strMoney = ""
				End If
				result = result & strMoney
				bZero = True
				strMoney = ""
			Case 2: 
				If bZero = False Then
					strMoney = CStr(CInt(strMoney)) & "억"
				Else
					strMoney = ""
				End If
				result = result & strMoney
				bZero = True
				strMoney = ""
			Case 1: 
				If bZero = False Then
					strMoney = CStr(CInt(strMoney)) & "만"
				Else
					strMoney = ""
				End If
				result = result & strMoney
				bZero = True
				strMoney = ""
			Case 0: 
				If bZero = False Then
					strMoney = CStr(CInt(strMoney))
				Else
					strMoney = ""
				End If
				result = result & strMoney
				bZero = True
				strMoney = ""
		End Select
	next
	
	If result = "" Then result="0"

	Money2String = result
End Function

'//////////////////////////////////////////////////////
'//																									 //
'//		골드 금액 환산 함수 - 1 -											 //
'//																									 //
'//		조단위 이상 구현 안함													 //
'//																									 //
'//////////////////////////////////////////////////////
Function money2str(mstr)
	Dim cmoney, temp1, temp2, temp3, temp4

	cmoney = ""
	temp1 = FIX( mstr/1000000000000)
	temp2 = FIX((mstr/100000000) - ((temp1*1000000000000)/100000000))
	temp3 = FIX((mstr/10000) - (((temp1*1000000000000)/10000) + ((temp2*100000000)/10000)))
	temp4 = FIX((mstr) - (((temp1*1000000000000)) + ((temp2*100000000)) + ((temp3*10000))))
	If temp1 > 0 Then
		cmoney = FormatNumber(temp1,0) & "조"
	Else
		cmoney = cmoney
	End If
	If temp2 > 0 Then
		cmoney = cmoney & FormatNumber(temp2,0) & "억"
	Else
		cmoney = cmoney
	End If
	If temp3 > 0 Then
		cmoney = cmoney & FormatNumber(temp3,0) & "만"
	Else
		cmoney = cmoney
	End If
	If temp4 > 0 Then
		cmoney = cmoney & FormatNumber(temp4,0)
	Else
		cmoney = cmoney
	End If
	If cmoney = "" Then
		cmoney = "0"
	End If
	money2str = cmoney
End Function


'//////////////////////////////////////////////////////
'//																									 //
'//		골드 금액 환산 함수 - 2 -   									 //
'//																									 //
'//		무한루프 돌아감																 //
'//																									 //
'//////////////////////////////////////////////////////
Function money_format(mstr)
    mstr				= CStr(Int(mstr))
    str_left		= mstr
    str_right		= ""
    money_point = Split(" ,만,억,조,경,해,시",",")
    i = 0
    Do While Len(str_left) > 4
		str_length = Len(str_left)
		If str_length > 4 Then
			str_right_temp = Right(str_left,4)
			If Len(str_right_temp) = 4 Then
				str_right_temp = FormatNumber(str_right_temp,0)
			End If
			If str_right_temp = "" Then
				If i = 0 Then
					If str_right > 0  Then
						str_right = str_right & money_point(i)
					Else
						str_right = ""
					End If
				End If
			Else
				If str_right_temp >0 Then
					str_right = str_right_temp & money_point(i) & str_right
				End If
			End If
			str_left = Mid(str_left,1,str_length-4)
		End If
		i = i + 1
	Loop
    If Len(str_left) = 4 Then str_left = FormatNumber(str_left,0) End If
    money_format = str_left&money_point(i)&str_right
End Function



Dim ShopCon
Dim PinCon
Sub Shop_DbOpen()
	Set ShopCon = Server.CreateObject("ADODB.Connection")
	ShopCon.Open  "Driver={MySQL ODBC 3.51 driver}; Server=localhost; Database=durishop; uid=root;pwd=abc1234; "'stmt=SET NAMES 'utf8';

	'ShopCon.Execute("set names euckr")
End Sub

Sub Pin_DbOpen()
	Set PinCon = Server.CreateObject("ADODB.Connection")
	PinCon.Open  "Driver={MySQL ODBC 3.51 driver}; Server=localhost; Database=pinball; uid=root;pwd=abc1234;"

	'ShopCon.Execute("set names euckr")
End Sub

Sub Shop_DbClose()
	Set ShopCon = Nothing
End Sub

Sub Pin_DbClose()
	Set PinCon = Nothing
End Sub

Function Shop_MemberInsert(userid, userpw, rname, nick, birth, email, ip)
	Call Shop_DbOpen()

	'Session.CodePage = 65001
	'Response.CharSet = "euc-kr"

	sql = "INSERT INTO g5_member "
	sql = sql & " set mb_id = '" & userid & "'"
	sql = sql & ", mb_password = '_DURIGAME_'"
	sql = sql & ", mb_name = '" & rname & "'"
	sql = sql & ", mb_nick = '" & nick & "'"
	sql = sql & ", mb_birth = '" & birth & "'"
	sql = sql & ", mb_email = '" & email & "'"
	sql = sql & ", mb_ip = '" & ip & "'"
	sql = sql & ", mb_level = 2"
	sql = sql & ", mb_datetime = now()"
	sql = sql & ", mb_open_date = now()"
	sql = sql & ", mb_signature = ''"
	sql = sql & ", mb_lost_certify = ''"
	sql = sql & ", mb_profile = ''"
	sql = sql & ", mb_memo = '';"

	ShopCon.Execute(sql)

	Call Shop_DbClose()
End Function

Function Shop_MemberUpdate(userid, userpw)
	Call Shop_DbOpen()

	'Session.CodePage = 65001
	'Response.CharSet = "euc-kr"

	sql = "UPDATE g5_member "
	sql = sql & " SET "
	sql = sql & " mb_password = '" & userpw & "'"
	sql = sql & ",mb_nick = '" & "김개똥" & "'"
	sql = sql & " WHERE mb_id = '" & userid & "';"

	ShopCon.Execute(sql)

	Call Shop_DbClose()
End Function

' 사용 안함
Function insert_point(mb_id, point, content)
	If 1= 0 Then
		On Error Resume Next

		'point = point / 1

		Call Shop_DbOpen()

		Set rs = Server.CreateObject("ADODB.RecordSet")
		
		sql = "SELECT IFNULL(sum(po_point),0) FROM  g5_point "
		sql = sql & " WHERE mb_id = '" & mb_id & "';"
		'Response.Write sql

		rs.Open sql, ShopCon
		
		If Not rs.Eof Then
			mb_point = rs(0)
		
			po_expired = 0
			po_expire_date = "9999-12-31"

			If point < 0 Then
				po_expired = 1
				po_expire_date = left(now(), 10)
			End If

			po_mb_point = CDbl(mb_point) + CDbl(point / 1)
			po_expired = 0

			sql = "	insert into g5_point "
			sql = sql & " set mb_id = '" & mb_id & "',"
			sql = sql & " 	po_datetime = '" & yymmdd() & "',"
			sql = sql & " 	po_content = '" & content & "',"
			sql = sql & " 	po_point = '" & (point / 1) & "',"
			sql = sql & " 	po_use_point = '0',"
			sql = sql & " 	po_mb_point = '" & po_mb_point & "',"
			sql = sql & " 	po_expired = '" & po_expired & "',"
			sql = sql & " 	po_expire_date = '" & po_expire_date & "',"
			sql = sql & " 	po_rel_table = '@duri',"
			sql = sql & " 	po_rel_id = '" & mb_id & "',"
			sql = sql & " 	po_rel_action = '' "
			'Response.Write sql
			ShopCon.Execute(sql)

			sql = "UPDATE g5_member "
			sql = sql & " SET "
			sql = sql & " mb_point = '" & po_mb_point & "'"
			sql = sql & " WHERE mb_id = '" & mb_id & "';"

			ShopCon.Execute(sql)
		End If

		Set rs = Nothing

		Call Shop_DbClose()
	End If
End Function

'***************************************************************
'사용 안함
'***************************************************************
Function insert_use_point(mb_id, point, content)
	'On Error Resume Next

	Call Shop_DbOpen()

	sql = " select po_id, po_point, po_use_point "
	sql = sql & " from g5_point "
    sql = sql & " where mb_id = '" & mb_id & "' "
    'sql = sql & " and po_id <> '$po_id' "
    sql = sql & " and po_expired = '0' "
    sql = sql & " and po_point > po_use_point "
    sql = sql & " order by po_id asc  "

	Set rs = ShopCon.Execute(sql)

	point1 = abs(point)

	If Not rs.Eof Then
		Do Until rs.Eof
			point2 = rs("po_point")
			point3 = rs("po_use_point")

			if (point2 - point3) > point1 then
				sql = " update g5_point "
				sql = sql & " set po_use_point = po_use_point + '" & point1 & "' "
				sql = sql & " where po_id = '" & rs("po_id") & "' "
				ShopCon.Execute(sql)
				Exit Do
			else
				point4 = point2 - point3
				sql = " update g5_point "
				sql = sql & " set po_use_point = po_use_point + '" & point4 & "', "
				sql = sql & " po_expired = '100' "
				sql = sql & " where po_id = '" & rs("po_id") & "' "
				ShopCon.Execute(sql)

				point1 = point1 - point4
			end if
			rs.MoveNext
		Loop
	End If

	Call Shop_DbClose()
End Function

Function yymmdd()
	yymmdd = year(now()) & right("0" & month(now()), 2) & right("0" & day(now()), 2) & right("0" & hour(now()), 2) & right("0" & minute(now()), 2) & right("0" & second(now()), 2)
End Function

Function pinConnectCheck(mb_id)
	On Error Resume Next

	Call Pin_DbOpen()

	Set rs = Server.CreateObject("ADODB.RecordSet")
	
	sql = "SELECT * FROM  current_connect "
	sql = sql & " WHERE userid = '" & mb_id & "';"
	'Response.Write sql

	rs.Open sql, PinCon
	
	If Not rs.Eof Then
		pinConnectCheck = true
	Else
		pinConnectCheck = false
	End If

	Set rs = Nothing

	Call Pin_DbClose()
End Function

Function pinMoneyCheck(mb_id)
	'On Error Resume Next

	Call Pin_DbOpen()

	Set rs = Server.CreateObject("ADODB.RecordSet")
	
	sql = "SELECT * FROM  muser "
	sql = sql & " WHERE id = '" & mb_id & "';"
	'Response.Write sql

	rs.Open sql, PinCon
	
	If rs.Eof Then
		pinMoneyCheck = true
	Else
		hour24money	= rs("hour24money")
		hour24date	= CStr(rs("hour24date"))

		Response.Write hour24money & "<br>"
		Response.Write hour24date & "<br>"

		If hour24money = null Then
			hour24money = 0
		End If

		If hour24money >= -100000000 Or hour24date < Left(now(), 10) Then
			pinMoneyCheck = true
		Else 
			pinMoneyCheck = false
		End If
	End If

	Set rs = Nothing

	Call Pin_DbClose()
End Function

Function member_update(mb_id, nick, realname, tel)
	'On Error Resume Next"
	'Response.CodePage = 65001
	'Response.LCID = 1060
	'Response.ContentType = "html/text"
	'Response.ChaRset = "utf-8"
	Call Shop_DbOpen()

	'ShopCon.Execute("set names 'utf8'")
	'ShopCon.Execute("")
	sql = " update g5_member set "
	sql = sql & " mb_nick = '" & nick & "3' "
	sql = sql & " , mb_nick_date = '" & left(now(),10) & "' "
	If realname <> "" Then
		sql = sql & " , mb_name = '" & realname & "' "
	End If
	If tel <> "" Then
		sql = sql & " , mb_hp = '" & tel & "' "
	End If
    sql = sql & " where mb_id = '" & mb_id & "' "
	ShopCon.Execute(sql)

	Call Shop_DbClose()
End Function

Function member_update_ajax(mb_id, userpw, nick, realname, tel)
	Dim xmlhttp
	Set xmlhttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
	xmlhttp.setTimeouts 30,500,1000,1000
	xmlhttp.Open "GET", "http://bngshop.kr/bbs/durigame_member_update_ajax.php?mb_id=" & mb_id & "&mb_password=" & userpw & "&mb_nick=" & nick & "&mb_name=" & realname & "&tel=" & tel , false
	'Response.Write "http://bngshop.kr/bbs/durigame_member_update_ajax.php?mb_id=" & mb_id & "&mb_password=" & userpw & "&mb_nick=" & nick & "&mb_name=" & realname & "&tel=" & tel
	'On Error Resume Next
	xmlhttp.Send
	
	If Err.Number Then
		'Response.Write "Error"
		member_update_ajax = "Error"
		Err.Clear
	Else
		member_update_ajax = xmlhttp.ResponseText
		'Response.Write xmlhttp.ResponseText
	End If
	'Response.Write "ok"
	Set xmlhttp = nothing
End Function

Dim stop_yn
Dim stop_message
Function fncGetStopConfig()
	SbDbConn objConn

	sql = "SELECT * FROM StopConfig "
	Set cRs = Server.CreateObject("ADODB.RecordSet")
	cRs.Open sql, objConn

	If Not cRs.Eof Then
		stop_yn = cRs("stop_yn")
		stop_message = cRs("stop_message")
	End If

	Set cRs = Nothing

	SbDBClose objConn

	' 중지 페이지로
	'If stop_yn = "Y" And Instr(LCase(Request.ServerVariables("PATH_INFO")), "index_stop") = 0 Then
	'	Response.Redirect "/index_stop.asp"
	'End If

	' 중지 페이지로
	'If stop_yn = "N" And Instr(LCase(Request.ServerVariables("PATH_INFO")), "index_stop") > 0 Then
	'	Response.Redirect "/index_md.asp"
	'End If
End Function


'////////////////////////////////////////////////////////////////////////////////////////////////
'// Function name:  pageUrlList
'// Description:    페이지url 가져오기
'// @param:         
'// Author: 강서현        
'// Date:   2021-01-25        
'// Update ver.:    
'////////////////////////////////////////////////////////////////////////////////////////////////
Function pageUrlList()
	str_url = Trim(request.servervariables("HTTP_url"))
	str_url = Split(str_url,"?")
	pageUrlList = str_url(0)
End Function

'////////////////////////////////////////////////////////////////////////////////////////////////
'// Function name:  fn_tel_dash
'// Description:    전화번호 대쉬 추가
'// @param:         
'// Author: 강서현        
'// Date:   2021-01-20        
'// Update ver.:    
'////////////////////////////////////////////////////////////////////////////////////////////////
Function fn_tel_dash(str_data)
	str_data = fn_tel_dash_no(str_data)
	If Len(str_data) =11 Then
		str_data = Left(str_data,3) & "-" & Mid(str_data,4,4) & "-" & Right(str_data,4)
	Else
		str_data = Left(str_data,3) & "-" & Mid(str_data,4,3) & "-" & Right(str_data,4)
	End If
	fn_tel_dash = str_data
End Function

'////////////////////////////////////////////////////////////////////////////////////////////////
'// Function name:  fn_tel_dash_no
'// Description:    전화번호 대쉬 삭제
'// @param:         
'// Author: 강서현        
'// Date:   2021-01-20        
'// Update ver.:    
'////////////////////////////////////////////////////////////////////////////////////////////////
Function fn_tel_dash_no(str_data)
	str_data = Replace(str_data,"-","")
	fn_tel_dash_no = str_data
End Function

'////////////////////////////////////////////////////////////////////////////////////////////////
'// Function name:  fncPaging
'// Description:    리스트 페이징
'// @param:         
'// Author: 강서현        
'// Date:   2021-01-20        
'// Update ver.:    
'////////////////////////////////////////////////////////////////////////////////////////////////
Sub fncPaging(nTotalCnt, pageSize, page, pageurl)
	Dim nBlockSize : nBlockSize = 5
	
	Dim imgFirstNone	: imgFirstNone =	"<<"
	Dim imgFirst		: imgFirst =		"<<"
	Dim imgPre			: imgPre =			"<"
	Dim imgPreNone		: imgPreNone =		"<"
	Dim imgNext			: imgNext =			">"
	Dim imgNextNone		: imgNextNone =		">"
	Dim imgSeparate		: imgSeparate =		"|"
	Dim imgLastNone		: imgLastNone =		">>"
	Dim imgLast			: imgLast =			">>"
	
	'CS.asp 'tab'파라미터 예외 처리
	If pageurl = "/board/cs.asp" Then
		cstab = "&cstab=2"
		cstab = ""
	End If

	nTotalPage = Fix(nTotalCnt + pagesize -1) / pagesize

	If Fix(nTotalCnt) Mod pagesize > 0 Then nTotalPage = nTotalPage
	If nTotalPage = 0 then nTotalPage = 1

	nTotalBlock = Fix(nTotalPage / nBlockSize)
	If nTotalPage Mod nBlockSize > 0 Then nTotalBlock = nTotalBlock + 1

	nCurBlock = Fix(page / nBlockSize)
	If page Mod nBlockSize > 0 Then nCurBlock = nCurBlock + 1

	response.write "<div class='paging'>"
	'처음으로
	If page = 1 Then 
	Else 
	response.write "<a href='"&pageurl&"?page="& 1 & cstab &"' class='pg_bt pg_start'>" & imgFirst & "</a>"
	End If 

	'이전으로
	If page = 1 Then 
	Else 
		response.write "<a href='"&pageurl&"?page="& page-1 & cstab &"' class='pg_bt pg_frt'>" & imgPre & "</a>"
	End If

	' 페이징 번호
	nStart = (nCurBlock-1)*nBlockSize+1

	If nTotalPage < (nCurBlock)*nBlockSize Then 
		nEnd = nTotalPage
	Else
		nEnd = (nCurBlock)*nBlockSize
	End If

	For i=nStart To nEnd
		If i=page Then 
			response.write "<a href='"&pageurl&"?page="& i & cstab &"' class='pg_bt point'>"
			response.write i & "</a>"
		Else
			response.write "<a href='"&pageurl&"?page="& i & cstab &"' class='pg_bt'>"
			response.write i & "</a>"
		End If
		
		If i<nEnd Then response.write ""
	Next

	If nTotalPage = 0 Then response.write "<a href='"&pageurl&"?page=1"& cstab &"' class='pg_bt point'>1</a>"
	
	' 다음으로
	If nTotalPage < 2 Or page = Fix(nTotalPage) Then
	Else 
		response.write "<a href='"&pageurl&"?page="& page+1 & cstab & "' class='pg_bt pg_lst'>" & imgNext & "</a>"
	End If

	' 맨 끝으로
	If nTotalPage < 2 Or page = Fix(nTotalPage) Then
	Else 
		response.write "<a href='"&pageurl&"?page="& nTotalPage & cstab & "' class='pg_bt pg_end'>" & imgLast & "</a>"
	End If

	response.write "</div>"

End Sub

'////////////////////////////////////////////////////////////////////////////////////////////////
'// Function name:  msgPaging
'// Description:    쪽지 팝업 페이징
'// @param:         
'// Author: 강서현        
'// Date:   2022-08-10   
'// Update ver.:    
'////////////////////////////////////////////////////////////////////////////////////////////////
Sub msgPaging(nTotalCnt, pageSize, page)
	Dim nBlockSize : nBlockSize = 5
	
	Dim imgFirstNone	: imgFirstNone =	"<<"
	Dim imgFirst		: imgFirst =		"<<"
	Dim imgPre			: imgPre =			"<"
	Dim imgPreNone		: imgPreNone =		"<"
	Dim imgNext			: imgNext =			">"
	Dim imgNextNone		: imgNextNone =		">"
	Dim imgSeparate		: imgSeparate =		"|"
	Dim imgLastNone		: imgLastNone =		">>"
	Dim imgLast			: imgLast =			">>"

	nTotalPage = Fix(nTotalCnt / pagesize)

	If nTotalCnt Mod pagesize > 0 Then nTotalPage = nTotalPage + 1
	If nTotalPage = 0 then nTotalPage = 1

	nTotalBlock = Fix(nTotalPage / nBlockSize)

	If Fix(nTotalPage) Mod nBlockSize > 0 Then nTotalBlock = nTotalBlock

	nCurBlock = Fix(page / nBlockSize)
	If page Mod nBlockSize > 0 Then nCurBlock = nCurBlock + 1

	response.write "<div class=""paging"">"

	'처음으로
	If page = 1 Then
	Else
		response.write "<a href='/popup/message.asp?uid="& uid &"&page="& 1 & "&tab="& tab &"' class='pg_bt pg_start'>" & imgFirst & "</a>"
	End If 

	'이전으로
	If page = 1 Then 
	Else 
		response.write "<a href='/popup/message.asp?uid="& uid &"&page="& page-1 & "&tab="& tab &"' class='pg_bt pg_frt'>" & imgFirst & "</a>"
	End If 
	' 페이징 번호
	nStart = (nCurBlock-1)*nBlockSize+1

	If nTotalPage < (nCurBlock)*nBlockSize Then 
		nEnd = nTotalPage
	Else
		nEnd = (nCurBlock)*nBlockSize
	End If

	For i=nStart To nEnd
		
		If i=page Then 
			response.write "<a href='/popup/message.asp?uid="& uid &"&page="& i & "&tab="& tab &"' class='pg_bt point'>"
			response.write "<span style="""">" & i & "</span></a>"
		Else 
			response.write "<a href='/popup/message.asp?uid="& uid &"&page="& i & "&tab="& tab &"' class='pg_bt'>"
			response.write i & "</a>"
		End If
		
		If i<nEnd Then response.write ""
	Next

	If nTotalPage = 0 Then response.write "<a href='/popup/message.asp?page=1' class='pg_bt point'>""<span class=''>1</span></a>"

	' 다음으로
	If nTotalPage < 2 Or page = Fix(nTotalPage) Then 
	Else 
		response.write "<a href='/popup/message.asp?uid="& uid &"&page="& page+1 & "&tab="& tab &"' class='pg_bt pg_lst'>" & imgLast & "</a>"
	End If

	' 맨 끝으로
	If nTotalPage < 2 Or page = Fix(nTotalPage) Then 
	Else
	response.write "<a href='/popup/message.asp?uid="& uid &"&page="& nTotalPage & "&tab="& tab &"' class='pg_bt pg_end'>" & imgLast & "</a>"
	End If

	response.write "</div>"

End Sub



	'////////////////////////////////////////////////////////////////////////////////////////////////
	'// Function name :	fPageGen_new
	'// Description   : paging을 만들어 주는 함수
	'// @param        :
	'//	Author        :Ok, Dong-Uk
	'// Date          : 2015-01-21
	'// Update ver.   :
	'////////////////////////////////////////////////////////////////////////////////////////////////
	Function fPageGen_new(page,ptotal,PageSize,strBUrl)

		iPage       = page
		iTotal      = ptotal
		iPageSize   = PageSize

		strRet			= ""
		iTPage			= int(((iTotal-1)/iPageSize)+1)	  '// 총페이지
		iTSection		= int(((iTPage-1)/4)+1)		      '// 총 섹션
		iCSection		= int(((iPage-1)/4)+1)			  '// 현재 섹션
		iSPage			= int(((iCSection-1)*4)+1)		  '// 현 섹션의 시작 페이지

		intTemp = Int((iPage - 1) / intBlockPage) * intBlockPage + 1
		strBUrl = replace(strBUrl," ","+")

		If instr(strBUrl,"?") <> 0 Then
			strMark = "&"
		Else
			strMark = "?"
		End If

		If iPage > 1 Then
			strPrev = "<a href="""&strBUrl&strMark&"page="&(iPage-1)&""">&laquo;</a>"
		Else
			strPrev = "<a>&laquo;</a>"
		End If

		pCount = 0
		For i=iSPage To iTPage
			pCount = pCount + 1
			If pCount > 4 Then
				Exit For
			End If

        If i>1 Then
            strRet = strRet&""
        End If

        If i=iPage Then
            strRet = strRet&"<span style=''>"&i&"</span></a>"
        Else
            strRet = strRet&"<a href="""&strBUrl&strMark&"page="&i&""">"&i&"&nbsp;</a>"
        End If
            Next

            If iPage < iTPage Then
            strNext = strNext&"<a href="""&strBUrl&strMark&"page="&(iPage+1)&""">&raquo;</a>"
        Else
            strNext = strNext&"<a>&raquo;</a>"
        End If

            strList = chr(13) & "	<div class=""paging"">"
            strList = strList &			strPrev
            strList = strList & 		strRet
            strList = strList &			strNext
            strList = strList & "	</div>"

            Response.write(strList)
        End Function

%>