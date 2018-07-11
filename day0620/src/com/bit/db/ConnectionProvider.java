package com.bit.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionProvider {

	public static Connection getConnection() {

		Connection conn = null;

		try {

			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/oracle");
			conn = ds.getConnection();

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return conn;
	}

	public static void close(ResultSet rs, Statement stmt, Connection conn) {

		try {

			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

	}

}
