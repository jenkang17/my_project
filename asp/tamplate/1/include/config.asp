<%
    SITE_NAME = "SLOT&CASINO"
    head_id="slot&casino"

	'클라우드서버 아이피 대응 
	cf_conneting_ip = Request.ServerVariables("HTTP_CF_CONNECTING_IP")
	cf_conneting_ip = Trim(cf_conneting_ip)	
	If cf_conneting_ip <>"" Then
		cf_conneting_ip = Trim(Request.ServerVariables("HTTP_CF_CONNECTING_IP"))
	Else
		cf_conneting_ip = Trim(Request.ServerVariables("REMOTE_ADDR"))
	End If
%>