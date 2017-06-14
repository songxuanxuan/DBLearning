package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.userDAO;


@WebServlet("/isCorrect")
public class isCorrect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public isCorrect() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userDAO user=new userDAO();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		boolean is=false;
		try {
			is=user.isLogin(username,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(is);
//		request.getRequestDispatcher("edit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
