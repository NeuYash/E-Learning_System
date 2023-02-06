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

@WebServlet("/CreateGroupcontroller2")
public class CreateGroupcontroller2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String gname=request.getParameter("gname");
		HttpSession session=request.getSession();
		int id=Integer.parseInt(session.getAttribute("uid").toString());
		System.out.println("userid==="+id);
		boolean flag=DataAccessLayer.Checkadmin(id);
		PrintWriter out=response.getWriter();
    	session.setAttribute("gname", gname);
System.out.println("flag===="+flag);
		if(flag==true) {
			int count=DataAccessLayer.checkGroupExist(gname);
		    
		  /*  if(count!=0)
		    {
				out.println("<script type=\"text/javascript\">");
				
				out.println("var person = confirm('Your can not create more then one group so You want to update your group..!');" + 
						  "if(person == true){"+ 
						"location='AvailableUsers.jsp';" + 
						"}else{" + 
						"location='welcome.jsp';}");
				out.println("</script>");	
		    }else
		    {*/
		    	out.println("<script type=\"text/javascript\">");
				out.println("alert('Your can not create more then one group...!');");
				out.println("location='welcome.jsp';");
				out.println("</script>");	
		   // }
		   
		}else if(flag==false) {
			
				response.sendRedirect("AvailableUsers.jsp?gname="+gname);
		    
		}
	    
	}

}
