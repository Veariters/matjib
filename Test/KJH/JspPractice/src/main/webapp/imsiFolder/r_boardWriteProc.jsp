<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.R_BoardVO" %>
<%@ page import="board.R_BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
ArrayList saveFile = new ArrayList();		// 저장될 파일 이름
ArrayList oldFile = new ArrayList(); 		// 실제 파일 이름




String realFolder = "";
String saveFolder = "/r_board/image";					// 학원에서 할 때
//String saveFolder = "C:/ADevelop/jspproject/JspPractice/src/main/webapp/i_board/image";					// 집에서 할 때
String encType = "utf-8";		
int size=5*1024*1024;	

ServletContext context = request.getServletContext();
realFolder = context.getRealPath(saveFolder);
System.out.println("============ uploadFilePath = " + realFolder);


 MultipartRequest multi = new MultipartRequest(request, realFolder, size, encType, new DefaultFileRenamePolicy());		//파일업로드를 직접적으로 담당 		
String mr2_image = "";
 String mr2_writer = multi.getParameter("mr2_writer");
 String mr2_pass = multi.getParameter("mr2_pass");
 String mr2_subject = multi.getParameter("mr2_subject");
 String mr2_content = multi.getParameter("mr2_content");
 String add = multi.getParameter("add");
 
 if(Integer.parseInt(add) > 0){
 for(int i = 0; i < Integer.parseInt(add); i++){
	 mr2_image += (multi.getFilesystemName("mr2_image"+(i+1))+ ",");
 }
 }else{
	 mr2_image="";
 }
 
 mr2_image = mr2_image.substring(0, mr2_image.length()-1);
 
 Enumeration e = multi.getFileNames();
 
 while(e.hasMoreElements()){
	 String n = (String)e.nextElement();
	 saveFile.add(multi.getFilesystemName(n));
	 oldFile.add(multi.getOriginalFileName(n));
 }
 
 
 String mr2_postdate = request.getParameter("mr2_postdate");
	
	
 /* File file = multi.getFile("mi_image");
	long filesize = 0;
	if ( file != null ) {
		filesize = file.length();
	} */
	
	R_BoardVO article = new R_BoardVO();
	R_BoardDAO dbPro = R_BoardDAO.getInstance(); 
	
	request.setAttribute("imgArr", mr2_image);
	
article.setMr2_writer(mr2_writer);
article.setMr2_pass(mr2_pass);
article.setMr2_subject(mr2_subject);
article.setMr2_content(mr2_content);
article.setMr2_image(mr2_image);
article.setMr2_postdate(new Timestamp(System.currentTimeMillis()));

dbPro.insertArticle(article);


response.sendRedirect("r_boardList.jsp");
%>