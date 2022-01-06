<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String loginID = (String)session.getAttribute("loginID");
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>

<% if(loginID != null) { // 로그인이 성공한 경우%>
<table width="300" border="0"  >
	<tr>
	
		<td align="left" style="font-size:28pt; ">
			<b>마이페이지</b>
		</td>
	</tr>
	<tr>
		<td align="left" style="font-size:20pt; ">
			"<%=loginID %>" 님 어서 오세요.
		</td>
	</tr>
</table>	
<table align="center" style="margin-top:1%" class="mo">
	<tr>
		<td height="50"><a a style="text-decoration:none; font-size:20pt;" href="modifyForm.jsp">1. 회원정보 수정</td>
	</tr>
	<tr>
		<td height="50"><a a style="text-decoration:none; font-size:20pt;" href="#">2. 작성리뷰 조회</td>
	</tr>
	<tr>
		<td height="50"><a a style="text-decoration:none; font-size:20pt;" href="deleteForm2.jsp">3. 회원탈퇴</td>
	</tr>
	<tr>
		<td height="50"><a a style="text-decoration:none; font-size:20pt;" href="logout.jsp">4. 로그아웃</td>
	</tr>
		
</table>
<%}else { // 로그인이 안된경우 %>
<form action="loginProc.jsp" method="post">
<table align="center" height="100" border="0">
	<tr>
		<td colspan="2" align="center" style="font-size:40pt; "><b>Log in</b></td>
	</tr>
	
	<tr>
		<td width="100" align="left">ID  </td>
		<td width="200">&nbsp;&nbsp;
			<input type="text" name="id" size="20">
		</td>
	</tr>
	
	<tr>
		<td width="100" align="left">비밀번호  </td>
		<td width="200">&nbsp;&nbsp;
			<input type="password" name="pass" size="20">
		</td>
	</tr>
</table>
<table align="center" height="40" style="margin-top:1%">	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="로그인" style="height:50px; width:350px;  background-color:skyblue; color:white; font-size:16px; border:solid 1px #050099; ">&nbsp;&nbsp;
		</td>
	</tr>
</table>

<table align="center" height="0" width="440" border="1" style="border:solid 1px #050099; margin-top:2%">
</table>

<table align="center" height="50" style="margin-top:1%" class="mo">
	<tr>
		<td><a a style="text-decoration:none;" href="regForm.jsp">회원가입 | </td>
		<td><a a style="text-decoration:none;" href="findingId.jsp">아이디 찾기 | </td>
		<td><a a style="text-decoration:none;" href="findPw.jsp">비밀번호 찾기</td>
	</tr>
		
</table>	
</form>
<%} %>
</body>
</html>