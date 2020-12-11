<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int foodID = Integer.parseInt(request.getParameter("foodID"));
	int StarID = Integer.parseInt(request.getParameter("starID"));
	String CustomerID = (String) session.getAttribute("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");


	String deleteStarStr = "DELETE FROM Star WHERE StarID =" + StarID;
	
	PreparedStatement deleteBookStmt = null;
	
	deleteBookStmt = conn.prepareStatement(deleteStarStr);
	deleteBookStmt.executeUpdate();
	deleteBookStmt.close();
	response.sendRedirect(request.getHeader("referer"));
	

	

	%>





