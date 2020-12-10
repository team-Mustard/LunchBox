<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
    
    int CartID = Integer.parseInt(request.getParameter("cartID"));
	int FoodID = Integer.parseInt(request.getParameter("foodID"));
	int FoodPrice = Integer.parseInt(request.getParameter("foodPrice"));
	String CustomerID = (String) session.getAttribute("id");
	int cartBoxID = 0;
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
	
	
	Statement cartStmt = conn.createStatement();
	String selectCartStr = "SELECT * FROM Cart WHERE CartID = " + CartID;
	
	cartStmt = conn.prepareStatement(selectCartStr);
	ResultSet cartRset = cartStmt.executeQuery(selectCartStr);
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
			boxTotalPrice = boxRset.getInt("totalPrice");
			
			
			if(food1ID == FoodID){
				
				String updateFoodStr = "UPDATE Box Set Food1ID = NULL WHERE BoxID = "+ cartBoxID;
				PreparedStatement updateFoodStmt = null;
				updateFoodStmt = conn.prepareStatement(updateFoodStr);
				updateFoodStmt.executeUpdate();
				
				boxTotalPrice -= FoodPrice;
				String updatePriceStr = "UPDATE Box SET TotalPrice = (?) WHERE BoxID =" + cartBoxID;
				PreparedStatement updateStmt = null;
				updateStmt = conn.prepareStatement(updatePriceStr);
				updateStmt.setInt(1, boxTotalPrice);
				updateStmt.executeUpdate();	
				updateFoodStmt.close();
				updateStmt.close();

			}
			if(food2ID == FoodID){
				
				String updateFoodStr = "UPDATE Box Set Food2ID = NULL WHERE BoxID = "+ cartBoxID;
				PreparedStatement updateFoodStmt = null;
				updateFoodStmt = conn.prepareStatement(updateFoodStr);
				updateFoodStmt.executeUpdate();
				
				boxTotalPrice -= FoodPrice;
				String updatePriceStr = "UPDATE Box SET TotalPrice = (?) WHERE BoxID =" + cartBoxID;
				PreparedStatement updateStmt = null;
				updateStmt = conn.prepareStatement(updatePriceStr);
				updateStmt.setInt(1, boxTotalPrice);
				updateStmt.executeUpdate();	
				updateFoodStmt.close();
				updateStmt.close();

			}
			if(food3ID == FoodID){
				
				String updateFoodStr = "UPDATE Box Set Food3ID = NULL WHERE BoxID = "+ cartBoxID;
				PreparedStatement updateFoodStmt = null;
				updateFoodStmt = conn.prepareStatement(updateFoodStr);
				updateFoodStmt.executeUpdate();
				
				boxTotalPrice -= FoodPrice;
				String updatePriceStr = "UPDATE Box SET TotalPrice = (?) WHERE BoxID =" + cartBoxID;
				PreparedStatement updateStmt = null;
				updateStmt = conn.prepareStatement(updatePriceStr);
				updateStmt.setInt(1, boxTotalPrice);
				updateStmt.executeUpdate();	
				updateFoodStmt.close();
				updateStmt.close();

				
			}
			if(food4ID == FoodID){
				
				String updateFoodStr = "UPDATE Box Set Food4ID = NULL WHERE BoxID = "+ cartBoxID;
				PreparedStatement updateFoodStmt = null;
				updateFoodStmt = conn.prepareStatement(updateFoodStr);
				updateFoodStmt.executeUpdate();
				
				boxTotalPrice -= FoodPrice;
				String updatePriceStr = "UPDATE Box SET TotalPrice = (?) WHERE BoxID =" + cartBoxID;
				PreparedStatement updateStmt = null;
				updateStmt = conn.prepareStatement(updatePriceStr);
				updateStmt.setInt(1, boxTotalPrice);
				updateStmt.executeUpdate();	
				updateFoodStmt.close();
				updateStmt.close();


				
			}
			if(food5ID == FoodID){
				
					String updateFoodStr = "UPDATE Box Set Food5ID = NULL WHERE BoxID = "+ cartBoxID;
					PreparedStatement updateFoodStmt = null;
					updateFoodStmt = conn.prepareStatement(updateFoodStr);
					updateFoodStmt.executeUpdate();
					
					boxTotalPrice -= FoodPrice;
					String updatePriceStr = "UPDATE Box SET TotalPrice = (?) WHERE BoxID =" + cartBoxID;
					PreparedStatement updateStmt = null;
					updateStmt = conn.prepareStatement(updatePriceStr);
					updateStmt.setInt(1, boxTotalPrice);
					updateStmt.executeUpdate();	
					updateFoodStmt.close();
					updateStmt.close();


				}
				if(food6ID == FoodID){
					
					String updateFoodStr = "UPDATE Box Set Food6ID = NULL WHERE BoxID = "+ cartBoxID;
					PreparedStatement updateFoodStmt = null;
					updateFoodStmt = conn.prepareStatement(updateFoodStr);
					updateFoodStmt.executeUpdate();
					
					boxTotalPrice -= FoodPrice;
					String updatePriceStr = "UPDATE Box SET TotalPrice = (?) WHERE BoxID =" + cartBoxID;
					PreparedStatement updateStmt = null;
					updateStmt = conn.prepareStatement(updatePriceStr);
					updateStmt.setInt(1, boxTotalPrice);
					updateStmt.executeUpdate();	
					updateFoodStmt.close();
					updateStmt.close();

					
				}
			
			
			
		}
		}
		cartStmt.close();
		cartRset.close();
		boxStmt.close();
		boxRset.close();
		response.sendRedirect(request.getHeader("referer"));
	

%>