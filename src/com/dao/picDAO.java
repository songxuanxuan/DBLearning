package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBHelper;
import com.util.news_bean;
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
		
		
	}
	@SuppressWarnings("null")
	public List<pic_bean> getPic() throws Exception {
		Connection con=DBHelper.getConnection();
		String sql="select * from picture "+" order by idpicture desc";
		PreparedStatement  prmt=con.prepareStatement(sql);
		List<pic_bean> pic=new ArrayList<>();
		pic_bean p=null;		
		ResultSet rs= prmt.executeQuery();
		while(rs.next()){
			p=new pic_bean();
			p.setId(rs.getInt("idpicture"));
			p.setnId(rs.getInt("nId"));
		
			p.setPic1(rs.getString("pic1"));
			p.setPic2(rs.getString("pic2"));
			p.setPic3(rs.getString("pic3"));
			p.setPic4(rs.getString("pic4"));
			pic.add(p);
			
		}
		return pic;
	}
	public pic_bean getPicByNID(int nId) throws Exception {
		Connection con=DBHelper.getConnection();
		String sql="select * from picture "+"where nId=? order by idpicture desc ";
		PreparedStatement  prmt=con.prepareStatement(sql);
		prmt.setInt(1,nId);
//		List<pic_bean> pic=new ArrayList<>();
		pic_bean p=null;		
		ResultSet rs= prmt.executeQuery();
		while(rs.next()){
			p=new pic_bean();
			p.setId(rs.getInt("idpicture"));
			p.setnId(rs.getInt("nId"));
		
			p.setPic1(rs.getString("pic1"));
			p.setPic2(rs.getString("pic2"));
			p.setPic3(rs.getString("pic3"));
			p.setPic4(rs.getString("pic4"));	
		}
		return p;
	}
}
