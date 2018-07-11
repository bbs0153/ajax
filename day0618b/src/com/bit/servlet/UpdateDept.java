package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.db.ConnectionProvider;

/**
 * Servlet implementation class UpdateDept
 */
@WebServlet("/UpdateDept")
public class UpdateDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int cmd = Integer.parseInt(request.getParameter("cmd"));
		
		int dno = 0;
		String dname = "";
		String dloc = "";
		
		if(request.getParameter("dno") != null) {
			dno = Integer.parseInt(request.getParameter("dno"));
		}
		dname = request.getParameter("dname");
		dloc = request.getParameter("dloc");
		
		int re = 0;
		
		switch(cmd) {
		case 1: re = insertDept(dno,dname,dloc);break;
		case 2: re = updateDept(dno,dname,dloc);break;
		case 3: re = deleteDept(dno);break;
		}
		
		//{"result":"1"}
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

	private int deleteDept(int dno) {
		// TODO Auto-generated method stub
		int re = -1;
		try {
			String sql = "delete dept where dno=?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return re;
	}

	private int updateDept(int dno, String dname, String dloc) {
		// TODO Auto-generated method stub
		int re = -1;
		try {
			String sql = "update dept set dname=?,dloc=? where dno=?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, dloc);
			pstmt.setInt(3, dno);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return re;
	}

	private int insertDept(int dno, String dname, String dloc) {
		// TODO Auto-generated method stub
		int re = -1;
		try {
			String sql = "insert into dept values(?,?,?)";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, dloc);
			pstmt.setInt(3, dno);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return re;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
