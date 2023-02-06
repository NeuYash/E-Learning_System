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
 * Servlet implementation class OwnerRegistrationController
 */
@WebServlet("/OwnerRegistrationController")
public class OwnerRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// String fname=request.getParameter("fname1");
		
		 String fname=request.getParameter("fname");
		 System.out.println("ala ka "+fname);
		    String lname=request.getParameter("lname");
		    String contact=request.getParameter("contact");
		    String email=request.getParameter("email");
		    String pass=request.getParameter("pass");
		    String dept=request.getParameter("dept");
		     Register register=new Register();
		     register.setFname(fname);
		     register.setLname(lname);
		     register.setContact(contact);
		     register.setEmail(email);
		     register.setPass(pass);
		     register.setdept(dept);;
		     Register reg=OwnerDataAccessLayer.getEmail(register);
		    
		  
		     String str=reg.getEmail();
			  
		       if(str == null){
		    	   
		 
		     int i=OwnerDataAccessLayer.getInsertRegistration(register);
		     
		     if(i != 0 ){
		    	 response.sendRedirect("ownerlogin.jsp");
		     }else{
		    	 response.sendRedirect("ownerregister.jsp");
		     }
		     
		     }else{
		    	 response.sendRedirect("emailExist.jsp");
		     }
		     
		
		
	}

}
