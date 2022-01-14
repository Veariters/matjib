<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="view/color.jsp" %>
<% request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
<%!
public String getParam(HttpServletRequest req, String param){
	if(req.getParameter(param) != null){
		return req.getParameter(param);
	}
	else{
		return "";
	}
}

%>
<!DOCTYPE html>
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title></title>
<script type="text/javascript">
function fileElement(fe){
	
	var cnt = fe.elements.length;
	
	var filecnt = 1;
	
	for(i=0; i < cnt; i++){
		if(fe.elements[i].type == "file"){
			if(fe.elments[i].value==""){
				alert(filecnt + "번째 파일정보가 누락되었습니다.");
				fe.elements[i].focus();
				return;
			}
			filecnt++;
		}
	}
	fe.submit();
}


</script>
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
<form action="i_boardWriteForm.jsp" name="i_boardWriteForm" method="post" onsubmit="return writeSave()">
<!-- 폼이 넘어갈 때 위의 숫자 변수들을 같이 처리함-->
<input type="hidden" name="num" value="<%=num %>">
<table width="470" border="1" cellpadding="0" cellspacing="0" align="center" bgcolor="<%=bodyback_c%>">
	<tr>
		<td width="140" bgcolor="<%=value_c%>" align="center">아이디</td>
		<td width="330"><input type="text" size="20" maxlength="20" name="mi_writer" value='<%=getParam(request, "mi_writer")%>'></td>
	</tr>
	<tr>
		<td width="140" bgcolor="<%=value_c%>" align="center">비밀번호</td>
		<td width="330"><input type="password" size="20" maxlength="20" name="mi_pass" value='<%=getParam(request, "mi_pass")%>'></td>
	</tr>
	<tr>
		<td width="140" bgcolor="<%=value_c%>" align="center">제목</td>
		<td width="330"><input type="text" size="50" maxlength="50" name="mi_subject" value='<%=getParam(request, "mi_subject")%>'></td>
	</tr>
	<tr>
		<td width="140" bgcolor="<%=value_c%>" align="center">내용</td>
		<td width="330"><textarea rows="14" cols="50" name="mi_content"><%=getParam(request, "mi_content")%></textarea></td>
	</tr>
	<tr>
		<td width="140" bgcolor="<%=value_c%>" align="center">추가할 파일 수(최대 9개)</td>
		<td width="150"><input type="text" size="2" name="add" value='<%=getParam(request, "add")%>'><input type="submit" value="확인"></td>
		
	</tr>
	
	</table>
	</form>
	
	
	<%
	int filecnt = 0;
	
	if(request.getParameter("add") != null){
		
		filecnt = Integer.parseInt(request.getParameter("add"));
	}
	%>
	<form action="i_boardWriteProc.jsp" encType="multipart/form-data" method="post">
		<input type="hidden" name="mi_writer" value="<%=getParam(request, "mi_writer") %>">
		<input type="hidden" name="mi_pass" value="<%=getParam(request, "mi_pass") %>">
		<input type="hidden" name="mi_subject" value="<%=getParam(request, "mi_subject") %>">
		<input type="hidden" name="mi_content" value="<%=getParam(request, "mi_content") %>">
		<input type="hidden" name="add" value="<%=getParam(request, "add") %>">
	<% 
	for(int i = 0; i < filecnt; i++){
		if(filecnt > 9){
			filecnt = 9;
		}
	
	%>
	<%=i+1 %> 번째 파일 선택 : <input type="file" name="mi_image<%=i+1%>"><br>
	
	<%} %>
	<table>
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