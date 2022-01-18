<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.F_BoardVO" %>
<%@ page import="board.F_BoardDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>글 상세보기</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<%
request.setCharacterEncoding("utf-8");

	int mf_num = Integer.parseInt(request.getParameter("mf_num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	try{
		F_BoardVO article = new F_BoardVO();
		F_BoardDAO dbPro = F_BoardDAO.getInstance();
		
		article = dbPro.getArticle(mf_num);
%>
<body bgcolor="<%=bodyback_c %>">
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
		<li><a href="i_boardList.jsp" class="menuLink">공지사항</a></li>
		<li><a href="f_boardList.jsp" class="menuLink">자유게시판</a></li>
		<li><a href="r_boardList.jsp" class="menuLink">맛집 리뷰 게시판</a></li>
		<li><a href="#" class="menuLink">회원 메뉴</a></li>
	</ul>
</nav>
<hr color="skyblue">
<div align="center">
	<div style="position: absolute; left: 35%; font-size:2em;"><b>글 상세보기</b></div><br><br>
	<form action="">
		<table width="700" border="1" cellpadding="0" cellspacing="0" align="center" bgcolor="<%=bodyback_c%>">
			<tr height="30">
				<td align="center" width="140" bgcolor="<%=value_c%>">글번호</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMf_num() %></td>
				<td align="center" width="140" bgcolor="<%=value_c%>">조회수</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMf_readcount() %></td>
			</tr>
			<tr height="30">
				<td align="center" width="140" bgcolor="<%=value_c%>">작성자</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMf_writer() %></td>
				<td align="center" width="140" bgcolor="<%=value_c%>">작성일</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMf_postdate() %></td>
			</tr>
			<tr>
				<td align="center" width="140" bgcolor="<%=value_c%>">제목</td>
				<td colspan="3" align="center" width="280" bgcolor="<%=bodyback_c%>"><%=article.getMf_subject() %></td>
			</tr>
			<tr>
				<td colspan="4" height="200" valign="top">
					<div>
					<%	
					if(!article.getMf_image().equals("")){
						
						String [] imgArr = article.getMf_image().split(",");

						for(int i = 0; i < imgArr.length; i++){
							article.setMf_image(imgArr[i]);
					
					%>
						<img src="image/<%=article.getMf_image() %>" width="200" onError="this.style.visibility='hidden'"><br>
						
						<%}}else{%>
							
						<% }%>
					</div><br><br>
					<%=article.getMf_content() %>
				</td>
			</tr>

			<tr height="30">
				<td colspan="4" bgcolor="<%=value_c%>" align="right">
					<input type="button" value="글쓰기" onClick="document.location.href='f_boardWriteForm.jsp'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<input type="button" value="수정하기" onClick="document.location.href='f_boardUpdateForm.jsp?mf_num=<%=article.getMf_num()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<input type="button" value="삭제하기" onClick="document.location.href='f_boardDeleteForm.jsp?mf_num=<%=article.getMf_num()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp;

					<input type="button" value="글목록" onClick="document.location.href='f_boardList.jsp?pageNum=<%=pageNum%>'">
				</td>
				
			</tr>
		</table>
	<%
	}catch(Exception e){}
	%>
</form>	
</div>
</body>
</html>