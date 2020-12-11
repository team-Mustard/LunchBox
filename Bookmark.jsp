<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
	request.setCharacterEncoding("UTF-8");

	int CartID = Integer.parseInt(request.getParameter("CartID"));
	String BookName = request.getParameter("BookName");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");

	PreparedStatement BookStmt = null;
	
	String insertBookmarkStr = "INSERT INTO Bookmark(BookName, CartID)  VALUES (?, ?)";
	
	BookStmt = conn.prepareStatement(insertBookmarkStr);
	BookStmt.setString(1, BookName);
	BookStmt.setInt(2, CartID);
	
	BookStmt.executeUpdate();


	
	

	BookStmt.close();
	conn.close();
	response.sendRedirect("My.jsp");

	

	%>



</html>

