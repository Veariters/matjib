<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.R2_BoardVO" %>
<%@ page import="board.R_BoardDAO" %>
<%@ include file="view/color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<%
int num = Integer.parseInt(request.getParameter("mr2_num"));
	String pageNum = request.getParameter("pageNum");
	
	try{
		
		R_BoardDAO dbPro = R_BoardDAO.getInstance();
		
		R2_BoardVO article = dbPro.updateGetArticle(num);
%>	
<body bgcolor="<%=bodyback_c%>">
<form name="chooseLanguage" align="right">
	<select name="Language">
		<option value="Korean">한국어</option>
		<option value="Japaness">Japaness</option>
	</select>
</form><br>
<div align="center"><font size="6em"><b>맛집 노선도</b></font><br>
<hr color="skyblue">
<nav id="topMenu" align="center">
	<ul>
		<li><a href="r_boardList.jsp" class="menuLink">공지사항</a></li>
		<li><a href="#" class="menuLink">자유게시판</a></li>
		<li><a href="#" class="menuLink">맛집 리뷰 게시판</a></li>
		<li><a href="#" class="menuLink">회원 메뉴</a></li>
	</ul>
</nav>
<hr color="skyblue">
<div style="position: absolute; left: 35%; font-size:2em;"><b>글수정</b></div><br><br>
	<form action="r_boardUpdateProc.jsp?pageNum=<%=pageNum%>" method="post" name="writeForm" onsubmit="return writeSave()" encType="multipart/form-data">
		<table width="400" border="1" cellpadding="0" cellspacing="0" align="center" bgcolor="<%=bodyback_c%>">
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">아이디</td>
				<td width="330" align="left"><input type="text" size="20" maxlength="20" name="mr2_writer" value="<%=article.getMr2_writer()%>">
											<input type="hidden" name="mr2_num" value="<%=article.getMr2_num()%>">
				</td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">제목</td>
				<td width="330" align="left">
					<input type="text" size="50" maxlength="50" name="mr2_subject" value="<%=article.getMr2_subject()%>">				<!-- 새글일 경우 -->		
				</td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">내용</td>
				<td width="330" align="left"><textarea rows="14" cols="50" name="mr2_content"><%=article.getMr2_content()%>"</textarea></td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">기존파일<br><%=article.getMr2_image() %></td>
				<td width="150"><input type="file" name="mr2_image" ></td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
				<td width="330" align="left"><input type="password" size="20" maxlength="20" name="mr2_pass"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" bgcolor="<%=value_c%>">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onClick="document.location='r_boardList.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
		
	</form>	
</div>
<%}catch(Exception e){} %>

</body>
</html>