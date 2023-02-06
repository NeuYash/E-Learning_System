package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DataAccessLayer;
import com.DAO.OwnerDataAccessLayer;
import com.model.Register;

/**
 * Servlet implementation class OwnerResetController
 */
@WebServlet("/OwnerResetController")
public class OwnerResetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String pass=request.getParameter("pass");
		
		HttpSession session= request.getSession();
		Register register=(Register) session.getAttribute("register");
				
		
		int uid=OwnerDataAccessLayer.getUpdatePass(register,pass);
		
		if(uid==0){
			response.sendRedirect("forgotpassword.jsp");
		}else{
			
			HttpSession session1=request.getSession();
			session1.setAttribute("uid",uid);
			
			response.sendRedirect("login.jsp");
		}
		
	}

}
