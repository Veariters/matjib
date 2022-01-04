<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.I_BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("utf-8"); %>


<%
String realFolder="";
String saveFolder = "C:/ADevelop/eclipse_jspworkspace/JspPractice/image";
String encType = "utf-8";		
int size=5*1024*1024;				

 /* ServletContext context = this.getServletContext();		//절대경로를 얻는다
 realFolder = context.getRealPath(saveFolder);			//saveFolder의 절대경로를 얻음 */ 

 MultipartRequest multi = new MultipartRequest(request, saveFolder, size, encType, new DefaultFileRenamePolicy());		//파일업로드를 직접적으로 담당 		

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
	BoardDAO dbPro = BoardDAO.getInstance();
	
	
	
article.setMi_writer(mi_writer);
article.setMi_pass(mi_pass);
article.setMi_subject(mi_subject);
article.setMi_content(mi_content);
article.setMi_image(mi_image);
article.setMi_postdate(new Timestamp(System.currentTimeMillis()));

dbPro.insertArticle(article);
	response.sendRedirect("i_boardList.jsp"); 
	 	
%>