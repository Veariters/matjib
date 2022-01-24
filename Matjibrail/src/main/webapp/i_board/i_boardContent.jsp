<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.I_BoardVO" %>
<%@ page import="board.I_BoardDAO" %>
<%@ page import="board.CommentDAO" %>
<%@ page import="board.CommentVO" %>
<%@ page import="java.util.List" %>
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



	int mi_num = Integer.parseInt(request.getParameter("mi_num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	
	   I_BoardDAO dao = new I_BoardDAO();   
	  // int Recommand= dao.Recommand(Integer.parseInt(request.getParameter("mi_num"))); 
	
	try{
		I_BoardVO article = new I_BoardVO();
		I_BoardDAO dbPro = I_BoardDAO.getInstance();
		
		article = dbPro.getArticle(mi_num);
		

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
		<li><a href="#" class="menuLink">자유게시판</a></li>
		<li><a href="#" class="menuLink">맛집 리뷰 게시판</a></li>
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
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMi_num() %></td>
				<td align="center" width="140" bgcolor="<%=value_c%>">조회수</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMi_readcount() %></td>
			</tr>
			<tr height="30">
				<td align="center" width="140" bgcolor="<%=value_c%>">작성자</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMi_writer() %></td>
				<td align="center" width="140" bgcolor="<%=value_c%>">작성일</td>
				<td align="center" width="140" bgcolor="<%=bodyback_c%>"><%=article.getMi_postdate() %></td>
			</tr>
			<tr>
				<td align="center" width="140" bgcolor="<%=value_c%>">제목</td>
				<td colspan="3" align="center" width="280" bgcolor="<%=bodyback_c%>"><%=article.getMi_subject() %></td>
			</tr>
			<tr>
				<td colspan="4" height="200" valign="top">
					<div>
					<%
					if(article.getMi_image() != null){
						
						String [] imgArr = article.getMi_image().split(",");

						for(int i = 0; i < imgArr.length; i++){
							article.setMi_image(imgArr[i]);
					
					%>
						<img src="image/<%=article.getMi_image() %>" width="200" onerror=""><br>
						
						<%} } %>
					</div><br><br>
					<%=article.getMi_content() %>
				</td>
			</tr>

			<tr height="30">
				<td colspan="4" bgcolor="<%=value_c%>" align="right">
					<input type="button" value="글쓰기" onClick="document.location.href='i_boardWriteForm.jsp'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<input type="button" value="수정하기" onClick="document.location.href='i_boardUpdateForm.jsp?mi_num=<%=article.getMi_num()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<input type="button" value="삭제하기" onClick="document.location.href='i_boardDeleteForm.jsp?mi_num=<%=article.getMi_num()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp;

					<input type="button" value="글목록" onClick="document.location.href='i_boardList.jsp?pageNum=<%=pageNum%>'">
				</td>
				
			</tr>
		</table>
</form>
<%

String num = request.getParameter("mi_num");	


String loginID = (String)session.getAttribute("loginID");

int check = recommend.recommendCheck(Integer.parseInt(num), loginID);

%>
 
</div>
	<%
	}catch(Exception e){}
%>

<%

// 한 페이지에 보여줄 목록 수 지정
int pageSize = 5;


String searchWhat = request.getParameter("searchWhat");
// writer, subject, content
String searchText = request.getParameter("searchText");
// 검색할 내용

if(searchText != null) {
   searchText = new String(searchText.getBytes("utf-8"), "utf-8");
}


if(pageNum == null) {
   pageNum = "1";
}

// 현재 페이지
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage -1) * pageSize +1;
int endRow = currentPage * pageSize;

int count = 0;
int number = 0;

List<CommentVO> articleList = null;
CommentDAO dbPro = CommentDAO.getInstance();
count = dbPro.getArticleCount(mi_num);   // 전체 글 수

// 검색이 아니면 전체 리스트를 보여주고 검색이면 검색한 내ㅑ용만 보여줌

if(searchText == null) {
   count = dbPro.getArticleCount(mi_num);   // 전체 글수
   
   if(count > 0) {
      
      articleList = dbPro.getArticles(startRow, endRow, mi_num);
   }
}else {
   
   count = dbPro.getArticleCount(searchWhat, searchText);   // 전체 글수
   
   if(count > 0) {
      articleList = dbPro.getArticles(searchWhat, searchText, startRow, endRow);
   }
    number = count -(currentPage -1) * pageSize; 
}

%>

<div align="center"><b>댓글목록(전체 댓글 : <%=count %>)</b>

<%
   if(count == 0) {   // 글이 없을 경우
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
   <tr align="center">
      <td>게시판에 저장된 글이 없습니다.</td>
   </tr>
</table>
<%   }else {   // 글이 있을 경우 %>
<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
   <tr height="30" bgcolor="<%=value_c %>">	
      <td align="center" width="50">번호</td>
      <td align="center" width="250">내용</td>
      <td align="center" width="100">작성자</td>
      <td align="center" width="150">작성일</td>
      <td align="center" width="50">조회</td>

   </tr>

   <%

   
    for(int i = 0; i < articleList.size(); i++) {
	   CommentVO article = (CommentVO)articleList.get(i);  
   %>
   <tr height="30">
      <td align="center" width="50"><%=(number++)+1 %></td>
      <td width="250">
         <%
            int wid = 0;
            
            if(article.getDepth() > 0) {
               wid = 5 * (article.getDepth());
         %>
         <img src="../img/level.gif" width="<%=wid%>" height="16">
         <img src="../img/re.gif">
         <%
            }else {
         %>
         <img src="../img/level.gif" width="<%=wid%>" height="16">
         <%
            }
         %>
            <%=article.getContent() %>
            
         <% if(article.getReadcount() >= 20) { %>
         
         <img src="../img/hot.gif" border="0" height="16">
         <%} %>
      </td>
      <td align="center" width="100">
             <%=article.getWriter() %>
 
      </td>
      <td align="center" width="150">
         <%=sdf.format(article.getRegdate()) %>
      </td>
  
      	<td align="center" colspan="5"><input type="submit"
	value="댓글삭제 "
	onClick="document.location.href='commentDeleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	</td> 
         
      
      
   </tr>

   <%} %>

   
  
   
</table>
<%   } %>
</div>

<!-- 페이징 처리 -->
<%
if(count > 0) {
   int pageBlock = 10;
   int imsi = count % pageSize == 0 ? 0 : 1;
   int pageCount = count/pageSize + imsi;
   
   int startPage = (int)((currentPage -1) / pageBlock) * pageBlock + 1;
   int endPage = startPage + pageBlock -1;
   
   if(endPage > pageCount) endPage = pageCount;
   
   if(startPage > pageBlock) {
      
      // 검색일 경우와 아닐 경우 페이지 처리
      if(searchText == null) {
%>
      <a href="i_boardContent.jsp?mi_num=<%=mi_num %>&pageNum=<%=startPage-pageBlock%>">[이전]</a>
      <%
      }else {
      %>
      <a href="i_boardContent.jsp?mi_num=<%=mi_num %>&pageNum=<%=startPage-pageBlock%>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>"></a>
<%
      }
   }
   for(int i = startPage; i <= endPage; i++) {
      if(searchText == null) {
%>   
<a href="i_boardContent.jsp?mi_num=<%=mi_num %>&pageNum=<%=i%>">[<%=i%>]</a>
<%   }else { %>
   <a href="i_boardContent.jsp?mi_num=<%=mi_num %>&pageNum=<%=i%>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>"></a>
<% }
   }
   if(endPage < pageCount) {
      if(searchText == null) {
%>
<a href="i_boardContent.jsp?mi_num=<%=mi_num %>&pageNum=<%=startPage+pageBlock%>">[다음]</a>
<%}else { %>
   <a href="i_boardContent.jsp?mi_num=<%=mi_num %>&pageNum=<%=startPage+pageBlock%>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>"></a>

<%   }
} 

   if(endPage < pageCount) {
      %>
      <a href="i_boardContent.jsp?mi_num=<%=mi_num %>&pageNum=<%=startPage+pageBlock%>">[다음]</a>
<%} 
}%>

 <!-- 새글과 답변글을 구분하는 코드 작성 -->
<%
String loginID = (String)session.getAttribute("loginID");

	try{
	int num = 0, ref=1, step=0, depth=0;
	
	
		if(request.getParameter("num")!=null){
		
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			step = Integer.parseInt(request.getParameter("step"));
			depth = Integer.parseInt(request.getParameter("depth"));
		}
	
%> 
<!-- 댓글 내용입력부 -->
<div class="container">
	<div class="form-group">
		<form method="post" action="commentproc.jsp">
		
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="ref" value="<%=ref%>">
			<input type="hidden" name="step" value="<%=step%>">
			<input type="hidden" name="depth" value="<%=depth%>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	
				<tr>
					<td><input type="hidden" name="writer" value="<%=loginID%>"></td> <!-- 글쓴이 -->
					<td><input type="hidden" name="email" value="123@naver.com"></td><!-- 이메일 -->
					<td><input type="hidden" name="subject" value="12345"></td> <!-- 제목 -->
                    <td><input type="hidden" name="pass" value="12345"></td> <!-- 비번 -->
                    <td><input type="hidden" name="c_num" value="<%=mi_num%>"></td> <!-- 게시번호 -->
                    
				</tr>
				<tr>
					<td style="border-bottom:none;" valign="middle"><br><br><%= loginID %></td>
					<td><input type="text"  style="height:100px; width: 500px" class="form-control" placeholder="댓글 내용을 입력해주세요." name = "content"></td>
					<td><br><br><input type="submit" class="btn-primary pull" value="작성"></td>
				</tr>

			</table>
		</form>
	</div>
</div>
	


	<%
	}catch(Exception e){}
%>

</div>



</body>
</html>
