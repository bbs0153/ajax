<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String oper = request.getParameter("oper");


	if (oper.equals("add")) {

		int bookid = 0;
		if (request.getParameter("bookid") != null) {
			bookid = Integer.parseInt(request.getParameter("bookid"));
		}
		String bookname = request.getParameter("bookname");
		String publisher = request.getParameter("publisher");
		int price = 0;
		if (request.getParameter("price") != null) {
			price = Integer.parseInt(request.getParameter("price"));
		}

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.106:1521:XE", "madang",
					"madang");
			PreparedStatement pstmt = conn.prepareStatement("insert into book values(?,?,?,?)");
			pstmt.setInt(1, bookid);
			pstmt.setString(2, bookname);
			pstmt.setString(3, publisher);
			pstmt.setInt(4, price);

			int re = pstmt.executeUpdate();

			String str = "";

			if (re > 0) {
				str = "{\"result\":\"1\"}";
			} else {
				str = "{\"result\":\"0\"}";
			}
			
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	} else if (oper.equals("del")) {

		int bookid = 0;
		if (request.getParameter("bookid") != null) {
			bookid = Integer.parseInt(request.getParameter("bookid"));
		}
		String bookname = request.getParameter("bookname");
		String publisher = request.getParameter("publisher");
		int price = 0;
		if (request.getParameter("price") != null) {
			price = Integer.parseInt(request.getParameter("price"));
		}

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.106:1521:XE", "madang",
					"madang");
			PreparedStatement pstmt = conn.prepareStatement("delete book where bookid=?");
			pstmt.setInt(1, bookid);

			int re = pstmt.executeUpdate();

			String str = "";

			if (re > 0) {
				str = "{\"result\":\"1\"}";
			} else {
				str = "{\"result\":\"0\"}";
			}
			
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	} else if (oper.equals("edit")) {

		int bookid = 0;
		if (request.getParameter("bookid") != null) {
			bookid = Integer.parseInt(request.getParameter("bookid"));
		}
		String bookname = request.getParameter("bookname");
		String publisher = request.getParameter("publisher");
		int price = 0;
		if (request.getParameter("price") != null) {
			price = Integer.parseInt(request.getParameter("price"));
		}

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.106:1521:XE", "madang",
					"madang");
			PreparedStatement pstmt = conn
					.prepareStatement("update book set bookname=?,publisher=?,price=? where bookid=?");
			pstmt.setString(1, bookname);
			pstmt.setString(2, publisher);
			pstmt.setInt(3, price);
			pstmt.setInt(4, bookid);

			int re = pstmt.executeUpdate();

			String str = "";

			if (re > 0) {
				str = "{\"result\":\"1\"}";
			} else {
				str = "{\"result\":\"0\"}";
			}
			
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
%>