<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*
		{"no":"1","event_name":"회식","event_date":"2018/09/17"},
	*/
	String str = "[";
	String sql = "select * from schedule";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.106:1521:XE", "madang",
				"madang");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			str += "{\"no\":\"" + rs.getInt(1) + "\",\"event_name\":\"" + rs.getString(2)
					+ "\",\"event_date\":\"" + rs.getString(3) + "\"},";
		}

		rs.close();
		pstmt.close();
		conn.close();

	} catch (Exception e) {
		System.out.println(e.getMessage());
	}

	str = str.substring(0, str.length() - 1);
	str += "]";
%>
<%=str%>