package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.db.ConnectionProvider;

/**
 * Servlet implementation class UpdateStudent
 */
@WebServlet("/UpdateStudent")
public class UpdateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateStudent() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int cmd = Integer.parseInt(request.getParameter("cmd"));

		int no = 0;
		String name = "";
		int kor = 0;
		int eng = 0;
		int math = 0;

		if (request.getParameter("no") != null) {
			no = Integer.parseInt(request.getParameter("no"));
		}
		
		name = request.getParameter("name");

		if (request.getParameter("kor") != null) {
			kor = Integer.parseInt(request.getParameter("kor"));
		}
		if (request.getParameter("eng") != null) {
			eng = Integer.parseInt(request.getParameter("eng"));
		}
		if (request.getParameter("math") != null) {
			math = Integer.parseInt(request.getParameter("math"));
		}

		int re = 0;

		switch (cmd) {
		case 1:
			re = insertStudent(no, name, kor, eng, math);
			break;
		case 2:
			re = updateStudent(no, name, kor, eng, math);
			break;
		case 3:
			re = deleteStudent(no);
			break;
		}

		String str = "";
		if (re > 0) {
			str = "{\"result\":\"1\"}";
		} else {
			str = "{\"result\":\"0\"}";
		}

		response.setContentType("text/plain");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(str);

	}

	private int deleteStudent(int no) {
		// TODO Auto-generated method stub
		int re = -1;
		try {
			String sql = "delete student where no=?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return re;
	}

	private int updateStudent(int no, String name, int kor, int eng, int math) {
		// TODO Auto-generated method stub
		int re = -1;
		try {
			String sql = "update student set name=?,kor=?,eng=?,math=? where no=?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, kor);
			pstmt.setInt(3, eng);
			pstmt.setInt(4, math);
			pstmt.setInt(5, no);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return re;
	}

	private int insertStudent(int no, String name, int kor, int eng, int math) {
		// TODO Auto-generated method stub
		int re = -1;
		try {
			String sql = "insert into student values(?,?,?,?,?)";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, name);
			pstmt.setInt(3, kor);
			pstmt.setInt(4, eng);
			pstmt.setInt(5, math);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return re;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
