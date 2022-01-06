<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.*" %>

<jsp:useBean id="dao" class="member.MemberDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 폼</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="./script.js"></script>
</head>
<%
String loginID = (String)session.getAttribute("loginID");
MemberVO vo = dao.getMember(loginID);
%>
<body>
<form action="modifyProc.jsp" method="post" name="regForm">
<table border="1">
	<tr>
		<td colspan="2" align="center">회원 수정 정보 입력</td>
	</tr>
	
	<tr>
		<td align="right">아이디 : </td>
		<td><%=vo.getId() %></td>
	</tr>
	
	<tr>
		<td align="right">비밀번호 : </td>
		<td>
			<input type="password" name="pass" value="<%=vo.getPass()%>">
			</td>
	</tr>
	<tr>
		<td align="right">비밀번호 확인 : </td>
		<td>
			<input type="password" name="repass" value="<%=vo.getPass()%>">
		</td>
	</tr>
	
	<tr>
		<td align="right">이름 : </td>
		<td><%=vo.getName() %></td>
	</tr>
	
	<tr>
		<td align="right">영문명 : </td>
		<td><%=vo.getEnglish() %></td>
	</tr>
	
	<tr>
		<td align="right">전화번호 : </td>
		<td><input type="text" name="phone1" size="4" value="<%=vo.getPhone1()%>">-
			<input type="text" name="phone2" size="5" value="<%=vo.getPhone2()%>">-
			<input type="text" name="phone3" size="5" value="<%=vo.getPhone3()%>">
		</td>
	</tr>
	
	<tr>
		<td align="right">이메일 : </td>
		<td>
			<input type="email" name="email" value="<%=vo.getEmail()%>">
		</td>
	</tr>
	
	<tr>
		<td align="right">우편번호 : </td>
		<td>
			<input type="text" name="zipcode" value="<%=vo.getZipcode()%>">&nbsp;
			<input type="button" value="찾기" onClick="zipCheck()">
		</td>
	</tr>
	
	<tr>
		<td align="right">주소1 : </td>
		<td>
			<input type="email" name="address1" size="50" value="<%=vo.getAddress1()%>">
		</td>
	</tr>
	<tr>
		<td align="right">주소2 : </td>
		<td>
			<input type="email" name="address2" size="30" value="<%=vo.getAddress2()%>">
		</td>
	</tr>
	<tr>
		<td align="right">선호 음식</td>
		<td>
		 <input type="checkbox" name="likefood" value="한식" >한식&nbsp;&nbsp;&nbsp;
         <input type="checkbox" name="likefood" value="양식">양식&nbsp;&nbsp;&nbsp;
         <input type="checkbox" name="likefood" value="중식">중식<br>
         <input type="checkbox" name="likefood" value="일식">일식&nbsp;&nbsp;&nbsp;
         <input type="checkbox" name="likefood" value="기타">기타
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="정보수정" onClick="updateCheck()">&nbsp;&nbsp;
			<input type="button" value="취소" onClick="javascript:window.location='login.jsp'">
		</td>
	</tr>
	
</table>
</form>
</body>
</html>