package com.control;

import java.util.Date;
import java.util.List;

import com.dao.newsDAO;
import com.util.news_bean;


public class newsAction {
	public static class NewsAction {

	    public static void main(String[] args) throws Exception {
//	        newsDAO gd=new newsDAO();
//	        List<news_bean> news=gd.queryNews();
//	        for (news_bean n : news) {
//	            System.out.println(n.getTitle()+","+n.getId());
//	        	
	    		newsDAO news=new newsDAO();
	    		news_bean n=new news_bean();
	    		n.setTitle("��3������");
	    		n.setContent("���ŵ�����");
//	    		n.setAdd_time(new Date());
	    		n.setUpload_user("admin");
	    		n.setKinds(1);
	    		
	    		n.setId(1);
//	    		news.addNews(n);	
//	    		news.updateNews(n);
//	    		news.delNews(n);
//	    		List<news_bean> n1=news.getNews(3);
//	    		
//	    			System.out.println(n1.toString());
	    		List<news_bean> n1=news.getNewsByTitle("��3������");
	    		for(int i=0;i<n1.size();i++)
	    		{
	    			System.out.println(n1.get(i).toString());
	    		}
	    			
	        }

	    }

	}

