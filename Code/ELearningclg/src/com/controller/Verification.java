package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DataAccessLayer;
import com.model.Register;


/**
 * Servlet implementation class verification
 */
@WebServlet("/verification")
public class Verification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("im in verification.java");
		String vcode = request.getParameter("vrcode");
		//int vrcode = Integer.parseInt(vcode);
		//int code=randomnumber.randommethod();
		System.out.println("text filed="+vcode);
		
		HttpSession session = request.getSession();
		String code1 = String.valueOf(session.getAttribute("code1"));
		//String code1=(String) session.getAttribute("code1");
		System.out.println(session.getAttribute("code1"));
		
		
	
		HttpSession session2=request.getSession();
		Register obj=(Register) session2.getAttribute("usr");
			
		// int id = Database_con.getMaxCode();
		// UserDetails u = Database_con.getDetails(id);

		if (vcode.equals(code1)) {


			  int i=DataAccessLayer.getInsertRegistration(obj);
			     
			     if(i != 0 ){
			    	 response.sendRedirect("login.jsp");
			    	// response.sendRedirect("verify1.jsp");

			     }else{
			    	 response.sendRedirect("register.jsp");
			     }
			     
			     }else{
			    	 response.sendRedirect("emailExist.jsp");
			     }

	}

}
