package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.DataAccessLayer;
import com.model.groupmodel;

@WebServlet("/CreateGroupController")
public class CreateGroupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String gname=(String) session.getAttribute("gname");
		int userid =Integer.parseInt(session.getAttribute("uid").toString());
		System.out.println("gname1====="+gname);
		System.out.println("userid1========"+userid);
		int i=DataAccessLayer.addgroupname(gname,userid);
		System.out.println("i========="+i);
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String date=dtf.format(now);
		int tm1=DataAccessLayer.getTotalmember(gname);
		String tm=String.valueOf(tm1);
		groupmodel gm=new groupmodel();
		gm.setAdmin_id(userid);
		gm.setDate(date);
		gm.setGname(gname);
		gm.setTotalmember(tm);
		
	    PrintWriter out=response.getWriter();

		if(i!=0)
	    {
	    	DataAccessLayer.createGroup(gm);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Group created Successfully......');");
			out.println("location='welcome.jsp';");
			out.println("</script>");	
	    	
	    }
	    else
	    {
		
		session.setAttribute("gname",gname);
		response.sendRedirect("AvailableUsers.jsp?gname="+gname);
		
	    }
	}

}
