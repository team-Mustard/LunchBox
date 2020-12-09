<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %> 
   
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>LunchBox</title>  
    
<%
   request.setCharacterEncoding("UTF-8");
   String Review = request.getParameter("review");
   int cartID = Integer.parseInt(request.getParameter("cartID"));
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
   
   Date nowTime = new Date();
   
   String sqlstr = "INSERT INTO review (ReviewDate, ReviewContent, CartID) VALUES (now(), ?, ?)";
   
   PreparedStatement pstmt = conn.prepareStatement(sqlstr);
   pstmt.setString(1, Review);
   pstmt.setInt(2, cartID);
   pstmt.executeUpdate();
   
    conn.close();
    pstmt.close();
    
    response.sendRedirect("My.jsp");
    %> 
</body>
</html>