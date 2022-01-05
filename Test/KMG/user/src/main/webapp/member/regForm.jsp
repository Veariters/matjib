<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Form</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="./script.js"></script>

</head>
<body>
<form action="regProc.jsp" method="post" name="regForm">
<table border="1">
	<tr>
		<td colspan="2" align="center">회원 가입 정보 입력</td>
	</tr>
	
	<tr>
		<td align="right">아이디 : </td>
		<td>
			<input type="text" name="id">&nbsp;
			<input type="button" value="중복확인" onClick="idCheck(this.form.id.value)">
		</td>
	</tr>
	
	<tr>
		<td align="right">비밀번호 : </td>
		<td>
			<input type="password" name="pass">
		</td>
	</tr>
	<tr>
		<td align="right">비밀번호 확인 : </td>
		<td>
			<input type="password" name="repass">
		</td>
	</tr>
	
	<tr>
		<td align="right">이름 : </td>
		<td>
			<input type="text" name="name">
		</td>
	</tr>
		<tr>
		<td align="right">이메일 : </td>
		<td>
			<input type="email" name="email">
		</td>
	</tr>
	
	<tr>
		<td align="right">전화번호 : </td>
		<td>
			<select name="phone1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>
				<option value="033">033</option>
				<option value="042">042</option>
				<option value="010">010</option>
			</select>-
			<input type="text" name="phone2" size="5">-
			<input type="text" name="phone3" size="5">
		</td>
	</tr>
		
	<tr>
		<td align="right">우편번호 : </td>
		<td>
			<input type="text" name="zipcode">&nbsp;
			<input type="button" value="찾기" onClick="zipCheck()">
		</td>
	</tr>
	
	<tr>
		<td align="right">주소 : </td>
		<td>
			<input type="email" name="address1" size="50">
		</td>
	</tr>
	<tr>
		<td align="right">나머지주소 : </td>
		<td>
			<input type="email" name="address2" size="30">
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
	
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="회원가입" onClick="inputCheck()">&nbsp;&nbsp;
			<input type="reset" value="다시입력">
			<input type="hidden" name="role" value="user">
		</td>
	</tr>
	
	
</table>
</form>
</body>
</html>