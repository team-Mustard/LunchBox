<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "true" %>
   
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
   
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   Connection con = null;
   ResultSet rs = null;
   Class.forName("com.mysql.jdbc.Driver");
   
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1234");
   String sql = "SELECT * FROM Customer WHERE CustomerID = '" + id + "'";
   
   Statement pstmt = con.createStatement();
   pstmt = con.prepareStatement(sql);
   rs = pstmt.executeQuery(sql);
   
   
   if(rs.next()){
	   String PW = rs.getString("CustomerPW");
	   if(pw.equals(PW)){
		   
         session.setAttribute("id", id);
         out.println("로그인 성공");
         
         
      }else{
         %>
         <script>
            alert('패스워드 틀림');
            history.back();
         </script>
         
         <%
      }
   } else {%>
      <script>
         alert('아이디 없음');
         history.back();
      </script>
      
      <%
   }
  
   	response.sendRedirect("Menu.jsp");
    con.close();
    pstmt.close();
    rs.close();
    
    
    %> 
</body>
</html>