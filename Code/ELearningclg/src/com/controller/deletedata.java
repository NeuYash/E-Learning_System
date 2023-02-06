package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.DataAccessLayer;

/**
 * Servlet implementation class deletedata
 */
@WebServlet("/deletedata")
public class deletedata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String fid=request.getParameter("fid");
	String file_name=request.getParameter("file_name");
	int fileid=Integer.parseInt(fid);
	int i;
	try {
		i = DataAccessLayer.Deletefile(fileid);
		DataAccessLayer.Deletefilec(fileid);
	
	PrintWriter out = response.getWriter();
	if(i!=0)
	{
		AmazonStorage.deleteFile(file_name, file_name);
		out.println("<script type=\"text/javascript\">");
		out.println("alert('File delete Successfully');");
		out.println("location='deletedata.jsp';");
		out.println("</script>");
	}
	else
	{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('File can not deleted');");
		out.println("location='deletedata.jsp';");
		out.println("</script>");
	}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
