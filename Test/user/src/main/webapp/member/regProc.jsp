<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("utf-8");

//음식 부분은 별도로 읽어드려 다시 빈 클래스에 저장(여러개이기 때문에 배열로 받아서 저장해 줘야 한다.) 
String [] likefood = request.getParameterValues("likefood");
//배열에 있는 내용을 하나의 스트링으로 저장
String textlikefood = new String();

for(int i = 0; i<likefood.length; i++){
   textlikefood += likefood[i] + " ";
}

%>

<jsp:useBean id="dao" class="member.MemberDAO" />
<jsp:useBean id="vo" class="member.MemberVO" />

<jsp:setProperty property="*" name="vo"/>

<%
	boolean flag = dao.memberInsert(vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="./script.js"></script>
</head>
<body bgcolor="#FFFFCC">
<br><br>
<div align="center">
<%
if(flag) {
	out.println("<b>회원 가입에 성공하였습니다.</b><br><br>");
	out.println("<b>로그인 하시면 회원 권한이 필요한 모든 기능을 이용하실 수 있습니다.</b><br>");	
	out.println("<a href='login.jsp'>로그인 화면 </a>" + "    ");
	out.println("<a href='main.jsp'>메인 화면</a>");
}else {
	out.println("<b>다시 입력해 주세요. </b><br>");
	out.println("<a href='regForm.jsp'>다시 가입 </a>");
}

%>



</div>
</body>
</html>