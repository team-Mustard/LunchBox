<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
	String CustomerID = (String) session.getAttribute("id");
	int BookID = Integer.parseInt(request.getParameter("bookID"));

	String deleteBookStr = "DELETE FROM Bookmark WHERE BookID =" + BookID;
	
	PreparedStatement deleteBookStmt = null;
	
	
	deleteBookStmt = conn.prepareStatement(deleteBookStr);
	deleteBookStmt.executeUpdate();
	deleteBookStmt.close();
	response.sendRedirect(request.getHeader("referer"));
	
	
	
	
%>