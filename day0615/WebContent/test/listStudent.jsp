<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	String str = "[";
	String sql = "select * from student";

	try {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.106:1521:XE", "madang",
				"madang");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			str += "{\"no\":\"" + rs.getInt(1) + "\",\"name\":\"" + rs.getString(2) + "\",\"kor\":\""
					+ rs.getInt(3) + "\",\"eng\":\"" + rs.getInt(4) + "\",\"math\":\"" + rs.getInt(5) + "\"},";

		}

		str = str.substring(0, str.length() - 1);

	} catch (Exception e) {
		System.out.println(e.getMessage());
	}

	str += "]";
%>

<%=str%>