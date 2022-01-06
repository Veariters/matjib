<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
<form action="deleteForm.jsp" method="post">
<table align="center" border="0">
	<tr>
		<td colspan="2" align="center" style="font-size:40pt; "><b>회원탈퇴</b></td>
	</tr>
	
	<tr>
		<td width="200" align="center">정말 회원탈퇴를 진행하시겠습니까?</td>
	</tr>
	<tr>
		<td width="200" align="center">계속 진행하신다면 <b>"12345"</b>를 입력해주세요.</td>
	</tr>
	<tr>
		<td width="300">
			<input type="text" name="delete" size="20">
		</td>
	</tr>
		<tr>
		<td colspan="2" align="center">
			<input type="submit" value="회원탈퇴">
			<input type="button" value="취소" onClick="javascript:window.location='login.jsp'">
		</td>
	</tr>
</form>
</table>
</body>
</html>