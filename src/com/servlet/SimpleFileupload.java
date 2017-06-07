package com.servlet;  
  
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStream;  
import java.util.List;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.FileUploadException;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  

import com.dao.newsDAO;
import com.util.news_bean;
import com.util.pic_bean;
  
/** 
 * Servlet implementation class SimpleFileupload 
 */  
@WebServlet("/simpleFileupload")  
public class SimpleFileupload extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
    /** 
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) 
     */  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        request.setCharacterEncoding("utf-8");  
        response.setCharacterEncoding("utf-8");  
        //1、创建一个DiskFileItemFactory工厂  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //2、创建一个文件上传解析器  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        //解决上传文件名的中文乱码  
        upload.setHeaderEncoding("UTF-8");   
        factory.setSizeThreshold(1024 * 500);//设置内存的临界值为500K  
        File linshi = new File("E:\\linshi");//当超过500K的时候，存到一个临时文件夹中  
        factory.setRepository(linshi);  
        upload.setSizeMax(1024 * 1024 * 5);//设置上传的文件总的大小不能超过5M 
        news_bean n=new news_bean();
        newsDAO news=new newsDAO();
        pic_bean pic=new pic_bean();
        try {  
            // 1. 得到 FileItem 的集合 items  
            List<FileItem> /* FileItem */items = upload.parseRequest(request); 
            Integer id=null;

            // 2. 遍历 items:  
            for (int i=0;i<items.size()-1;i++) {  
                // 若是一个一般的表单域, 打印信息  
                if (i<3) {  
                    String name = items.get(i).getFieldName();  
                    String value = items.get(i).getString("utf-8");  
                    System.out.println(name + ": " + value); 
                    switch (i){
                    case 0:
                    n.setTitle(items.get(i).getString("title"));
                  
                    break;
                    case 1:
                    n.setContent(items.get(i).getString("content"));
                 
                    break;
                    case 2:
                    n.setKinds(Integer.parseInt(items.get(i).getString("kind")));
                    break;
                    }
                }  
                // 若是文件域则把文件保存到 e:\\files 目录下.  
                else {  
                	
                    String fileName = items.get(i).getName();  
                    long sizeInBytes = items.get(i).getSize();  
                    System.out.println(fileName);  
                    System.out.println(sizeInBytes);  
  
                    InputStream in = items.get(i).getInputStream();  
                    byte[] buffer = new byte[1024];  
                    int len = 0;  
  
                    fileName = "e:\\files\\" + fileName;//文件最终上传的位置  
                    System.out.println(fileName); 
                     
                    switch(i){
                    	case 3:
                    		pic.setPic1(fileName);
                    	case 4:
                    		pic.setPic2(fileName);
                    	case 5:
                    		pic.setPic3(fileName);
                    	case 6:
                    		pic.setPic4(fileName);
                    }
                    OutputStream out = new FileOutputStream(fileName);  
                    
                    while ((len = in.read(buffer)) != -1) {  
                        out.write(buffer, 0, len);  
                    }  
                    id=news.addNews(n);
                    pic.setnId(id);
                    out.close();  
                    in.close();  
                }  
            }  
  
        } catch (FileUploadException e) {  
            e.printStackTrace();  
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
  
    }  
}  