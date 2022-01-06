<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="./script.js"></script>
<%
request.setCharacterEncoding("UTF-8");
String loginID = request.getParameter("loginID");

String delete = request.getParameter("delete");
if(delete.equals("12345")){
	   String id = (String)session.getAttribute("loginID");
%>
</head>
<body onload="begin()">
<form action="deleteProc.jsp" name="myForm" method="post" onsubmit="return checkIt()">
<table width="300" border="1" align="center">
	
	<tr>
		<td colspan="2" align="center">
			<b>회원탈퇴</b>
		</td>
	</tr>
	
	<tr>
		<td width="150"><b>비밀번호 입력: </b></td>
		<td width="150">
			<input type="password" name="pass" size="15">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="회원탈퇴">
			<input type="button" value="취소" onClick="javascript:window.location='login.jsp'">
		</td>
	</tr>
</table>
</form>
<%}else {%>
else { %>
<script type="text/javascript">
alert("글자가 틀립니다. ㅅㅂ;;");
history.go(-1);

</script>




<%} %>
</body>
</html>