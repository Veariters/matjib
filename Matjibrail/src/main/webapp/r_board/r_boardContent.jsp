<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.R_BoardVO" %>
<%@ page import="board.R_BoardDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>
<%@ page import="java.io.File" %>
<jsp:useBean id="recommend" class="board.RecommendDAO" />
<jsp:useBean id="vo" class="board.RecommendVO" />
<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>글 상세보기</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<%
request.setCharacterEncoding("utf-8");

	int mr_num = Integer.parseInt(request.getParameter("mr_num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	   R_BoardDAO dao = new R_BoardDAO();   
	   int Recommend= dao.Recommend(mr_num); 
	
	try{
		R_BoardVO article = new R_BoardVO();
		R_BoardDAO dbPro = R_BoardDAO.getInstance();
		
		article = dbPro.getArticle(mr_num);
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
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMr_num() %></td>
				<td align="center" width="140" bgcolor="<%=value_c%>">조회수</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMr_readcount() %></td>
			</tr>
			<tr height="30">
				<td align="center" width="140" bgcolor="<%=value_c%>">작성자</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMr_writer() %></td>
				<td align="center" width="140" bgcolor="<%=value_c%>">작성일</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMr_postdate() %></td>
			</tr>
			<tr>
				<td align="center" width="140" bgcolor="<%=value_c%>">제목</td>
				<td colspan="3" align="center" width="280" bgcolor="<%=bodyback_c%>"><%=article.getMr_subject() %></td>
			</tr>
			<tr>
				<td colspan="4" height="200" valign="top">
					<div>
					<%
					if(!article.getMr_image().equals("")){
						
						String [] imgArr = article.getMr_image().split(",");

						for(int i = 0; i < imgArr.length; i++){
							article.setMr_image(imgArr[i]);
					
					%>
						<img src="image/<%=article.getMr_image() %>" width="200" onError="this.style.visibility='hidden'"><br>
						
						<%} } else{%>
						<%} %>
					</div><br><br>
					<%=article.getMr_content() %>
				</td>
			</tr>

			<tr height="30">
				<td colspan="4" bgcolor="<%=value_c%>" align="right">
					<input type="button" value="글쓰기" onClick="document.location.href='r_boardWriteForm.jsp'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<input type="button" value="수정하기" onClick="document.location.href='r_boardUpdateForm.jsp?mr_num=<%=article.getMr_num()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<input type="button" value="삭제하기" onClick="document.location.href='r_boardDeleteForm.jsp?mr_num=<%=article.getMr_num()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp;

					<input type="button" value="글목록" onClick="document.location.href='r_boardList.jsp?pageNum=<%=pageNum%>'">
				</td>
				
			</tr>
		</table>
		</form>	
<%

String num = request.getParameter("mr_num");	


String loginID = (String)session.getAttribute("loginID");

int check = recommend.recommendCheck(Integer.parseInt(num), loginID);

%>
 <% if(check!=1) { %>
<form action="r_recommand2.jsp">
<table>
         <tr>
            <td>추천수</td>
            <td><%= Recommend%>   </td>

            <td><input type="button" name="mr_recommand" value="추천!" onclick="document.location.href='r_recommand.jsp?mr_num=<%=article.getMr_num()%>&pageNum=<%=pageNum%>'"> 
            </td>
         </tr>
         
         <%}else{%>
         <tr>
            <td>추천수</td>
            <td><%= Recommend%>   </td>
            <td><input type="button" name="mr_recommand" value="추천취소!" onclick="document.location.href='r_recommand2.jsp?mr_num=<%=article.getMr_num()%>&pageNum=<%=pageNum%>'"> 
            </td>
         </tr>
         <% }%>	
<%--          <button onclick="document.location.href='i_recommand.jsp?mi_num=<%=article.getMi_num()%>&pageNum=<%=pageNum%>'">추천</button> --%>
</table>
</form>
	<%
	}catch(Exception e){}
%>
</div>
</body>
</html>