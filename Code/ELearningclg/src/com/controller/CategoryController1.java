package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CategoryController1
 */
@WebServlet("/CategoryController1")
public class CategoryController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryController1() {
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
		 String catid = request.getParameter("categoryName");
			// String aid = request.getParameter("aid");
			 HttpSession session=request.getSession();
			
			 int userid =Integer.parseInt(session.getAttribute("uid").toString());
			 session.setAttribute("cname", catid);
			 System.out.println("Details of category controller==> "+catid+"  "+userid);
			 //ServletContext context=getServletContext();
			// context.setAttribute("aid", aid);
			 //context.setAttribute("cname", catid);
			 
			 request.getRequestDispatcher("opration1.jsp").forward(request, response);
			// request.getRequestDispatcher("FrmUploadFile.jsp").forward(request, response);
	}

}