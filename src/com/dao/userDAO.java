package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.db.DBHelper;
import com.util.pic_bean;
import com.util.user_bean;

public class userDAO {
	public void addUser(user_bean user) throws Exception {
		System.out.println("cesjo");
		Connection con=DBHelper.getConnection();
		String sql="insert into user "+" (username,password,name) "+" value(?,?,?)";
		PreparedStatement prmt=con.prepareStatement(sql);
		prmt.setString(1, user.getUsername());
		prmt.setString(2, user.getPassword());
		prmt.setString(3,user.getTruename());
		prmt.execute();
	}
	public boolean isExist(String username) throws Exception {
		Connection con=DBHelper.getConnection();
		String sql="select * from user "+"where username=? ";
		PreparedStatement  prmt=con.prepareStatement(sql);
		prmt.setString(1,username);	
		ResultSet rs= prmt.executeQuery();
		if(rs.next()){
			return true;
		}
		return false;
	}
	public boolean isLogin(String username,String password) throws Exception {
		Connection con=DBHelper.getConnection();
		String sql="select * from user "+"where username=? and password=? ";
		PreparedStatement  prmt=con.prepareStatement(sql);
		prmt.setString(1,username);	
		prmt.setString(2, password);
		ResultSet rs= prmt.executeQuery();
		if(rs.next()){
			return true;
		}
		return false;
	}
}
