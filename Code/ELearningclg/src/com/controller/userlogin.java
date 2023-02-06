
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.DAO.DataAccessLayer;
import com.model.AttributeDetails;
import com.algorithm.*;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
		
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String dept=request.getParameter("dept");		
		int uid=DataAccessLayer.getCheckEmail(email,pass,dept);
		
		
		
		
		   HttpSession session = request.getSession();
		     
		     session.setAttribute("dept", dept);
		     

		PrintWriter out = response.getWriter();
         System.out.println("hello");
		if(uid==0){
			response.sendRedirect("login.jsp?val=Wrong Email id or Password  or   Department !!!");
		}else{
			int status=DataAccessLayer.checkActive(uid);
			if(status==1)
			{
				HttpSession session1=request.getSession();
				session1.setAttribute("uid",uid);
				
				out.println("<script type=\'text/javascript\'>");
				out.println("alert('Login successfully...! ');");
			
				out.println("</script>");
				response.sendRedirect("welcome.jsp");

				
			}
			else{
				
				 /*request.getRequestDispatcher("requestpage.jsp").forward(request, response);*/
				 response.sendRedirect("requestpage.jsp");
			}
			
			 System.out.println("hello");
			
		}
		
	}


		
			
	
	}

