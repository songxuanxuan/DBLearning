package com.dao;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBHelper;
import com.util.news_bean;;

/**
 * @author fxxk
 *
 */
public class newsDAO {
	public int addNews(news_bean n) throws Exception{
		Connection con=DBHelper.getConnection();
		String sql=""+" insert into news"+" (title,content,time,upload_user,kind) "
		+" value( "+" ?,?,current_time(),?,?) ";
		PreparedStatement psmt=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		psmt.setString(1, n.getTitle());			
		psmt.setString(2, n.getContent());
		psmt.setString(3, "admin");
		psmt.setInt(4, n.getKinds());

//		psmt.setString(5, n.getPic1());
//		psmt.setString(6, n.getPic2());
//		psmt.setString(7, n.getPic3());
//		psmt.setString(8, n.getPic4());
		psmt.execute();

		ResultSet rs=psmt.getGeneratedKeys();
		
		
		rs.next();
		int i=rs.getInt(1);
//		System.out.println("测试dao"+i);	
		return i;
	}
	public void updateNews(news_bean n) throws Exception{
		Connection con=DBHelper.getConnection();
		String sql=""+" update news "+" set title=?,content=?,upload_user=?,kind=? "
		+" where id=? ";									//还可以加更新时间     update_time=current_date()
		PreparedStatement psmt=con.prepareStatement(sql);  //预加载sql语句
		psmt.setString(1, n.getTitle());			       //给赋值psmt
		psmt.setString(2, n.getContent());
		psmt.setString(3, n.getUpload_user());
		psmt.setInt(4, n.getKinds());
		psmt.setInt(5, n.getId());
		psmt.execute();
	}
	public void delNews(news_bean n) throws Exception
	{
		Connection con=DBHelper.getConnection();
		String sql=" "+" delete from news "
		+" where id=? ";									
		PreparedStatement psmt=con.prepareStatement(sql); 
		psmt.setInt(1, n.getId());
		psmt.execute();
	}

	public List<news_bean> queryNews() throws Exception {
		Connection con=DBHelper.getConnection();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from news");
		List<news_bean> news=new ArrayList<news_bean>();
		news_bean n = null;
		while(rs.next())
		{
			n=new news_bean();
			n.setId(rs.getInt("id"));
			n.setTitle(rs.getString("title"));
			n.setContent(rs.getString("content"));
			n.setAdd_time(rs.getDate("time"));  //����������gettime
			n.setUpload_user(rs.getString("upload_user"));
//			n.setKinds(rs.getInt("Kinds"));
			news.add(n);
		}
		return news;
	}
	public news_bean getNews(int n) throws Exception
	{
//		List<news_bean> result=new ArrayList<>();
		Connection con=DBHelper.getConnection();
		String sql=" "+" select * from news "+" where id=?";				
		PreparedStatement psmt=con.prepareStatement(sql);  
		psmt.setInt(1, n);
		ResultSet rs=psmt.executeQuery();	//rs是个集合，要用数组取他的值
		news_bean n1=null;
		while(rs.next())			//要用指针来获取集合，所以必须要循环
		{
			n1= new news_bean();
			n1.setId(rs.getInt("id"));
			n1.setTitle(rs.getString("title"));
			n1.setContent(rs.getString("content"));
			n1.setAdd_time(rs.getDate("time"));
			n1.setUpload_user(rs.getString("upload_user"));
			n1.setKinds(rs.getInt("kind"));
//			result.add(n1);
		}
		return n1;
	}
	public List<news_bean> getNewsByKindD(int n) throws Exception
	{
		List<news_bean> result=new ArrayList<>();
		Connection con=DBHelper.getConnection();
		String sql=" "+" select * from news "+" where kind=? order by id desc";
		PreparedStatement psmt=con.prepareStatement(sql);
		psmt.setInt(1, n);
		ResultSet rs=psmt.executeQuery();
		news_bean n1=null;
		while(rs.next()){
			n1=new news_bean();
			n1.setId(rs.getInt("id"));
			n1.setTitle(rs.getString("title"));
			n1.setContent(rs.getString("content"));
			n1.setAdd_time(rs.getDate("time"));
			n1.setUpload_user("upload_user");
			result.add(n1);
		}
		return result;
		
	}
	public List<news_bean> getNewsByKind(int n) throws Exception
	{
		List<news_bean> result=new ArrayList<>();
		Connection con=DBHelper.getConnection();
		String sql=" "+" select * from news "+" where kind=?";
		PreparedStatement psmt=con.prepareStatement(sql);
		psmt.setInt(1, n);
		ResultSet rs=psmt.executeQuery();
		news_bean n1=null;
		while(rs.next()){
			n1=new news_bean();
			n1.setId(rs.getInt("id"));
			n1.setTitle(rs.getString("title"));
			n1.setContent(rs.getString("content"));
			n1.setAdd_time(rs.getDate("time"));
			n1.setUpload_user("upload_user");
			result.add(n1);
		}
		return result;
		
	}
	public List<news_bean> getNewsByTitle(String n) throws Exception
	{
		List<news_bean> result=new ArrayList<>();
		Connection con=DBHelper.getConnection();
		String sql=" "+" select * from news "+" where title like ?";				
		PreparedStatement psmt=con.prepareStatement(sql);
		n='%'+n+'%';
//		System.out.println(n);
		psmt.setString(1, n);
		ResultSet rs=psmt.executeQuery(); 
		news_bean n1=null;
		while(rs.next())
		{
			n1= new news_bean();
			n1.setId(rs.getInt("id"));
			n1.setTitle(rs.getString("title"));
			n1.setContent(rs.getString("content"));
			n1.setAdd_time(rs.getDate("time"));
			n1.setUpload_user(rs.getString("upload_user"));
			n1.setKinds(rs.getInt("kind"));
			result.add(n1);
		}
		return result;
	}
	
	
}
