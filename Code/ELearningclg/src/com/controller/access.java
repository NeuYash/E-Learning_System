package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DataAccessLayer;

/**
 * Servlet implementation class access
 */
@WebServlet("/access")
public class access extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id=Integer.parseInt(request.getParameter("uid"));
		String btn=request.getParameter("btn");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		
		if(btn.equals("Deactive"))
		{
			int i=DataAccessLayer.getDeactive(id);
			if(i==1)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Deactivated successfully...! ');");
				out.println("location='userdetails.jsp';");
				out.println("</script>");
			}
			else if(i==0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User can not Deactivated successfully...!');");
				out.println("location='userdetails.jsp';");
				out.println("</script>");
			}
		}
		else if(btn.equals("Active"))
		{
			int i=DataAccessLayer.getActive(id);
			if(i==1)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Activated successfully...! ');");
				out.println("location='userdetails.jsp';");
				out.println("</script>");
			}
			else if(i==0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User can not Activated successfully...!');");
				out.println("location='userdetails.jsp';");
				out.println("</script>");
			}
		}
	}

}
