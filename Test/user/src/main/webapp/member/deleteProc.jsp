<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.*" %>
<jsp:useBean id="dao" class="member.MemberDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="3; url=login.jsp">
<title>회원탈퇴</title>
</head>
<%
String id = (String)session.getAttribute("loginID");
String pass = request.getParameter("pass");
int check = dao.deleteMember(id, pass);

if(check == 1) {
	session.invalidate();
%>
<body>
<div align="center">
<font size="5" face="궁서체">
회원 정보가 삭제 되었습니다.<br><br>
안녕히가세요. 다음에 또 만날 날을 기약합니다. ^^
3초 후에 Log In Page 로 이동합니다.
</font>
<%}else { %>
<script type="text/javascript">
alert("비밀번호가 맞지 않습니다.");
history.go(-1);
</script>
<%} %>
</div>
</body>
</html>