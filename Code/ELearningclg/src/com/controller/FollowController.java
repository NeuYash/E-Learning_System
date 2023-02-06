package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DataAccessLayer;

/**
 * Servlet implementation class FollowController 
 */
@WebServlet("/FollowController")
public class FollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId=Integer.parseInt(request.getParameter("userId"));
		int profileId=Integer.parseInt(request.getParameter("profileId"));
		
		String btn=request.getParameter("btn");
		System.out.println("button value==="+btn);
		
		
		
		DataAccessLayer.follow(userId, profileId);
		btn="REMOVE";
		response.sendRedirect("AvailableUsers.jsp?profileID="+userId);
		
	}
}
