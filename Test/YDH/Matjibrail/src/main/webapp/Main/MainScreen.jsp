<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>메인페이지</title>
<style type="text/css">

a{text-decoration:none}

#header
{
	height:150px;
	border-bottom: 1px solid;
	border-color: #81BEF7;
}


#nav
{
	height:70px;
	border-bottom: 1px solid;
	border-color: #81BEF7;
	text-align: center;
	
} 
#nav > span
{
	padding : 20px;
	margin: 60px;
}

#section
{
	height:600px;
	border-bottom: 1px solid;
	border-color: #81BEF7;
}
#footer
{
	height:200px;
	border-bottom: 1px solid;
	border-color: #81BEF7;
	text-align: center;
}

#footer > div > span
{
	padding : 20px;
	margin: 40px;
}


#footer > div > h6
{
	line-height: 1px;
	text-align: left;
	margin-left: 40%;
}


/* 헤더 인풋*/

#mlan
{
	width : 150px;
	height: 40px;
	border: 1px solid;
	border-color: #81BEF7;
}

#mserchbox
{
	width: 200px;
	height: 35px;
	border: 1px solid;
	border-color: #81BEF7;
}

#mserchbt
{
	width : 50px;
	height: 40px;
	background-color: #81BEF7; 
	border: 1px solid;
	border-color: #81BEF7;
}

#mserchlist
{
	width : 100px;
	height: 40px;
	border: 1px solid;
	border-color: #81BEF7;
}
</style>

</head>
<body link="black" vlink="black">
<!-- 위 -->
<div id="header"  >
	<br>
	
	<div style="text-align : right; width:60%; float:left" >
		<a href="MainScreen.jsp"><img alt="" src="images/MainLogo.png"></a>
	</div>
	
	<div style="text-align: right; margin-left: 60% ">
		<form action="" style="margin-right: 5%">
			<select id="mlan" name="laguage" style="text-align: center;">
			<option value="ko">한국어</option> 
			<option value="jp">일본어</option>
			</select>
			<br><br>
			<select id="mserchlist" name="m_searchWhat" style="text-align: center;">
			<option value="header">역이름</option> 
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
			</select>
			<input id="mserchbox" type="text" name="m_serch">
			<input id="mserchbt" type="submit" value="검색" style="font-weight : bold ;">
		</form>
	</div>
	
</div>


<!-- 메뉴바 -->
<div id="nav" >
<br>
<span><a href="">공지사항</a></span>
<span><a href="">자유게시판</a></span>
<span><a href="">맛집리뷰</a></span>
<span><a href="">회원메뉴</a></span>

</div>


<!-- 메인부분 -->
<div id="section">
	<div style="text-align: center;">
	<img alt="" src="images/rail2.png" width="1000px" height="600px">
	</div>
	
</div>



<!-- 하단 -->
<div id="footer">
	<div>
	<span><a href="">페이지 이용방법</a></span>
	<span><a href="">고객문의</a></span>
	<span><a href="">이용약관</a></span>
	<span><a href="">개인정보 처리방침</a></span>
	</div>
	
	<div>
		<h6>상호명 : ㈜ 맛집 노선도</h6>
		<h6>주소 : 서울시 영등포구 영중로 56 신한빌딩 4, 5층 주식회사 글로벌인</h6>
		<h6>Email : matjibcs@gmail.com</h6>
	</div>
	 
	
</div>

</body>
</html>