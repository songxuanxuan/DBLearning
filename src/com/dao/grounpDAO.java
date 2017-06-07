package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.db.DBHelper;
import com.util.Grounp;

public class grounpDAO {
	public void addGrounp(Grounp grounp) throws Exception{
		Connection con=DBHelper.getConnection();
		String sql="insert into grounps" +
				" (leader,deputy,staff,commander,deputy_comm,staff2) " +" value(?,?,?,?,?,?)";
		PreparedStatement prmt=con.prepareStatement(sql);
		prmt.setString(1, grounp.getLeader());
		prmt.setString(2,grounp.getDeputy() );
		prmt.setString(3, grounp.getStaff());
		prmt.setString(4, grounp.getCommander());
		prmt.setString(5,grounp.getDeputy_comm());
		prmt.setString(6, grounp.getStaff2());
		prmt.execute();
	}
	public Grounp showGrounp() throws Exception{
		Connection con=DBHelper.getConnection();
		String sql="select * from grounps" +
				" order by id DESC limit 1";
		PreparedStatement prmt=con.prepareStatement(sql);
		ResultSet rs=prmt.executeQuery();
		Grounp gro=new Grounp();
		while(rs.next()){
		gro.setLeader(rs.getString("leader"));
		gro.setDeputy(rs.getString("deputy"));
		gro.setStaff(rs.getString("staff"));
		gro.setCommander(rs.getString("commander"));
		gro.setDeputy_comm(rs.getString("deputy_comm"));
		gro.setStaff2(rs.getString("staff2"));
		}
		return gro;
		
		
	}
}
