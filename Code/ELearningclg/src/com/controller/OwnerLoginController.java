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
import com.DAO.OwnerDataAccessLayer;

/**
 * Servlet implementation class OwnerLoginController
 */
@WebServlet("/OwnerLoginController")
public class OwnerLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String dept=request.getParameter("dept");		
		int uid=OwnerDataAccessLayer.getCheckEmail(email,pass,dept);
		PrintWriter out = response.getWriter();
		
		   HttpSession session = request.getSession();
		     
		     session.setAttribute("dept", dept);
		     
		
		if(uid==0){
			/*out.println("<script type=\"text/javascript\">");
			out.println("alert('Login successful...!');");
			out.println("location='ownerlogin.jsp';");
			out.println("</script>");*/
			response.sendRedirect("ownerlogin.jsp?val=Wrong Email id or Password  or   Department!!!!");
		}else{
			
			HttpSession session1=request.getSession();
			session1.setAttribute("uid",uid);
			
			response.sendRedirect("adminwelcome.jsp");
		}
		
	}

	

}
