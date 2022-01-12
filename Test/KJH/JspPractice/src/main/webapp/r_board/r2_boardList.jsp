<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>    
<%@ page import="board.R_BoardVO" %>
<%@ page import="board.R_BoardDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>

<%
request.setCharacterEncoding("utf-8");
// 한 페이지에 보여줄 목록 수 지정
int pageSize = 5;


SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

String pageNum = request.getParameter("pageNum");
String searchWhat = request.getParameter("searchWhat");
String searchText = request.getParameter("searchText");
String searchHeader = request.getParameter("searchHeader");
int bcheck1 = 10;
int bcheck2 = 20;
int bcheck3 = 30;
int bcheck4 = 40;

if(searchText != null){
	searchWhat = new String(searchWhat.getBytes("utf-8"), "utf-8");
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

List<R_BoardVO> articleList = null;
R_BoardDAO dbPro = R_BoardDAO.getInstance();
count = dbPro.getArticleCount(); // 전체글 수
R_BoardVO vo = new R_BoardVO();
// 검색이 아니면 전체 리스트를 보여주고 검색이면 검색한 내용만 보여줌

if(searchText == null && searchHeader == null){
	count = dbPro.getArticleCount();
	if(count > 0) {
		System.out.println("여기가 적용1");
		articleList = dbPro.getArticles(startRow, endRow);
	}
} 
else if(searchText == null && searchHeader != null){
	count = dbPro.getArticleCount(searchHeader);
	if(count > 0) {
		System.out.println("여기가 적용2");
		articleList = dbPro.getArticles(searchHeader,startRow, endRow);
	}
}
else{	
	count = dbPro.getArticleCount(searchWhat, searchText);
	if(count > 0) {
		System.out.println("여기가 적용3");
		articleList = dbPro.getArticles(searchWhat, searchText, startRow, endRow );
	}
}



number = count - (currentPage - 1) * pageSize;
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집리뷰 게시판</title>

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
<script type="text/javascript">
$("#searchHeader:selected").val();
</script>
<div align="center"><font size="6em"><b>맛집 노선도</b></font><br>전체 글 : <%= count %>

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
<div style="position: absolute; left: 35%; font-size:2em;"><b>맛집리뷰 게시판2(신설동~종합운동장)</b></div>
<div style="position: absolute; left: 70%; font-size:20px;"><label><b>말머리</b></label></div>
<div align="right">
<form action="r2_boardList.jsp?" name="searchHeaderForm" align="right" >
	<select name="searchHeader" style="position: absolute; left: 74%; width:300px; height:30px">
		<option value="notnull" align="center" selected>---------역이름 선택------</option>
		<option align="center">강변</option>
		<option align="center">뚝섬</option>
		<option align="center">상왕십리</option>
		<option align="center">시청</option>
		<option align="center">신당</option>
		<option align="center">신촌</option>
		<option align="center">아현</option>
		<option align="center">왕십리</option>
		<option align="center">을지로3가</option>
		<option align="center">을지로4가</option>
		<option align="center">을지로입구</option>
		<option align="center">이대</option>
		<option align="center">충정로</option>
		<option align="center">한양대</option>	
	</select>
	 <input type="submit" value="검색" >
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
<table width="800" border="1" cellpadding="0" cellspacing="0" align="center">
 <tr height="30" bgcolor="<%=value_c %>">
  <td align="center" width="50">번호</td>
  <td align="center" width="100">말머리</td>
  <td align="center" width="250">제목</td>
  <td align="center" width="100">작성자</td>
  <td align="center" width="150">작성일</td>
  <td align="center" width="50">조회수</td>
 </tr>
 
 <% 
 	for(int i = 0; i < articleList.size(); i++) {
 	R_BoardVO article = (R_BoardVO)articleList.get(i);
 	if(article.getMr_bcheck() == 20){
 %>
 <tr height="30">
  <td align="center" width="50"><%=number-- %></td>
  <td align="center" width="100"><%=article.getMr_header() %></td>
  <td width="250">
  <%
   int wid = 0;
  %>
   <img src="../img/level.gif" width="<%=wid %>" height="16">
   <a href="r1_boardContent.jsp?mi_num=<%= article.getMr_num()%>&pageNum=<%=currentPage%>&bcheck10=<%=article.getMr_bcheck()%>">
    <%=article.getMr_subject() %></a> 
    <%if(article.getMr_readcount() >= 20) { %>
    <img alt="" src="img/hot.gif" border="0" height="16">
    <%} %>
    <td align="center" width="100"><%=article.getMr_writer() %></td>
  <td align="center" width="150"><%=sdf.format(article.getMr_postdate()) %></td>
  <td align="center" width="50"><%=article.getMr_readcount() %></td>
 </tr>
 <%} 
 	}%>
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
		if(searchText == null && searchWhat == null) {
	%>
	<a href="r_boardList.jsp?pageNum=<%= startPage-pageBlock %>">[이전]</a>
	<% }else if(searchText == null){  %>
		<a href="r_boardList.jsp?pageNum=<%= startPage-pageBlock %>&searchWhat=<%=searchWhat%>">[이전]</a>
	<%
	}else {	
	%>
	<a href="r_boardList.jsp?pageNum=<%= startPage-pageBlock %>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>">[이전]</a>
	<% 
		}
	}	
	
	for(int i = startPage; i <= endPage; i++){
		if(searchText == null && searchWhat == null){
	%>
	<a href="r_boardList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
	<% }else if(searchWhat == null){ %>
	<a href="r_boardList.jsp?pageNum=<%=i%>&searchWhat=<%=searchWhat%>">[<%=i %>]</a>
	<%
		}else {
	%>		
	<a href="r_boardList.jsp?pageNum=<%=i%>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>">[<%=i %>]</a>
	<% 	
		}
	}
	
	if(endPage < pageCount){
		if(searchText == null) {
	%>
	<a href="r_boardList.jsp?pageNum=<%= startPage+pageBlock %>">[다음]</a>
	<% }else { %>
	<a href="r_boardList.jsp?pageNum=<%= startPage+pageBlock %>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>">[다음]</a>
	<%
	}
	 }
}


	%>
<form action="r_boardList.jsp" onsubmit="return search()" name="searchForm">
 <select name="searchWhat">
  <option value="mr_writer">작성자</option>
  <option value="mr_subject">제목</option>
  <option value="mr_content">내용</option> 
  <option value="mr_header">말머리</option>
 </select>
 <input type="text" name="searchText">
 <input type="submit" value="검색">
</form>
</div>
<div align="center">
<table width = "700" align="center">
 <tr bgcolor="<%=value_c %>">
 <td style="position: absolute; left: 48%;"><a href="r_boardList.jsp">글 목록으로 돌아가기</a></td>
  <td align="right" >
  <a href="r_boardWriteForm.jsp">글쓰기</a></td>
 </tr>
</table>
<hr color="skyblue">
<footer id="footer">
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