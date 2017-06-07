package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.db.DBHelper;
import com.util.pic_bean;

public class picDAO {
	public void addpic(pic_bean pic) throws Exception{
		Connection con=DBHelper.getConnection();
		String sql=" insert into picture "+"  (nId,pic1,pic2,pic3,pic4) "+"  value( ?,?,?,?,? )";
		PreparedStatement prmt=con.prepareStatement(sql);
		prmt.setInt(1, pic.getnId());
		prmt.setString(2, pic.getPic1());
		prmt.setString(3, pic.getPic2());
		prmt.setString(4, pic.getPic3());
		prmt.setString(5, pic.getPic4());
		prmt.execute();
		System.out.println("测试dao");
		
		
	}
}
