package com.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.DataAccessLayer;
import com.model.Register;

import com.utility.*;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/RegistrationController")
@MultipartConfig(maxFileSize = 1637121115)
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int code1=randomnumber.randommethod();
		System.out.println("otp"+code1);
		HttpSession session = request.getSession();
		session.setAttribute("code1",code1);
		//uid, fname, lname, contact, email, pass
	    String fname=request.getParameter("fname");
	    String lname=request.getParameter("lname");
	    String contact=request.getParameter("contact");
	    String email=request.getParameter("email");
	    String pass=request.getParameter("pass");
	    String dept=request.getParameter("dept");
	   // String category=request.getParameter("categoryName");
	   // System.out.println("category===="+category);
	    
	    try {

			SendMailBySite.sendEmail("smtp.gmail.com", "587", "project.varification@gmail.com", "Email@123", email, code1);
			// Database_con.insertSecCode(code);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			//response.sendRedirect("Error.jsp");
			e.printStackTrace();
		}
	    
	    
	   
	    Part img=request.getPart("file");
	    InputStream inputstream=null;
	    if(img!=null) {
	    	inputstream=img.getInputStream();
	    	
	    }
	     Register register=new Register();
	     register.setFname(fname);
	     register.setLname(lname);
	     register.setContact(contact);
	     register.setEmail(email);
	     register.setPass(pass);
        // register.setCategory(category);
         register.setPhoto(inputstream);
         register.setdept(dept);
	     Register reg=DataAccessLayer.getEmail(register);
	    
	     
	     HttpSession session2=request.getSession();
			session2.setAttribute("usr",  register);
			
			//response.sendRedirect("verify.jsp");
	     
	     
	     String str=reg.getEmail();
		  
	      // if(str == null){
	    	   
	 
	    // int i=DataAccessLayer.getInsertRegistration(register);
	     
	     //if(i != 0 ){
	    	// response.sendRedirect("login.jsp");
	    	 response.sendRedirect("verify1.jsp");

	     //}else{
	    //	 response.sendRedirect("register.jsp");
	    // }
	     
	     //}else{
	    	// response.sendRedirect("emailExist.jsp");
	     //}
	    
	     
	}

}
