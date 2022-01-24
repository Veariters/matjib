<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.CommentVO" %>
<%@ page import="board.CommentDAO" %>
<%@ page import="java.sql.Timestamp" %>

<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="article" class="board.CommentVO" scope="page">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
int num =  Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	CommentDAO dbPro = CommentDAO.getInstance();
	String pass = request.getParameter("pass");
	
	int check = dbPro.deleteArticle(num, pass);
	
	if(check == 1){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="0; url=i_boardContent.jsp?pageNum=<%=pageNum%>">
<title></title>
</head>
<body>
<script type="text/javascript">
alert("댓글삭제.");
history.go(-2); //뒤로
</script>
<%}else {%>
<script type="text/javascript">
alert("비밀 번호가 틀렸습니다.");
history.go(-1); //뒤로
</script>
<%} %>
</body>
</html>