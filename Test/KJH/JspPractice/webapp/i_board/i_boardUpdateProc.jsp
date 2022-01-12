<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.I_BoardVO" %>
<%@ page import="board.I_BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%
request.setCharacterEncoding("utf-8");
out.println("여기까지성공1");

String realFolder = "";
String saveFolder = "/i_board/image";					// 학원에서 할 때
//String saveFolder = "C:/ADevelop/jspproject/JspPractice/src/main/webapp/i_board/image";					// 집에서 할 때
String encType = "utf-8";		
int size=5*1024*1024;	

ServletContext context = request.getServletContext();
realFolder = context.getRealPath(saveFolder);
System.out.println("============ uploadFilePath = " + realFolder);
	

 MultipartRequest multi = new MultipartRequest(request, realFolder, size, encType, new DefaultFileRenamePolicy());		//파일업로드를 직접적으로 담당 		

 String mi_writer = multi.getParameter("mi_writer");
 String mi_pass = multi.getParameter("mi_pass");
 String mi_subject = multi.getParameter("mi_subject");
 String mi_content = multi.getParameter("mi_content");
 String mi_image = multi.getFilesystemName("mi_image");
 String mi_postdate = request.getParameter("mi_postdate");

 File file = multi.getFile("mi_image");
	long filesize = 0;
	if ( file != null ) {
		filesize = file.length();
	}
	
	I_BoardVO article = new I_BoardVO();
	I_BoardDAO dbPro = I_BoardDAO.getInstance();
	
	
	
article.setMi_writer(mi_writer);
article.setMi_pass(mi_pass);
article.setMi_subject(mi_subject);
article.setMi_content(mi_content);
article.setMi_image(mi_image);
article.setMi_postdate(new Timestamp(System.currentTimeMillis()));


String pageNum = request.getParameter("pageNum");


int check = dbPro.updateArticle(article);

if(check==1){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="0; url=i_boardList.jsp?pageNum=<%=pageNum%>">
<title></title>
</head>
<body>
<div align="center">
<%}else{ %>
<script type="text/javascript">
alert("비밀번호가 일치하지 않습니다.");
history.go(-1);
</script>
<%} %>
</div>
</body>
</html>
