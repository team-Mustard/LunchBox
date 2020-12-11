<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

  

<script>
			
	alert('상품이 장바구니에 담겼습니다!');
				
				
</script>
<%
	
	int BoxID = 0;
	int food1ID = 0;
	int food2ID = 0;
	int food3ID = 0;
	int food4ID = 0;	
	int food5ID = 0;
	int food6ID = 0;	
	int i = 0;
	int boxTotalPrice = 0;
	boolean maxFlag = false;
	
	
	int foodID = Integer.parseInt(request.getParameter("foodID"));
	int foodPrice = Integer.parseInt(request.getParameter("foodPrice"));
	
	
	
	int cartBoxID = 0;
	
	String CustomerID = (String) session.getAttribute("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
	
	
	Statement cartStmt = conn.createStatement();
	String selectCartStr = "SELECT * FROM Cart WHERE CartStatus = 'false' AND CustomerID = '" + CustomerID + "'";
	
	cartStmt = conn.prepareStatement(selectCartStr);
	ResultSet cartRset = cartStmt.executeQuery(selectCartStr);
	
	int CartID = 0;
	
	
	
	
	Statement boxStmt = conn.createStatement();
	ResultSet boxRset = null;
	PreparedStatement updateStmt = null;
	
	if(cartRset.next() != false)
	{
		CartID = cartRset.getInt("CartID");
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
			boxTotalPrice = boxRset.getInt("TotalPrice");
					
			
			while(true){
				if(food1ID == 0)
				{
					i = 1;
					String updateBoxStr = "UPDATE Box SET Food" + i + "ID = (?) WHERE BoxID ="+cartBoxID;
					String updatePriceStr = "UPDATE Box Set totalPrice = (?) WHERE BOXID =" + cartBoxID;
					updateStmt = conn.prepareStatement(updateBoxStr);	
					updateStmt.setInt(1,foodID);
					updateStmt.executeUpdate();
					updateStmt = conn.prepareStatement(updatePriceStr);
					boxTotalPrice += foodPrice;
					updateStmt.setInt(1,boxTotalPrice);
					updateStmt.executeUpdate();
					out.println(updateBoxStr);
					out.println(foodID);
					break;
				}
				if(food2ID == 0)
				{
					i = 2;
					String updateBoxStr = "UPDATE Box SET Food" + i + "ID = (?) WHERE BoxID ="+cartBoxID;
					updateStmt = conn.prepareStatement(updateBoxStr);
					updateStmt.setInt(1,foodID);
					boxTotalPrice += foodPrice;
					updateStmt.executeUpdate();
					String updatePriceStr = "UPDATE Box Set totalPrice = (?) WHERE BOXID =" + cartBoxID;
					updateStmt = conn.prepareStatement(updatePriceStr);
					updateStmt.setInt(1,boxTotalPrice);
					updateStmt.executeUpdate();
					
					break;
				}
				if(food3ID == 0)
				{
					i = 3;
					String updateBoxStr = "UPDATE Box SET Food" + i + "ID = (?) WHERE BoxID ="+cartBoxID;
					updateStmt = conn.prepareStatement(updateBoxStr);
					updateStmt.setInt(1,foodID);
					updateStmt.executeUpdate();
					boxTotalPrice += foodPrice;
					String updatePriceStr = "UPDATE Box Set totalPrice = (?) WHERE BOXID =" + cartBoxID;
					updateStmt = conn.prepareStatement(updatePriceStr);
					updateStmt.setInt(1,boxTotalPrice);
					updateStmt.executeUpdate();
					break;
				}
				if(food4ID == 0)
				{
					i = 4;
					String updateBoxStr = "UPDATE Box SET Food" + i + "ID = (?) WHERE BoxID ="+cartBoxID;
					updateStmt = conn.prepareStatement(updateBoxStr);
					updateStmt.setInt(1,foodID);
					updateStmt.executeUpdate();
					boxTotalPrice += foodPrice;
					String updatePriceStr = "UPDATE Box Set totalPrice = (?) WHERE BOXID =" + cartBoxID;
					updateStmt = conn.prepareStatement(updatePriceStr);
					updateStmt.setInt(1,boxTotalPrice);
					updateStmt.executeUpdate();
					break;
				}
				if(food5ID == 0)
				{
					i = 5;
					String updateBoxStr = "UPDATE Box SET Food" + i + "ID = (?) WHERE BoxID ="+cartBoxID;
					updateStmt = conn.prepareStatement(updateBoxStr);
					updateStmt.setInt(1,foodID);
					boxTotalPrice += foodPrice;
					updateStmt.executeUpdate();
					String updatePriceStr = "UPDATE Box Set totalPrice = (?) WHERE BOXID =" + cartBoxID;
					updateStmt = conn.prepareStatement(updatePriceStr);
					updateStmt.setInt(1,boxTotalPrice);
					updateStmt.executeUpdate();
					break;
				}
				if(food6ID == 0)
				{
					i = 6;
					String updateBoxStr = "UPDATE Box SET Food" + i + "ID = (?) WHERE BoxID ="+cartBoxID;
					updateStmt = conn.prepareStatement(updateBoxStr);
					updateStmt.setInt(1,foodID);
					boxTotalPrice += foodPrice;
					updateStmt.executeUpdate();
					String updatePriceStr = "UPDATE Box Set totalPrice = (?) WHERE BOXID =" + cartBoxID;
					updateStmt = conn.prepareStatement(updatePriceStr);
					updateStmt.setInt(1,boxTotalPrice);
					updateStmt.executeUpdate();
					break;
					
					
					
				}
				maxFlag = true;
				
				
				break;
			}
			if(maxFlag == true)
			{
				
				%>
				<Script>
				
				alert("카트에 상품이 가득 찼습니다. 주문 후 담아주세요.");
				</Script>
				<%
				
				
				
			}

		}
		
	}
	else if(cartRset.next() == false){
		
		
		
		long time = System.currentTimeMillis();
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String curDate = dateFormat.format(time);
		String insertBoxStr = "INSERT INTO Box(totalPrice) VALUES (?)";
		PreparedStatement insertStmt = conn.prepareStatement(insertBoxStr);
		insertStmt.setInt(1, 0);	
		insertStmt.executeUpdate();
		
		String getBoxIDStr = "SELECT * FROM BOX";
		
		boxRset = boxStmt.executeQuery(getBoxIDStr);	
		
		
		boxRset.last();
		
		int newBoxID = boxRset.getInt("BoxID");

		String insertCartStr = "INSERT INTO CART(CartDate,CartStatus, BoxID, CustomerID) VALUES (?, ?, ?, ?)";
		insertStmt = conn.prepareStatement(insertCartStr);
		insertStmt.setString(1, curDate);
		insertStmt.setInt(2, 0);
		insertStmt.setInt(3, newBoxID);
		insertStmt.setString(4, CustomerID);
		insertStmt.executeUpdate();
		
		String updateBoxStr = "UPDATE Box SET Food1ID = (?) WHERE BoxID ="+newBoxID;
		
		PreparedStatement updateBoxStmt = null;
		updateBoxStmt = conn.prepareStatement(updateBoxStr);
		updateBoxStmt.setInt(1,foodID);
		updateBoxStmt.executeUpdate();
		String updatePriceStr = "UPDATE Box Set totalPrice = (?) WHERE BoxID =" + newBoxID;
		updateBoxStmt = conn.prepareStatement(updatePriceStr);
		updateBoxStmt.setInt(1, foodPrice);
		updateBoxStmt.executeUpdate();
		
		insertStmt.close();
		updateBoxStmt.close();
		
	}
	
	
	
	
	
	response.sendRedirect(request.getHeader("referer"));
	
	
	cartStmt.close();
	
	cartRset.close();
	conn.close();
	

	

%>





