<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.R_BoardVO" %>
<%@ page import="board.R_BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%
request.setCharacterEncoding("utf-8");
out.println("여기까지성공1");

String realFolder = "";
String saveFolder = "/r_board/image";					// 학원에서 할 때
//String saveFolder = "C:/ADevelop/jspproject/JspPractice/src/main/webapp/i_board/image";					// 집에서 할 때
String encType = "utf-8";		
int size=5*1024*1024;	

ServletContext context = request.getServletContext();
realFolder = context.getRealPath(saveFolder);
System.out.println("============ uploadFilePath = " + realFolder);
	

 MultipartRequest multi = new MultipartRequest(request, realFolder, size, encType, new DefaultFileRenamePolicy());		//파일업로드를 직접적으로 담당 		

 String mr_writer = multi.getParameter("mr_writer");
 String mr_pass = multi.getParameter("mr_pass");
 String mr_subject = multi.getParameter("mr_subject");
 String mr_content = multi.getParameter("mr_content");
 String mr_image = multi.getFilesystemName("mr_image");
 String mr_postdate = request.getParameter("mr_postdate");

 File file = multi.getFile("mr_image");
	long filesize = 0;
	if ( file != null ) {
		filesize = file.length();
	}
	
	R_BoardVO article = new R_BoardVO();
	R_BoardDAO dbPro = R_BoardDAO.getInstance();
	
	System.out.println("여기까지2");
	
article.setMr_writer(mr_writer);
article.setMr_pass(mr_pass);
article.setMr_subject(mr_subject);
article.setMr_content(mr_content);
article.setMr_image(mr_image);
article.setMr_postdate(new Timestamp(System.currentTimeMillis()));

System.out.println("여기까지3");
String pageNum = request.getParameter("pageNum");


int check = dbPro.updateArticle(article);

if(check==1){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="0; url=r_boardList.jsp?pageNum=<%=pageNum%>">
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
