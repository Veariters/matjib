<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="view/color.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<title></title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<!-- 새글과 답변글을 구분하기 위한 코드 작성 -->
<%
	int num=0;		// 새 글이 처음 만들어졌을 때의 값들 초기화
	
	try{
		if(request.getParameter("mi_num") != null){				// 무언가 글이 있을 경우
			num = Integer.parseInt(request.getParameter("mi_num"));		// num = DB상에 저장되어 있는 해당 게시글의 일련번호
		}
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
		<li><a href="i_boardList.jsp" class="menuLink">공지사항</a></li>
		<li><a href="#" class="menuLink">자유게시판</a></li>
		<li><a href="#" class="menuLink">맛집 리뷰 게시판</a></li>
		<li><a href="#" class="menuLink">회원 메뉴</a></li>
	</ul>
</nav>
<hr color="skyblue">
<div style="position: absolute; left: 35%; font-size:2em;"><b>글쓰기</b></div><br><br>
<form action="i_boardWriteProc.jsp" name="i_boardWriteForm" method="post" onsubmit="return writeSave()" encType="multipart/form-data">
<!-- 폼이 넘어갈 때 위의 숫자 변수들을 같이 처리함-->
<input type="hidden" name="num" value="<%=num %>">
<table width="400" border="1" cellpadding="0" cellspacing="0" align="center" bgcolor="<%=bodyback_c%>">
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">아이디</td>
		<td width="330"><input type="text" size="20" maxlength="20" name="mi_writer"></td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
		<td width="330"><input type="password" size="20" maxlength="20" name="mi_pass"></td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">제목</td>
		<td width="330"><input type="text" size="50" maxlength="50" name="mi_subject"></td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">내용</td>
		<td width="330"><textarea rows="14" cols="50" name="mi_content"></textarea></td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">첨부파일</td>
		<td width="150"><input type="file" name="mi_image"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center" bgcolor="<%=value_c%>"><input type="submit" value="글쓰기">
															  <input type="reset" value="다시작성">
															  <input type="button" value="목록" onClick="window.location='i_boardList.jsp'"></td>
	</tr>
</table>
</form>
<%}catch(Exception e){} %>
</body>
</html>