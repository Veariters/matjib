<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<%
 	request.setCharacterEncoding("utf-8");
 %>
<html>

<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
function findingCheck() {
	
	if(document.id.value=="") {
		alert("아이디을 입력해 주세요.");
		document.findpw.id.focus();
		return;
	}
	
	if(document.english.value=="") {
		alert("영문명을 입력해 주세요.");
		document.findpw.name.focus();
		return;
	}
	
	if(document.email.value=="") {
		alert("이메일을 입력해 주세요.");
		document.findpw.email.focus();
		return;
	}
	
	
		
</script>
</head>

<body>
<form action="findPwResult.jsp" method="post">
<table>
	<tr>	
		<td align="center" colspan="2"><b>비밀번호 찾기</b></td>
	</tr>
	
	<tr>
		<td align="left"><b>아이디</b></td>
		<td>
			<input type="text" name="id">
		</td>
	</tr>
	<tr>
		<td align="left"><b>영문명</b></td>
		<td>
			<input type="text" name="english">
		</td>
	</tr>
	<tr>
		<td align="left"><b>E-Mail</b></td>
		<td>
			<input type="text" name="email">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="찾기" onclick="findingCheck()">&nbsp;&nbsp;&nbsp;
			<input type="button" value="뒤로가기" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
</body>
</html>