<%@ page import = "java.util.*, java.lang.*" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	session.removeAttribute("id");
    
    	response.sendRedirect("Menu.jsp");
    %>
    
   