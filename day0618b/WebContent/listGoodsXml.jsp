<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	/*
	<goodsList>
		<goods>
			<no>100</no>
			<item>공1</item>
			<price>10000</price>
			<qty>10</qty>
			<fname>ball1.jpg</fname>
		</goods>
	</goodsList>
	*/

	String str = "<goodsList>";
	String sql = "select * from goods";

	try {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.106:1521:XE", "madang",
				"madang");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			str += "<goods>";
			str += "<no>" + rs.getInt(1) + "</no>";
			str += "<item>" + rs.getString(2) + "</item>";
			str += "<price>" + rs.getInt(3) + "</price>";
			str += "<qty>" + rs.getInt(4) + "</qty>";
			str += "<fname>" + rs.getString(5) + "</fname>";
			str += "</goods>";
		}

	} catch (Exception e) {
		System.out.println(e.getMessage());
	}

	str += "</goodsList>";
%>

<%=str%>