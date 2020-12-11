<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style>
        .top {
            background-color: #E6E0DA;
        }
        .user-head {
            position:absolute;
            top: 10px;
            right: 10px;
        }
        .user-head .glyphicon {
            font-size: 25px;
            color : #C0262B;
        }
        ul {
            text-align: center;
            border-top : 3px solid #C0262B;
            border-bottom: 3px solid #C0262B;
            padding: 10px;
        }
        ul li a:visited{
            color: #C0262B;
        }
        ul li {
            display: inline;
            padding: 20px;
        }
        ul li a {
            color: #C0262B;
            text-decoration: none;
        }
        ul li a:hover {
            color: #C0262B;
        }
        .review-head{
            margin-top: 30px;
            margin-bottom: 30px;
            padding-left: 5%;
            color: #C0262B;
            font-size: 2.1em;
            font-weight: 800;
            text-shadow:2px 3px pink;
        }
        .Box{
            padding-top: 10px;
            padding-bottom: 10px;
        }
        button {
            background-color: #00000000;
            border: none;
        }
        footer {
            background-color: #C0262Bd1;
            color: white;
        }
    </style>
</head>
<body>
<div class="container top">
    <nav class="navbar navbar-custom">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10 text-center">
                <a href="Menu.jsp"><img src="LunchBoxLogo.png" width="300"/></a>
            </div>
            <div class="col-md-1 user-head">
                <a href="Login.html"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                <a href="Logout.jsp"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
            </div>
        </div>
    </nav>

    <div class="menu1">
        <ul>
            <li><a href="Menu.jsp">주문</a></li>
            <li><a href="Cart.jsp">장바구니</a></li>
            <li><a href="#">리뷰</a></li>
            <li><a href="My.jsp">마이페이지</a></li>
        </ul>
    </div>
</div>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
String sqlstr = "SELECT * FROM review";
Statement stmt = conn.createStatement();
PreparedStatement stmt2 = null;
PreparedStatement stmt3 = null;
stmt = conn.prepareStatement(sqlstr);
ResultSet rset = stmt.executeQuery(sqlstr);
ResultSet rset2 = null;
ResultSet rset3 = null;

while(rset.next()){
	String ReviewContent = rset.getString("ReviewContent");
	int ReviewID = rset.getInt("ReviewID");
	Date day = rset.getDate("ReviewDate");
	int CartID = rset.getInt("CartID");

	String sqlstr2 = "SELECT * FROM cart WHERE CartID=" + CartID;
	stmt2 = conn.prepareStatement(sqlstr2);

	rset2 = stmt2.executeQuery(sqlstr2);
	rset2.next();
	String userID = rset2.getString("CustomerID");
	int boxID = rset2.getInt("BoxID");

	String sqlstr3 = "SELECT * FROM box WHERE BoxID=" + boxID;
	stmt3 = conn.prepareStatement(sqlstr3);

	rset3 = stmt3.executeQuery(sqlstr3);
	rset3.next();
	int totalPrice = rset3.getInt("TotalPrice");
%>


<div class="container">   
    <p class="review-head">"User's Review"</p>
        <row class="Box">
            <div class="col-xs-4 Box text-center">
                <img src="LunchBoxLogo.png" height="120px"/><br>
            </div>
            <div class="col-xs-8" style="height: 200px;">
                <h4>
                	<%=userID %>
                </h4>
                <p>$ Total Price: <%=totalPrice %></p>
                <p>주문 날짜: <%=day %></p>
                <p> <%= ReviewContent %></p>
            </div>
        </row>
        
        
     <%	
     	rset2.close();
     	rset3.close();
		stmt.close();
		stmt2.close();
		stmt3.close();} 
		conn.close();
		rset.close(); %>
           
    
</div>
    
    
    
<footer class="container">
  <row>
      <div class="col-md-8">
        <p>
            Project of Database System<br>
            Software department at Chungbuk National University with Professor Aziz.
        </p>
      </div>
      <div class="col-md-4">
          <p>
            이송이<br>
              <span class="
glyphicon glyphicon-envelope"> SosSong@cbnu.ac.kr</span>
          </p>
          <p>
            최승혜<br>
              <span class="
glyphicon glyphicon-envelope"> Ssbbs2@cbnu.ac.kr</span>
          </p>
          <p>
            이주영<br>
              <span class="
glyphicon glyphicon-envelope"> DBAplus@cbnu.ac.kr</span>
          </p>
      </div>
  </row>
</footer>
</body>
</html>