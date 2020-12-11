<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
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
        .product{
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .CartBox{
            margin-top: 30px;
            margin-bottom: 30px;
            color: #C0262B;
            font-size: 2.1em;
            font-weight: 800;
            text-shadow:2px 3px pink;
        }
        .Box-total{
            display:inline-block;
            border: 3px dashed #C0262B;
            padding: 20px 40px 20px 40px;
            margin-bottom: 40px;
        }
        button {
            background-color: #00000000;
            border: none;
        }
        .buy{
            font-size: 1.4em;
            font-weight: 600;
            color: white;
            background-color: #C0262BD1;
            border: 2px solid #00000000;
            width: 10em;
        }
        .cart{
            margin-top: 10px;
            font-size: 1.4em;
            font-weight: 600;
            color: #C0262BD1;
            border: 2px solid #00000000;
            width: 10em;
        }
        .buy:hover{
            color: #C0262B;
            background-color: #00000000;
            border: 2px solid #c0262b;
        }
        .cart:hover{
            color: #C0262B;
            border: 2px solid #c0262b;
        }
        footer {
            background-color: #C0262BD1;
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
                <a href="#"><img src="LunchBoxLogo.png" width="300"/></a>
            </div>
            <div class="col-md-1 user-head">
                <a href="login.html"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                <a href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
            </div>
        </div>
    </nav>

    <div class="menu1">
        <ul>
            <li><a href="Menu.jsp">주문</a></li>
            <li><a href="Cart.jsp">장바구니</a></li>
            <li><a href="Review.html">리뷰</a></li>
            <li><a href="My.jsp">마이페이지</a></li>
        </ul>
    </div>
</div>


<%
	int CartID = Integer.parseInt(request.getParameter("CartID"));

%>
<script>
	function saveBtn(){
		alert("북마크에 저장되었습니다.");
	}

</script>
<div class="container text-center">
    <img src="ribbon.png" class="bg-image" width="400px;"/>

    <div class="bg-text">
        <h1>BookName</h1>
        <form action="Bookmark.jsp" method="post">
            <input type="text" name = "BookName" placeholder="Enter Bookmark Name" /><br>
    		<input type = "hidden" name = "CartID" value = <%=CartID %>>
            <input onclick="javascript:saveBtn()"type="submit" name = "저장">
        </form>
    </div>
    
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