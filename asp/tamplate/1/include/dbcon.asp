<%
Session.codepage="65001"
Response.CharSet="utf-8"
Response.codepage="65001"
Response.ContentType="text/html;charset=utf-8"
Response.LCID = 2048
set dbcon = Server.CreateObject("ADODB.Connection") 
dbcon.Open ("Provider=SQLOLEDB;Data Source=192.168.0.65;Initial Catalog=jungle_member;User ID=realpoker;Password=alxndhs#@@!;")

Set RS = SERVER.CreateObject("ADODB.Recordset")
Set RS2 = SERVER.CreateObject("ADODB.Recordset")
%>
<!--#include virtual="/include/function.asp"-->
<!--#include virtual="/include/config.asp"-->