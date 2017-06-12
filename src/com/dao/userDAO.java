package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.db.DBHelper;
import com.util.user_bean;

public class userDAO {
	public void addUser(user_bean user) throws Exception {
		Connection con=DBHelper.getConnection();
		String sql="insert into user "+" (username,password,name) "+" value(?,?,?)";
		PreparedStatement prmt=con.prepareStatement(sql);
		prmt.setString(1, user.getUsername());
		prmt.setString(2, user.getPassword());
		prmt.setString(3,user.getTruename());
		prmt.execute();
	}
}
