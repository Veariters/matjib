<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="board.F_BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>

<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="article" class="board.F_BoardVO" scope="page">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
int num =  Integer.parseInt(request.getParameter("mf_num"));
	String pageNum = request.getParameter("pageNum");
	F_BoardDAO dbPro = F_BoardDAO.getInstance();
	String pass = request.getParameter("mf_pass");
	
	int check = dbPro.deleteArticle(num, pass);
	
	if(check == 1){
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="0; url=f_boardList.jsp?pageNum=<%=pageNum%>">
<title></title>
</head>
<body>
<%}else {%>
<script type="text/javascript">
alert("비밀 번호가 틀렸습니다.");
history.go(-1); //뒤로
</script>
<%} %>
</body>
</html>