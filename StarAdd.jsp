<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int foodID = Integer.parseInt(request.getParameter("foodID"));
	String CustomerID = (String) session.getAttribute("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");

	PreparedStatement starStmt = null;
	
	String insertStartStr = "INSERT INTO Star(FoodID, UserID) VALUES (?, ?)";
	starStmt = conn.prepareStatement(insertStartStr);
	starStmt.setInt(1,foodID);
	starStmt.setString(2, CustomerID);
	starStmt.executeUpdate();


	
	

	starStmt.close();
	conn.close();
	response.sendRedirect(request.getHeader("referer"));

	

	%>





