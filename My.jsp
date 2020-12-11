<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
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
        .user-border{
            margin-top: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
            border-top: 10px solid #C0262B;
            border-bottom: 3px solid #C0262B;    
        }
        .user{
            border-top: 3px dashed #C0262B;
            border-bottom: 3px dashed #C0262B; 
        }
        .myBox{
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
        .review{
            color: #C0262BD1;
            font-weight: bold;
            border: 2px solid #C0262BD1;
            border-radius: 8px;
            padding: 5px 10px 5px 10px;
            margin: 10px 0px 10px 0px;
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
            <li><a href="Review.jsp">리뷰</a></li>
            <li><a href="#">마이페이지</a></li>
        </ul>
    </div>
</div>
<script>
   function deleteBtn(){
      alert('북마크에서 삭제되었습니다.');
   }
   
   function cartBtn(){
      alert('장바구니에 추가되었습니다.');
   }
</script>
<% String CustomerID = (String)session.getAttribute("id"); 
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
   
   Statement userstmt = conn.createStatement();
   PreparedStatement tierstmt = null;
   ResultSet tierset = null;
   String usersql = "SELECT * FROM customer WHERE CustomerID='" + CustomerID + "'";
   userstmt = conn.prepareStatement(usersql);
   ResultSet userset = userstmt.executeQuery(usersql);
   int tierID = 0;
   String tier = "정보 없음";
   int Discount = 0;
   if(userset.next() != false){
   tierID = userset.getInt("TierID");
   
   String tiersql = "SELECT * FROM tier WHERE TierID = "+ tierID;
   tierstmt = conn.prepareStatement(tiersql);
   tierset = tierstmt.executeQuery(tiersql);
   
   tierset.next();
   tier = tierset.getString("TierName");
   Discount = tierset.getInt("TierDiscount");
   }
   
%>
    


<div class="container">
    <div class="user-border">
        <div class="text-center user">
            <h3><%= CustomerID %></h3>
            <p>구매성적: <%=tier %></p>
            <p><%= Discount %>원 할인적용!</p>
        </div>
    </div>
<div>


        <row>
        <div class="col-xs-6">
            <p class="myBox">"My Lunch-Box"</p>
            <row class="Box">
               
    
<% 

int cartBookID = 0;
int cartID = 0;
int bookCartID;
int food1ID = 0;
int food2ID = 0;
int food3ID = 0;
int food4ID = 0;   
int food5ID = 0;
int food6ID = 0;
int boxTotalPrice = 0;



Statement bookStmt = conn.createStatement();

String selectBookStr = "SELECT * FROM Bookmark";

bookStmt = conn.prepareStatement(selectBookStr);
ResultSet bookRset = bookStmt.executeQuery(selectBookStr);

String BookName;

while(bookRset.next()){
   
   bookCartID = bookRset.getInt("CartID");
   
   String selectCartStr = "SELECT * FROM Cart WHERE CartID = "+ bookCartID;
   Statement cartStmt = conn.createStatement();
   cartStmt = conn.prepareStatement(selectCartStr);
   
   ResultSet cartRset = cartStmt.executeQuery(selectCartStr);
   String cartCustomerID = null;
   
   if(cartRset.next()!= false)
   {
      cartCustomerID= cartRset.getString("CustomerID");
   }
   

   if(cartCustomerID.equals(CustomerID)){
      
      BookName = bookRset.getString("BookName");
      int cartBoxID = cartRset.getInt("BoxID");
      Statement boxStmt = conn.createStatement();
      String selectBoxStr = "SELECT * FROM Box WHERE BoxID = "+ cartBoxID;
      boxStmt = conn.prepareStatement(selectBoxStr);
      ResultSet boxRset = boxStmt.executeQuery(selectBoxStr);

      if(boxRset.next() != false){
         
         food1ID = boxRset.getInt("food1ID");
         food2ID = boxRset.getInt("food2ID");
         food3ID = boxRset.getInt("food3ID");
         food4ID = boxRset.getInt("food4ID");   
         food5ID = boxRset.getInt("food5ID");
         food6ID = boxRset.getInt("food6ID");
         boxTotalPrice = boxRset.getInt("totalPrice");

         Statement foodStmt = null;
         String selectFoodStr;
         ResultSet foodRset = null;
         String FoodName1 = null;
         String FoodName2 = null;
         String FoodName3 = null;
         String FoodName4 = null;
         String FoodName5 = null;
         String FoodName6 = null;
         
         String FoodID;
   

          %>
        <div class="Box text-center">
                    <img src="LunchBoxLogo.png" height="120px"/><br>    
                    <form  action = "BookmarkCart.jsp" method="post" style = "display:inline">
                  <input type="hidden" name = "food1ID"  value="<%= food1ID %>" >
                  <input type="hidden" name = "food2ID"  value="<%= food2ID %>" >
                  <input type="hidden" name = "food3ID"  value="<%= food3ID %>" >
                  <input type="hidden" name = "food4ID"  value="<%= food4ID %>" >
                  <input type="hidden" name = "food5ID"  value="<%= food5ID %>" >
                  <input type="hidden" name = "food6ID"  value="<%= food6ID %>" >
                  <input type="hidden" name = "totalPrice"  value="<%= boxTotalPrice %>" >
                  <input onclick="javascript:cartBtn()" type="Image" name = "Select" value="선택하기" src = "select.png" width = 40 >
               </form>
               <form  action = "BookmarkDelete.jsp" method="post" style = "display:inline">
                  <input type="hidden" name = "bookID"  value="<%= cartBoxID %>" >
                  <input onclick="javascript:deleteBtn()"type="Image" name = "Delete" value="삭제하기" src = "delete.png" width = 40 >
               </form>
                    <% if(food1ID != 0){
                    
                       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food1ID;
                        foodStmt = conn.prepareStatement(selectFoodStr);   
                        foodRset = foodStmt.executeQuery(selectFoodStr);
                        foodRset.last();               
                       FoodName1 = foodRset.getString("foodName");
                 
                    }
                    if(food2ID != 0){
                        
                       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food2ID;
                        foodStmt = conn.prepareStatement(selectFoodStr);   
                        foodRset = foodStmt.executeQuery(selectFoodStr);
                        foodRset.last();   
                       FoodName2 = foodRset.getString("foodName");
              
                    }
                  if(food3ID != 0){
                        
                       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food3ID;
                        foodStmt = conn.prepareStatement(selectFoodStr);   
                        foodRset = foodStmt.executeQuery(selectFoodStr);
                        foodRset.last();   
                       FoodName3 = foodRset.getString("foodName");
              
                    }
                  if(food4ID != 0){
                        
                       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food4ID;
                        foodStmt = conn.prepareStatement(selectFoodStr);   
                        foodRset = foodStmt.executeQuery(selectFoodStr);
                        foodRset.last();   
                       FoodName4 = foodRset.getString("foodName");
              
                    }
                  if(food5ID != 0){
                        
                       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food5ID;
                        foodStmt = conn.prepareStatement(selectFoodStr);   
                        foodRset = foodStmt.executeQuery(selectFoodStr);
                        foodRset.last();   
                       FoodName5 = foodRset.getString("foodName");
              
                    }
                  if(food6ID != 0){
                        
                       selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food6ID;
                        foodStmt = conn.prepareStatement(selectFoodStr);   
                        foodRset = foodStmt.executeQuery(selectFoodStr);
                        foodRset.last();   
                       FoodName6 = foodRset.getString("foodName");
              
                    } %>
                    <h4><%= BookName %></h4>
                    <p>$ <%= boxTotalPrice %></p>
                    <p><% if(FoodName1!=null){ out.println(FoodName1); }
                       if(FoodName2!=null){ out.println(FoodName2); }
                       if(FoodName3!=null){ out.println(FoodName3); }
                       if(FoodName4!=null){ out.println(FoodName4); }
                       if(FoodName5!=null){ out.println(FoodName5); }
                       if(FoodName6!=null){ out.println(FoodName6); }%>             
                     </p>
                </div>
<%

               
            }
         }
      }
   
%>
        
 </row>

      </div> 
 <div class="col-xs-6">
      <p class="myBox">"My Orders"</p>  
       <row class="Box">   
      
 <%
   String selectCartStr2 = "SELECT * FROM Cart WHERE CustomerID = '"+ CustomerID+ "' AND CartStatus = 1";
   Statement cartStmt = conn.createStatement();
   cartStmt = conn.prepareStatement(selectCartStr2);
   
   ResultSet orderRset = cartStmt.executeQuery(selectCartStr2);
   
   while(orderRset.next()){
      
      int cartBoxID = orderRset.getInt("BoxID");
      Statement boxStmt = conn.createStatement();
      cartID = orderRset.getInt("CartID");
      Date day = orderRset.getDate("CartDate");
      String selectBoxStr = "SELECT * FROM Box WHERE BoxID = "+ cartBoxID;
      boxStmt = conn.prepareStatement(selectBoxStr);
      ResultSet boxRset = boxStmt.executeQuery(selectBoxStr);
      if(boxRset.next() != false){
         
         food1ID = boxRset.getInt("food1ID");
         food2ID = boxRset.getInt("food2ID");
         food3ID = boxRset.getInt("food3ID");
         food4ID = boxRset.getInt("food4ID");   
         food5ID = boxRset.getInt("food5ID");
         food6ID = boxRset.getInt("food6ID");
         boxTotalPrice = boxRset.getInt("totalPrice");
   
         Statement foodStmt = null;
         String selectFoodStr;
         ResultSet foodRset = null;
         String FoodName1 = null;
         String FoodName2 = null;
         String FoodName3 = null;
         String FoodName4 = null;
         String FoodName5 = null;
         String FoodName6 = null;
         
         String FoodID;
         int FoodPrice;
         String FoodImage;
   

         if(food1ID != 0){
         
            selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food1ID;
             foodStmt = conn.prepareStatement(selectFoodStr);   
             foodRset = foodStmt.executeQuery(selectFoodStr);
             foodRset.last();               
            FoodName1 = foodRset.getString("foodName");
      
         }
         if(food2ID != 0){
            
            selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food2ID;
             foodStmt = conn.prepareStatement(selectFoodStr);   
             foodRset = foodStmt.executeQuery(selectFoodStr);
             foodRset.last();   
            FoodName2 = foodRset.getString("foodName");
   
         }
         if(food3ID != 0){
            
            selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food3ID;
             foodStmt = conn.prepareStatement(selectFoodStr);   
             foodRset = foodStmt.executeQuery(selectFoodStr);
             foodRset.last();   
            FoodName3 = foodRset.getString("foodName");
   
         }
         if(food4ID != 0){
            
            selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food4ID;
             foodStmt = conn.prepareStatement(selectFoodStr);   
             foodRset = foodStmt.executeQuery(selectFoodStr);
             foodRset.last();   
            FoodName4 = foodRset.getString("foodName");
   
         }
         if(food5ID != 0){
            
            selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food5ID;
             foodStmt = conn.prepareStatement(selectFoodStr);   
             foodRset = foodStmt.executeQuery(selectFoodStr);
             foodRset.last();   
            FoodName5 = foodRset.getString("foodName");
   
         }
         if(food6ID != 0){
            
            selectFoodStr = "SELECT * FROM Food WHERE foodID =" + food6ID;
             foodStmt = conn.prepareStatement(selectFoodStr);   
             foodRset = foodStmt.executeQuery(selectFoodStr);
             foodRset.last();   
            FoodName6 = foodRset.getString("foodName");
   
         }

%>                 
       
        
           
                <div class="Box text-center">
                    <img src="LunchBoxLogo.png" height="120px"/><br>
                    <form action="Reviewrite.jsp" method="post">
                    <input type = "hidden" name = "boxID" value = <%=cartBoxID %>>
                    <input type = "hidden" name = "cartID" value = <%=cartID %>>
                    <button type = "submit" class="review">Review Write</button>
                    </form>
                    <p>$ <%=boxTotalPrice%></p>
                    <p><%=day %></p>
                    <p><% if(FoodName1!=null){ out.println(FoodName1); }
                       if(FoodName2!=null){ out.println(FoodName2); }
                       if(FoodName3!=null){ out.println(FoodName3); }
                       if(FoodName4!=null){ out.println(FoodName4); }
                       if(FoodName5!=null){ out.println(FoodName5); }
                       if(FoodName6!=null){ out.println(FoodName6); }%></p>
                </div>
            </row>
            <% 
        }
   }
      %>
        </div>
   
 </row>
        
 
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