<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="board.BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="article" class="board.I_BoardVO" scope="page">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
	int num =  Integer.parseInt(request.getParameter("mi_num"));
	String pageNum = request.getParameter("pageNum");
	BoardDAO dbPro = BoardDAO.getInstance();
	String pass = request.getParameter("mi_pass");
	
	int check = dbPro.deleteArticle(num, pass);
	
	if(check == 1){
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="0; url=i_boardList.jsp?pageNum=<%=pageNum%>">
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