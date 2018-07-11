<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String event_name = request.getParameter("event_name");
	String event_date = request.getParameter("event_date");
	String str = "";
	/*
		{"result":"1"}
	*/
	String sql = "insert into schedule values(seq_schedule.nextval,?,?)";
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.106:1521:XE", "madang", "madang");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, event_name);
		pstmt.setString(2, event_date);
		int re = pstmt.executeUpdate();
		if(re > 0)
		{
			str = "{\"result\":\"1\"}";	
		}
		else
		{
			str = "{\"result\":\"0\"}";
		}
		
		pstmt.close();
		conn.close();
		
	}catch(Exception e)
	{
		System.out.println(e.getMessage());
	}
%>
<%= str %>