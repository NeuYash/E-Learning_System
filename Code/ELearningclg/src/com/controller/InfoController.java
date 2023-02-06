package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import com.DAO.*;
import com.utility.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

@WebServlet("/InfoController")
public class InfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	PrintWriter out=response.getWriter();
     int tid=Integer.parseInt(request.getParameter("stest"));
     HttpSession session=request.getSession();
     session.setAttribute("tid", tid);
    
      
 	  /*int teachid=Integer.parseInt(session.getAttribute("teacherid").toString());*/
     int uid=Integer.parseInt(session.getAttribute("uid").toString());

     System.out.println("===================="+tid); 
     /*System.out.println("===================="+teachid);*/


     
     response.sendRedirect("info.jsp");
		
        
	}

}