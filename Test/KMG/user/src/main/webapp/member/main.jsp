<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> LOGIN </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">

  <style>

  #main-title {
  color:#050099;
  font-size:70pt;
  margin-top:20%;
  }

	  .se {font-family: serif;}
      .sa {font-family: sans-serif;}
      .cu {font-family: cursive;}
      .fa {font-family: fantasy;}
      .mo {font-family: monospace;}


  </style>

  <script>

  function enter(){

	var frm=document.loginform;

	if(frm.id.value.length<3){
		alert("아이디를 올바르게 입력해주세요");
		return;
	}

	if(frm.pw.value.length<3){
		alert("비밀번호를 올바르게 입력해주세요");
		return;
	}
	frm.method="get";
	frm.action="./join.html"; //넘어간화면
	frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
	}
</script>

 </HEAD>
 

 <BODY bgcolor="#FFDF24">
 <form name="loginform" method="post">
  <table align="center" height="90">
	<tr>
		<td><div id="main-title">LOGIN<div></td>
	</tr>
  </table>

	<table align="center" height="40" width="430" border="0" style="border:solid 4px #050099; margin-top:4%">
		<tr>
			<td><input type="text" name="id" value="" placeholder="아이디" style="height:40px; width:430px;"></td>
		</tr>
		</table>
	<table align="center" height="40" width="430" border="0" style="border:solid 4px #050099; margin-top:1%">
		<tr>
			<td><input type="password" name="pw" value=""  placeholder="비밀번호" style="height:40px; width:430px"></td>
		</tr>
	</table>

	<table align="center" height="40" style="margin-top:1%">
	<tr>
		<td><input type="button" name="login" value="로그인" style="height:50px; width:430px;  background-color:#050099; color:white; font-size:16px; border:solid 1px #050099; " onClick="enter()"></td>
	</tr>
	</table>

	<table align="center" height="0" width="440" border="1" style="border:solid 1px #050099; margin-top:2%">
	</table>

	<table align="center" height="50" style="margin-top:1%" class="mo">
		<tr>
			<td><a style="text-decoration:none;" href="./2.join.html">회원가입 | </td>
			<td><a style="text-decoration:none;" href="">아이디 찾기 | </td>
			<td><a style="text-decoration:none;" href="">비밀번호 찾기</td>
		</tr>
		
	</table>
   </form>
 </BODY>
</HTML>
