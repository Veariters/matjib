<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="board.I_BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>

<%

// 한 페이지에 보여줄 목록 수 지정
int pageSize = 5;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

String pageNum = request.getParameter("pageNum");
String searchWhat = request.getParameter("searchWhat");
String searchText = request.getParameter("searchText");


if(searchText != null){
	searchText = new String(searchText.getBytes("utf-8"), "utf-8");
}
if(pageNum == null){
	pageNum = "1";
}

// 현재 페이지
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;

int count = 0;
int number = 0;

List<I_BoardVO> articleList = null;
BoardDAO dbPro = BoardDAO.getInstance();
count = dbPro.getArticleCount(); // 전체글 수

// 검색이 아니면 전체 리스트를 보여주고 검색이면 검색한 내용만 보여줌

if(searchText == null){
	count = dbPro.getArticleCount();
	if(count > 0) {
		
		articleList = dbPro.getArticles(startRow, endRow);
	}
}else{
	count = dbPro.getArticleCount(searchWhat, searchText);
	if(count > 0) {
		articleList = dbPro.getArticles(searchWhat, searchText, startRow, endRow );
	}
}

number = count - (currentPage - 1) * pageSize;
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body bgcolor="<%=bodyback_c %>">
<form name="chooseLanguage" align="right">
	<select name="Language">
		<option value="Korean">한국어</option>
		<option value="Japaness">Japaness</option>
	</select>
</form><br>
<form action="i_boardList.jsp" onsubmit="return search()" name="searchForm" align="right">
 <select name="searchWhat">
  <option value="writer">작성자</option>
  <option value="subject">제목</option>
  <option value="content">내용</option> 
 </select>
 <input type="text" name="searchText">
 <input type="submit" value="검색">
</form>
<div align="center"><font size="6em"><b>맛집 노선도</b></font><br>전체 글 : <%= count %>
<hr color="skyblue">
<nav id="topMenu" align="center">
	<ul>
		<li><a href="i_boardList.jsp" class="menuLink">공지사항</a></li>
		<li><a href="#" class="menuLink">자유게시판</a></li>
		<li><a href="#" class="menuLink">맛집 리뷰 게시판</a></li>
		<li><a href="#" class="menuLink">회원 메뉴</a></li>
	</ul>
</nav>
<hr color="skyblue">
<div style="position: absolute; left: 35%; font-size:2em;"><b>공지게시판</b></div>
<div style="position: absolute; left: 70%; font-size:20px;"><b>말머리</b></div>
<div align="right">
<form name="chooseGenre" align="right">
	<select name="Genre" style="position: absolute; left: 74%; width:100px; height:30px">
		<option value="Bunsik" align="center">분식</option>
		<option value="Hansik" align="center">한식</option>
		<option value="Ilsik" align="center">일식</option>
		<option value="Jungsik" align="center">중식</option>
		<option value="Yangsik" align="center">양식</option>
	</select>
</form>
</div><br><br>
<%
if(count == 0) { // 저장된 글이 없을 경우
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
 <tr align="center">
  <td>게시판에 저장된 글이 없습니다.</td>
 </tr>
</table>
<%} else{ // 글이 있을 경우 %>
<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
 <tr height="30" bgcolor="<%=value_c %>">
  <td align="center" width="50">번호</td>
  <td align="center" width="250">제목</td>
  <td align="center" width="100">작성자</td>
  <td align="center" width="150">작성일</td>
  <td align="center" width="50">조회수</td>
 </tr>
 <% for(int i = 0; i < articleList.size(); i++) {
 	I_BoardVO article = (I_BoardVO)articleList.get(i);
 %>
 <tr height="30">
  <td align="center" width="50"><%=number-- %></td>
  <td width="250">
  <%
   int wid = 0;
  %>
  <img src="../img/level.gif" width="<%=wid %>" height="16">
  <img src="../img/re.gif">
   <img src="../img/level.gif" width="<%=wid %>" height="16">
   <a href="i_boardContent.jsp?num=<%= article.getMi_num()%>&pageNum=<%=currentPage%>">
    <%=article.getMi_subject() %></a> 
    <%if(article.getMi_readcount() >= 20) { %>
    <img alt="" src="img/hot.gif" border="0" height="16">
    <%} %>
    <td align="center"><%=article.getMi_writer() %></td>
  <td align="center" width="150">
   <%=sdf.format(article.getMi_postdate()) %>
  </td>
  <td align="center" width="50">
   <%=article.getMi_readcount() %>
  </td>
 </tr>
 <%} %>
</table>
<%}
%>
<!-- 페이징 처리 -->
<%
if(count > 0) {
	 
	int pageBlock = 5;
	
	int imsi = count % pageSize == 0 ? 0 : 1;
	
	int pageCount = count/pageSize + imsi;
	
	int startPage = (int)((currentPage - 1) / pageBlock) * pageBlock + 1;
	int endPage = startPage + pageBlock - 1;
	
	if(endPage > pageCount) endPage = pageCount;
	
	if(startPage > pageBlock) {
		
		// 검색일 경우와 아닐 경우 페이지 처리
		if(searchText == null) {
	%>
	<a href="i_boardList.jsp?pageNum=<%= startPage-pageBlock %>">[이전]</a>
	<% }else {	
	%>
	<a href="i_boardList.jsp?pageNum=<%= startPage-pageBlock %>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>">[이전]</a>
	<% 
		}
		}
	for(int i = startPage; i <= endPage; i++){
		if(searchText == null){
	%>
	<a href="i_boardList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
	<%
		}else {
	%>		
	<a href="i_boardList.jsp?pageNum=<%=i%>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>">[<%=i %>]</a>
	<% 	
		}
	}
	if(endPage < pageCount){
		if(searchText == null) {
	%>
	<a href="i_boardList.jsp?pageNum=<%= startPage+pageBlock %>">[다음]</a>
	<% }else { %>
	<a href="i_boardList.jsp?pageNum=<%= startPage+pageBlock %>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>">[다음]</a>
	<%
	}
	 }
	}
	%>
<form action="i_boardList.jsp" onsubmit="return search()" name="searchForm">
 <select name="searchWhat">
  <option value="writer">작성자</option>
  <option value="subject">제목</option>
  <option value="content">내용</option> 
 </select>
 <input type="text" name="searchText">
 <input type="submit" value="검색">
</form>
</div>
<div align="center">
<table width = "700" align="center">
 <tr bgcolor="<%=value_c %>">
 <td style="position: absolute; left: 48%;"><a href="i_boardList.jsp">글 목록으로 돌아가기</a></td>
  <td align="right" >
  <a href="i_boardWriteForm.jsp">글쓰기</a></td>
 </tr>
</table>
<hr color="skyblue">
<footer id="footer">
<div></div>
<nav id="bottomMenu" align="center">
	<ul>
		<li><a href="#" class="bottomLink">페이지 이용방법&nbsp;&nbsp;</a></li>
		<li><a href="#" class="bottomLink">고객문의&nbsp;&nbsp;</a></li>
		<li><a href="#" class="bottomLink">이용약관&nbsp;&nbsp;</a></li>
		<li><a href="#" class="bottomLink">개인정보 처리방침</a></li>
	</ul><br>
	</nav>
		<pre style="font-size: 7px; position: fixed; " align="center">
		상호명 : (주)맛집 노선도
			주소 : 서울시 영등포구 영중로 56 신한빌딩 4, 5층 주식회사 글로벌인
		Email : matjibcs@gmail.com
		</pre>
</footer>
</div>
</body>
</html>