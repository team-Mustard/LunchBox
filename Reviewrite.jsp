<%@page import="java.sql.*,java.util.*"%>
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
        textarea{
            width: 100%;
            height: 100px;
            align-content: center;
        }
        button{
            float: right;
            padding: 10px 40px 10px 40px;
            font-weight: bold;
            background-color: #fa5a5a;
            color: white;
            border: 1px solid #C0262Bd1;
            border-radius: 12px;
            margin-bottom: 10px;
        }
        button:hover{
            color: #fa5a5a;
            background-color: white;
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
                <a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                <a href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
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
request.setCharacterEncoding("UTF-8");
   int food1ID = 0;
   int food2ID = 0;
   int food3ID = 0;
   int food4ID = 0;
   int food5ID = 0;
   int food6ID = 0;
   String Food1Name = null;
   String Food2Name = null;
   String Food3Name = null;
   String Food4Name = null;
   String Food5Name = null;
   String Food6Name = null;
   String selectFoodStr = null;
   Statement foodStmt = null;
   ResultSet foodRset;
   int boxID = Integer.parseInt(request.getParameter("boxID"));
   int cartID = Integer.parseInt(request.getParameter("cartID"));
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
   String sqlstr = "SELECT * FROM box WHERE boxID=" + boxID;
   Statement stmt = conn.createStatement();
   stmt = conn.prepareStatement(sqlstr);
   ResultSet rset = stmt.executeQuery(sqlstr);
   
   rset.next();
   food1ID = rset.getInt("Food1ID");
   food2ID = rset.getInt("Food2ID");
   food3ID = rset.getInt("Food3ID");
   food4ID = rset.getInt("Food4ID");
   food5ID = rset.getInt("Food5ID");
   food6ID = rset.getInt("Food6ID");
   
   if(food1ID != 0){
       
       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food1ID;
        foodStmt = conn.prepareStatement(selectFoodStr);   
        foodRset = foodStmt.executeQuery(selectFoodStr);
        foodRset.last();               
       	Food1Name = foodRset.getString("foodName");
 
    }
    if(food2ID != 0){
       
       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food2ID;
        foodStmt = conn.prepareStatement(selectFoodStr);   
        foodRset = foodStmt.executeQuery(selectFoodStr);
        foodRset.last();   
       Food2Name = foodRset.getString("foodName");

    }
    if(food3ID != 0){
       
       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food3ID;
        foodStmt = conn.prepareStatement(selectFoodStr);   
        foodRset = foodStmt.executeQuery(selectFoodStr);
        foodRset.last();   
       Food3Name = foodRset.getString("foodName");

    }
    if(food4ID != 0){
       
       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food4ID;
        foodStmt = conn.prepareStatement(selectFoodStr);   
        foodRset = foodStmt.executeQuery(selectFoodStr);
        foodRset.last();   
       Food4Name = foodRset.getString("foodName");

    }
    if(food5ID != 0){
       
       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food5ID;
        foodStmt = conn.prepareStatement(selectFoodStr);   
        foodRset = foodStmt.executeQuery(selectFoodStr);
        foodRset.last();   
       Food5Name = foodRset.getString("foodName");

    }
    if(food6ID != 0){
       
       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food6ID;
        foodStmt = conn.prepareStatement(selectFoodStr);   
        foodRset = foodStmt.executeQuery(selectFoodStr);
        foodRset.last();   
       Food6Name = foodRset.getString("foodName");

    }
%>



<div class="container">
    
    <h4>"food list in box"<br>
    	<% if(Food1Name !=null){ out.println(Food1Name); }
           if(Food2Name !=null){ out.println(Food2Name); }
           if(Food3Name !=null){ out.println(Food3Name); }
           if(Food4Name !=null){ out.println(Food4Name); }
           if(Food5Name !=null){ out.println(Food5Name); }
           if(Food6Name !=null){ out.println(Food6Name); } %>
    </h4>
    <h5>After writing your review, press the Submit button.</h5>
    <form action="ReviewriteCheck.jsp" method="post">
    	<input type = "hidden" name = "cartID" value = <%=cartID %>>
    	<textarea type="text" name="review" placeholder="190자 이내, 줄바꿈 3번 이내로 작성해주세요."></textarea><br>
    	<button type="submit">Submit</button>
    </form>    
</div>
    
  <%rset.close();
  	stmt.close();
  	conn.close();%>  
    
    
    
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
glyphicon glyphicon-envelope"> elephant890@naver.com</span>
          </p>
          <p>
            최승혜<br>
              <span class="
glyphicon glyphicon-envelope"> 승해 이메일 ^_^</span>
          </p>
          <p>
            이주영<br>
              <span class="
glyphicon glyphicon-envelope"> 영주 이메일 ^_^</span>
          </p>
      </div>
  </row>
</footer>
</body>
</html>