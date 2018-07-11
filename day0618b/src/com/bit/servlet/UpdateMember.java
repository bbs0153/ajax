package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.db.ConnectionProvider;

/**
 * Servlet implementation class UpdateMember
 */
@WebServlet("/UpdateMember")
public class UpdateMember extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int cmd = Integer.parseInt(request.getParameter("cmd"));
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int age = 0;
		if(request.getParameter("age") != null) {
			age = Integer.parseInt(request.getParameter("age"));
		}
		String addr = request.getParameter("addr");
		
		int re = 0;
		
		switch(cmd) {
		case 1:re = insertMember(id,name,age,addr);break;
		case 2:re = updateMember(id,name,age,addr);break;
		case 3:re = deleteMember(id);break;
		}
		
		String str = "";
		if(re>0) {
			  str = "{\"result\":\"1\"}";
		}else {
			  str = "{\"result\":\"0\"}";
		}
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(str);
		out.close();
		
		
	}

	private int deleteMember(String id) {
		// TODO Auto-generated method stub
		int re = -1;
		try {
			String sql = "delete member where id=?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return re;
	}

	private int updateMember(String id, String name, int age, String addr) {
		// TODO Auto-generated method stub
		int re = -1;
		try {
			String sql = "update member set name=?,age=?,addr=? where id=?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, addr);
			pstmt.setString(4, id);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return re;
	}

	private int insertMember(String id, String name, int age, String addr) {
		// TODO Auto-generated method stub

		int re = -1;
		try {
			String sql = "insert into member values(?,?,?,?)";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, age);
			pstmt.setString(4, addr);
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
