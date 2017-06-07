package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBHelper {
	 private static final String URL="jdbc:mysql://localhost:3306/bigData";
	 private static final String NAME="root";
	 private static final String PASSWORD="song";
	 private static Connection conn=null;
	 static{
		 try {
		  //1.加载驱动
		  Class.forName("com.mysql.jdbc.Driver");
		  //2.获得连接
		   conn = DriverManager.getConnection(URL, NAME, PASSWORD);
		 } catch (ClassNotFoundException e) {
		     e.printStackTrace();
		  } catch (SQLException e) {
		     e.printStackTrace();
		 }
	 }
	 public static Connection getConnection()
	 {
		 return conn;
		  }
}


