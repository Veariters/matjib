<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.R_BoardVO"%>
<%@ page import="board.R_BoardDAO"%>
<%@ include file="view/color.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<%
int num = Integer.parseInt(request.getParameter("mr_num"));
String pageNum = request.getParameter("pageNum");

try {

	R_BoardDAO dbPro = R_BoardDAO.getInstance();

	R_BoardVO article = dbPro.updateGetArticle(num);
	
	
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
<body bgcolor="<%=bodyback_c%>">
	<form name="chooseLanguage" align="right">
		<select name="Language">
			<option value="Korean">한국어</option>
			<option value="Japaness">Japaness</option>
		</select>
	</form>
	<br>
	<div align="center">
		<font size="6em"><b>맛집 노선도</b></font><br>
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
		<div style="position: absolute; left: 35%; font-size: 2em;">
			<b>글수정</b>
		</div>
		<br>
		<br>
		<form action="r_boardUpdateProc.jsp?pageNum=<%=pageNum%>"
			method="post" name="writeForm" onsubmit="return writeSave()"
			encType="multipart/form-data">
			<table width="400" border="1" cellpadding="0" cellspacing="0"
				align="center" bgcolor="<%=bodyback_c%>">
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">아이디</td>
					<td width="330" align="left"><input type="text" size="20"
						maxlength="20" name="mr_writer"
						value="<%=article.getMr_writer()%>"> <input type="hidden"
						name="mr_num" value="<%=article.getMr_num()%>"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">제목</td>
					<td width="330" align="left"><input type="text" size="50"
						maxlength="50" name="mr_subject"
						value="<%=article.getMr_subject()%>"> <!-- 새글일 경우 --></td>
				</tr>
				<tr>
					<td width="140" bgcolor="<%=value_c%>" align="center">구간 선택</td>
					<td width="330" height="10"><select name="mr_bcheck" onchange="stationChoice(this)" value='<%=getParam(request, "mr_bcheck")%>'>
							<option value="">-------구간을 선택하세요---------</option>
							<option value="10" align="center">구간1(신촌~뚝섬)</option>
							<option value="20" align="center">구간2(신설동~종합운동장)</option>
							<option value="30" align="center">구간3(삼성~구로디지털단지)</option>
							<option value="40" align="center">구간4(대림~홍대입구)</option>
					</select></td>
					<td width="140" bgcolor="<%=value_c%>" align="center">역이름 선택</td>
					<td width="330" height="10"><select name="mr_header"
						id="mr_header" value='<%=getParam(request, "mr_header")%>'>
							<option value="" align="center">--------역 이름을
								선택하세요-------</option>
					</select></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">내용</td>
					<td width="330" align="left"><textarea rows="14" cols="50"
							name="mr_content"><%=article.getMr_content()%>"</textarea></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">기존파일<br><%=article.getMr_image()%></td>
					<td width="150"><input type="file" name="mr_image"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
					<td width="330" align="left"><input type="password" size="20"
						maxlength="20" name="mr_pass"></td>
				</tr>

				<tr>
					<td colspan="2" align="center" bgcolor="<%=value_c%>"><input
						type="submit" value="글수정"> <input type="reset"
						value="다시작성"> <input type="button" value="목록"
						onClick="document.location='r_boardList.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>

		</form>
	</div>
	<%}catch(Exception e){} %>

</body>
</html>