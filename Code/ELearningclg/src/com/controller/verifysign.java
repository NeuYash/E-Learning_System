package com.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import com.algorithm.*;

import javax.crypto.Cipher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/verifysign")
public class verifysign extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// static String bucketName = "firstnewbucket1";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		String bls=(String) session.getAttribute("bls");
		String signature=request.getParameter("signature");
		String filename=(String) session.getAttribute("filename");
		/*String filepath="C:\\Users\\KasNet-9\\Desktop\\final selected cloud computing\\MY DOC 2019\\Group data sharing\\decryptedLicenceFile\\";*/
		
		String filepath="C:\\HEMANT\\27_Jan_2020\\HEMANT_BACKUP\\e-learning\\ELearningclg\\WebContent\\decryptedLicenceFile\\"+filename;
		File file1= new File(filepath);
		if(signature.equals(bls))
		{
			
			/*String plainTextFile="C:\\HEMANT\\27_Jan_2020\\HEMANT_BACKUP\\e-learning\\ELearningclg\\WebContent\\decryptedLicenceFile\\";
			 File savedFile = new File( plainTextFile);
			File File1 = Algorithm.decrypt(savedFile);*/
		
			//AmazonStorage.downloadFile(filename, filepath);
			/*String filePath1 = "C:\\Users\\KasNet-9\\Desktop\\final selected cloud computing\\MY DOC 2019\\Group data sharing\\controllerFiles\\"+filename;*/
			
			String filePath1="C:\\HEMANT\\27_Jan_2020\\HEMANT_BACKUP\\e-learning\\ELearningclg\\WebContent\\controllerFiles\\"+filename;
			  File file= new File(filePath1);
			//File downloadFile = new File(filePath1);
			File downloadFile = Algorithm.decrypt(file,filename);
			  //File downloadFile = Algo.file(Cipher.DECRYPT_MODE,file,filePath1);
			// File downloadFile=Algorithm.fileProcessor(file,file1);
			  
	        FileInputStream inStream = new FileInputStream(downloadFile);
	         
	        String relativePath = getServletContext().getRealPath("");
	        System.out.println("relativePath = " + relativePath);
	        
	        ServletContext context = getServletContext();
	         
	        String mimeType = context.getMimeType(filePath1);
	        if (mimeType == null) {         
	           
	            mimeType = "application/octet-stream";
	        }
	        System.out.println("MIME type: " + mimeType);
	         
	        response.setContentType(mimeType);
	        response.setContentLength((int) downloadFile.length());
	         
	        String headerKey = "Content-Disposition";
	        String headerValue = String.format("attachment; filename=\"%s\"", filename);
	        response.setHeader(headerKey, headerValue);
	         
	        OutputStream outStream = response.getOutputStream();
	         
	        byte[] buffer = new byte[4096];
	        int bytesRead = -1;
	         
	        while ((bytesRead = inStream.read(buffer)) != -1) {
	            outStream.write(buffer, 0, bytesRead);
	            
	        }
	         
	        inStream.close();
	        outStream.close();	
			
		}
		else
		{
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('File can not download...!');");
			out.println("location='viewdownloadfile.jsp';");
			out.println("</script>");
		}
	}

}
