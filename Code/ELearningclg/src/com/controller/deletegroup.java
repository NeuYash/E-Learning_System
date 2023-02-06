package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.DataAccessLayer;

@WebServlet("/deletegroup")
public class deletegroup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String gname=request.getParameter("gname");
		boolean flag=DataAccessLayer.deleteGroup(gname);
		PrintWriter out = response.getWriter();

		if(flag==true)
		{
			DataAccessLayer.deleteGroup1(gname);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Group delete successfully...!');");
			out.println("location='welcome.jsp';");
			out.println("</script>");
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Group can not delete try again...!');");
			out.println("location='welcome.jsp';");
			out.println("</script>");
		}
				
	}

}
