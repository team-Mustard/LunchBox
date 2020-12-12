<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
   int CartID = Integer.parseInt(request.getParameter("CartID"));
   int CustomerTotalPrice = 0;
   int boxTotalPrice = Integer.parseInt(request.getParameter("TotalPrice"));
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
   String CustomerID = (String) session.getAttribute("id");
   PreparedStatement buyStmt = null;
   PreparedStatement customerStmt = null;
   PreparedStatement tierStmt = null;
   Statement selectStmt = conn.createStatement();
   String updateCartStr = "UPDATE Cart SET CartStatus = 1 WHERE CartID ="+ CartID;
   String updateCustomerStr = "UPDATE Customer SET CustomerTotalPrice = (?) WHERE CustomerID = '" + CustomerID + "'";
   String selectCustomerStr = "SELECT CustomerTotalPrice FROM Customer WHERE CustomerID = '" + CustomerID + "'";
   selectStmt = conn.prepareStatement(selectCustomerStr);
   ResultSet CustomerRset = selectStmt.executeQuery(selectCustomerStr);
   
   if(CustomerRset.next() != false){
      
      CustomerTotalPrice = CustomerRset.getInt("customerTotalPrice");
   
   }
   
   buyStmt = conn.prepareStatement(updateCartStr);
   customerStmt = conn.prepareStatement(updateCustomerStr);
   CustomerTotalPrice += boxTotalPrice;
   
   String updateTierstr = null;
   
   if(CustomerTotalPrice >50000 && CustomerTotalPrice <= 120000){
      updateTierstr = "UPDATE customer SET TierID = 2 WHERE CustomerID = '" + CustomerID + "'";
   }
   if(CustomerTotalPrice >120000 && CustomerTotalPrice <=200000){
      updateTierstr = "UPDATE customer SET TierID = 3 WHERE CustomerID = '" + CustomerID + "'";
   }
   if(CustomerTotalPrice >200000 && CustomerTotalPrice <=300000){
      updateTierstr = "UPDATE customer SET TierID = 4 WHERE CustomerID = '" + CustomerID + "'";
   }
   if(CustomerTotalPrice >300000 && CustomerTotalPrice <=350000){
      updateTierstr = "UPDATE customer SET TierID = 5 WHERE CustomerID = '" + CustomerID + "'";
   }
   if (updateTierstr != null){ 
	   tierStmt = conn.prepareStatement(updateTierstr); 
	   tierStmt.executeUpdate();
	}
   
   customerStmt.setInt(1, CustomerTotalPrice);
   customerStmt.executeUpdate();
   buyStmt.executeUpdate();
   
   
   
   
   
   %>
   <script>
   
   alert('상품이 구매되었습니다!!');
            
            
</script>

   
   
<%
	if (updateTierstr != null){ 
		tierStmt.close();
	}
   buyStmt.close();   
   customerStmt.close();
   selectStmt.close();
   conn.close();
   CustomerRset.close();
   response.sendRedirect(request.getHeader("referer"));
   
   %>