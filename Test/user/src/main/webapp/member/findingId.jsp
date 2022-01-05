<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<%
 	request.setCharacterEncoding("utf-8");
 %>
<html>

<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<script type="text/javascript">
function findingCheck() {
	
	if(document.name.value=="") {
		alert("이름을 입력해 주세요.");
		document.findingId.name.focus();
		return;
	}
	
	if(document.email.value=="") {
		alert("이메일을 입력해 주세요.");
		document.findingId.email.focus();
		return;
	}
		
</script>
</head>

<body>
<form action="findIdResult.jsp" method="post">
<table>
	<tr>	
		<td align="center" colspan="2"><b>ID 찾기</b></td>
	</tr>

	<tr>
		<td align="left"><b>이름</b></td>
		<td>
			<input type="text" name="name">
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