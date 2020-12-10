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
            <li><a href="#">장바구니</a></li>
            <li><a href="Review.jsp">리뷰</a></li>
            <li><a href="My.jsp">마이페이지</a></li>
        </ul>
    </div>
</div>
<%
	int cartBoxID = 0;
	
	String CustomerID = (String) session.getAttribute("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
	
	
	Statement cartStmt = conn.createStatement();
	String selectCartStr = "SELECT * FROM Cart WHERE CartStatus = 'false' AND CustomerID = '" + CustomerID + "'";
	
	cartStmt = conn.prepareStatement(selectCartStr);
	ResultSet cartRset = cartStmt.executeQuery(selectCartStr);
	String CartID = null;
	Statement boxStmt = conn.createStatement();
	
	ResultSet boxRset = null;
	

	int food1ID = 0;
	int food2ID = 0;
	int food3ID = 0;
	int food4ID = 0;	
	int food5ID = 0;
	int food6ID = 0;
	int boxTotalPrice = 0;
	if(cartRset.next() != false)
	{
		CartID = cartRset.getString("CartID");
		cartBoxID = cartRset.getInt("BoxID");
		String selectBoxStr = "SELECT * FROM Box WHERE BoxID = "+ cartBoxID;					
		boxStmt = conn.prepareStatement(selectBoxStr);
		boxRset = boxStmt.executeQuery(selectBoxStr);	

		if(boxRset.next()!=false){

			food1ID = boxRset.getInt("food1ID");
			food2ID = boxRset.getInt("food2ID");
			food3ID = boxRset.getInt("food3ID");
			food4ID = boxRset.getInt("food4ID");	
			food5ID = boxRset.getInt("food5ID");
			food6ID = boxRset.getInt("food6ID");
			boxTotalPrice = boxRset.getInt("totalPrice");
			
		}
	}
	
	
	
	
	
	Statement foodStmt = null;
	String selectFoodStr;
	ResultSet foodRset = null;
	String FoodName;
	String FoodID;
	int FoodPrice;
	String FoodImage;
	
	
%>
<script>
   function buyBtn(){
      alert('주문이 완료되었습니다.');
   }
   
   function deleteBtn(){
	   alert('장바구니에서 삭제되었습니다.');
   }
</script>
<div class="container text-center">
    <p class="CartBox">"Shopping Cart"</p>
    <div class="Box-total">
        <p><%=boxTotalPrice %> </p>
        <form action = "Buy.jsp" method = "post">
        <input type = "hidden" name = "CartID" value = <%=CartID %>>
     	<input type = "hidden" name = "TotalPrice" value = <%=boxTotalPrice %>>
        
        <input onclick="javascript:buyBtn()" type = "submit" class="buy" value = "주문하기">
        </form>
        <form action = "BookmarkName.jsp" method = "post">
        <input type = "hidden" name = "CartID" value = <%=CartID %>>
        <input type = "submit" class="cart" value = "저장하기">
        </form>
    </div>
    <br>
    <row>
            
			 <%
				 	
				 
				 	selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food1ID;
					
					foodStmt = conn.prepareStatement(selectFoodStr);	
					foodRset = foodStmt.executeQuery(selectFoodStr);
					foodRset.last();
					if(food1ID != 0){
						
				 		FoodName = foodRset.getString("foodName");
				 		FoodID = foodRset.getString("foodID");
						FoodPrice = foodRset.getInt("foodPrice");
						FoodImage = foodRset.getString("foodImage");
					
				%>
				<div class="col-xs-4 ">
				<img src = <%= FoodImage %> width = "210" height="auto"><br/>
				<p style = "margin-top: 15px;"><%= FoodName  %></p>
		  		<p><%= FoodPrice %></p>
                <form name = "mForm" action = "BoxDelete.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "foodPrice"  value="<%= FoodPrice %>" >
					<input type="hidden" name = "cartID"  value="<%= CartID %>" >
			  		<input onclick="javascript:deleteBtn()" type="Image" name = "삭제하기" value="Delete" src = "delete.png" width = 40 >
		  		</form>
		  		<form name = "mForm" action = "StarAdd.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "customerID"  value="<%= CustomerID %>" >
					<input onclick="javascript:starBtn()"type="Image" name = "Star" value="즐겨찾기" src = "star.png" width = 40 >
				</form>
				</div>
				<%} %>
            
            
            <%
				 
				 	selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food2ID;
					
					foodStmt = conn.prepareStatement(selectFoodStr);	
					foodRset = foodStmt.executeQuery(selectFoodStr);
					foodRset.last();
					
					if(food2ID != 0){
				 		FoodName = foodRset.getString("foodName");
				 		FoodID = foodRset.getString("foodID");
						FoodPrice = foodRset.getInt("foodPrice");
						FoodImage = foodRset.getString("foodImage");
					
				%>
				<div class="col-xs-4 product">
				<img src = <%= FoodImage %> width = "210" height="auto"><br/>
				<p style = "margin-top: 15px;"><%= FoodName  %></p>
		  		<p><%= FoodPrice %></p>
                <form name = "mForm" action = "BoxDelete.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "foodPrice"  value="<%= FoodPrice %>" >
					<input type="hidden" name = "cartID"  value="<%= CartID %>" >
			  		<input onclick="javascript:deleteBtn()" type="Image" name = "삭제하기" value="Delete" src = "delete.png" width = 40 >
		  		</form>
		  		<form name = "mForm" action = "StarAdd.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "customerID"  value="<%= CustomerID %>" >
					<input onclick="javascript:starBtn()"type="Image" name = "Star" value="즐겨찾기" src = "star.png" width = 40 >
				</form>
				</div>
				<%} %>
            
            
            <%
				 
				 	selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food3ID;
					
					foodStmt = conn.prepareStatement(selectFoodStr);	
					foodRset = foodStmt.executeQuery(selectFoodStr);
					foodRset.last();
					
					if(food3ID != 0){
				 		FoodName = foodRset.getString("foodName");
				 		FoodID = foodRset.getString("foodID");
						FoodPrice = foodRset.getInt("foodPrice");
						FoodImage = foodRset.getString("foodImage");
					
				%>
				<div class="col-xs-4 product">
				<img src = <%= FoodImage %> width = "210" height="auto"><br/>
				<p style = "margin-top: 15px;"><%= FoodName  %></p>
		  		<p><%= FoodPrice %></p>
                <form name = "mForm" action = "BoxDelete.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "foodPrice"  value="<%= FoodPrice %>" >
					<input type="hidden" name = "cartID"  value="<%= CartID %>" >
			  		<input onclick="javascript:deleteBtn()" type="Image" name = "삭제하기" value="Delete" src = "delete.png" width = 40 >
		  		</form>
		  		<form name = "mForm" action = "StarAdd.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "customerID"  value="<%= CustomerID %>" >
					<input onclick="javascript:starBtn()"type="Image" name = "Star" value="즐겨찾기" src = "star.png" width = 40 >
				</form>
				</div>
				<%} %>
            
           
            <%
				 
				 	selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food4ID;
					
					foodStmt = conn.prepareStatement(selectFoodStr);	
					foodRset = foodStmt.executeQuery(selectFoodStr);
					foodRset.last();
					
					if(food4ID != 0){
				 		FoodName = foodRset.getString("foodName");
				 		FoodID = foodRset.getString("foodID");
						FoodPrice = foodRset.getInt("foodPrice");
						FoodImage = foodRset.getString("foodImage");
					
				%>
				<div class="col-xs-4 product">
				<img src = <%= FoodImage %> width = "210" height="auto"><br/>
				<p style = "margin-top: 15px;"><%= FoodName  %></p>
		  		<p><%= FoodPrice %></p>
                <form name = "mForm" action = "BoxDelete.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "foodPrice"  value="<%= FoodPrice %>" >
					<input type="hidden" name = "cartID"  value="<%= CartID %>" >
			  		<input onclick="javascript:deleteBtn()" type="Image" name = "삭제하기" value="Delete" src = "delete.png" width = 40 >
		  		</form>
		  		<form name = "mForm" action = "StarAdd.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "customerID"  value="<%= CustomerID %>" >
					<input onclick="javascript:starBtn()"type="Image" name = "Star" value="즐겨찾기" src = "star.png" width = 40 >
				</form>
				</div>
				<%} %>
            
           
            <%
				 
				 	selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food5ID;
					
					foodStmt = conn.prepareStatement(selectFoodStr);	
					foodRset = foodStmt.executeQuery(selectFoodStr);
					foodRset.last();
					
					if(food5ID != 0){
				 		FoodName = foodRset.getString("foodName");
				 		FoodID = foodRset.getString("foodID");
						FoodPrice = foodRset.getInt("foodPrice");
						FoodImage = foodRset.getString("foodImage");
					
				%>
				<div class="col-xs-4 product">
				<img src = <%= FoodImage %> width = "210" height="auto"><br/>
				<p style = "margin-top: 15px;"><%= FoodName  %></p>
		  		<p><%= FoodPrice %></p>
                <form name = "mForm" action = "BoxDelete.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "foodPrice"  value="<%= FoodPrice %>" >
					<input type="hidden" name = "cartID"  value="<%= CartID %>" >
			  		<input onclick="javascript:deleteBtn()" type="Image" name = "삭제하기" value="Delete" src = "delete.png" width = 40 >
		  		</form>
		  		<form name = "mForm" action = "StarAdd.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "customerID"  value="<%= CustomerID %>" >
					<input onclick="javascript:starBtn()"type="Image" name = "Star" value="즐겨찾기" src = "star.png" width = 40 >
				</form>
				</div>
				<%} %>
            
           
            <%
				 
				 	selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food6ID;
					
					foodStmt = conn.prepareStatement(selectFoodStr);	
					foodRset = foodStmt.executeQuery(selectFoodStr);
					foodRset.last();
					
					if(food6ID != 0){
				 		FoodName = foodRset.getString("foodName");
				 		FoodID = foodRset.getString("foodID");
						FoodPrice = foodRset.getInt("foodPrice");
						FoodImage = foodRset.getString("foodImage");
					
				%>
				 <div class="col-xs-4 product">
				<img src = <%= FoodImage %> width = "210" height="auto"><br/>
				<p style = "margin-top: 15px;"><%= FoodName  %></p>
		  		<p><%= FoodPrice %></p>
                <form name = "mForm" action = "BoxDelete.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "foodPrice"  value="<%= FoodPrice %>" >
					<input type="hidden" name = "cartID"  value="<%= CartID %>" >
			  		<input onclick="javascript:deleteBtn()" type="Image" name = "삭제하기" value="Delete" src = "delete.png" width = 40 >
		  		</form>
		  		<form name = "mForm" action = "StarAdd.jsp" method="post" style = "display:inline">
					<input type="hidden" name = "foodID"  value="<%= FoodID %>" >
					<input type="hidden" name = "customerID"  value="<%= CustomerID %>" >
					<input onclick="javascript:starBtn()"type="Image" name = "Star" value="즐겨찾기" src = "star.png" width = 40 >
				</form>
				</div>
				<%} %>
            
 
    </row>
    
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