package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DataAccessLayer;


@WebServlet("/ViewGroup")
public class ViewGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String categoryName=request.getParameter("categoryName");
		
		ArrayList al=DataAccessLayer.getGroupMembar(categoryName);
		
		ArrayList<ArrayList> info=DataAccessLayer.getGroupMemberInfo(al);
	   
		//System.out.println("hiiiiiiiiiii"+info);
		
		HttpSession session=request.getSession();
	   session.setAttribute("gname", categoryName);
	    session.setAttribute("info", info);
	    response.sendRedirect("viewgroup.jsp");
		
		
	}

}
