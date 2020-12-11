<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
	String CustomerID = (String) session.getAttribute("id");
	int food1ID = Integer.parseInt(request.getParameter("food1ID"));
	int food2ID = Integer.parseInt(request.getParameter("food2ID"));
	int food3ID = Integer.parseInt(request.getParameter("food3ID"));
	int food4ID = Integer.parseInt(request.getParameter("food4ID"));
	int food5ID = Integer.parseInt(request.getParameter("food5ID"));
	int food6ID = Integer.parseInt(request.getParameter("food6ID"));
	int TotalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	ResultSet boxRset = null;
	Statement boxStmt = conn.createStatement();	
	
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
	
	if(food1ID != 0){
		String updateBoxStr = "UPDATE Box SET Food1ID = (?) WHERE BoxID ="+newBoxID;
		PreparedStatement updateBoxStmt = null;
		updateBoxStmt = conn.prepareStatement(updateBoxStr);
		updateBoxStmt.setInt(1,food1ID);
		updateBoxStmt.executeUpdate();
		updateBoxStmt.close();
	}
	if(food2ID != 0){
		String updateBoxStr = "UPDATE Box SET Food2ID = (?) WHERE BoxID ="+newBoxID;
		
		PreparedStatement updateBoxStmt = null;
		updateBoxStmt = conn.prepareStatement(updateBoxStr);
		updateBoxStmt.setInt(1,food2ID);
		updateBoxStmt.executeUpdate();
		updateBoxStmt.close();
	}
	if(food3ID != 0){
		String updateBoxStr = "UPDATE Box SET Food3ID = (?) WHERE BoxID ="+newBoxID;
		
		PreparedStatement updateBoxStmt = null;
		updateBoxStmt = conn.prepareStatement(updateBoxStr);
		updateBoxStmt.setInt(1,food3ID);
		updateBoxStmt.executeUpdate();
		updateBoxStmt.close();
	}
	if(food4ID != 0){
		String updateBoxStr = "UPDATE Box SET Food4ID = (?) WHERE BoxID ="+newBoxID;
		
		PreparedStatement updateBoxStmt = null;
		updateBoxStmt = conn.prepareStatement(updateBoxStr);
		updateBoxStmt.setInt(1,food4ID);
		updateBoxStmt.executeUpdate();
		updateBoxStmt.close();
	}
	if(food5ID != 0){
		String updateBoxStr = "UPDATE Box SET Food5ID = (?) WHERE BoxID ="+newBoxID;
		
		PreparedStatement updateBoxStmt = null;
		updateBoxStmt = conn.prepareStatement(updateBoxStr);
		updateBoxStmt.setInt(1,food5ID);
		updateBoxStmt.executeUpdate();
		updateBoxStmt.close();
	}
	if(food6ID != 0){
		String updateBoxStr = "UPDATE Box SET Food6ID = (?) WHERE BoxID ="+newBoxID;
		
		PreparedStatement updateBoxStmt = null;
		updateBoxStmt = conn.prepareStatement(updateBoxStr);
		updateBoxStmt.setInt(1,food6ID);
		updateBoxStmt.executeUpdate();
		updateBoxStmt.close();
	}
	insertStmt.close();
	
	String updateBoxStr = "UPDATE Box SET TotalPrice = (?) WHERE BoxID ="+newBoxID;
	
	PreparedStatement priceBoxStmt = null;
	priceBoxStmt = conn.prepareStatement(updateBoxStr);
	priceBoxStmt.setInt(1,TotalPrice);
	priceBoxStmt.executeUpdate();
	insertStmt.close();
	priceBoxStmt.close();
	
	response.sendRedirect(request.getHeader("referer"));
	
	
	
	
%>