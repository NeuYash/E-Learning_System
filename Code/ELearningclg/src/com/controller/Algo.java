package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.util.Base64Decoder;

/**
 * Servlet implementation class Algo
 */
@WebServlet("/Algo")
public class Algo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Algo() {
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
		
		
		
		
		
		
	}

	public static File file(int cipherMode,File inputFile,String outputFile) {
		
			 try {
				 
				 String key = "This is a secret";
				 
				 
			       Key secretKey = new SecretKeySpec(key.getBytes(), "AES");
			      // Cipher cipher = Cipher.getInstance("AES");
			       Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			       cipher.init(cipherMode, secretKey);

			       FileInputStream inputStream = new FileInputStream(inputFile);
			       byte[] inputBytes = new byte[(int) inputFile.length()];
			       inputStream.read(inputBytes);

			       byte[] outputBytes = cipher.doFinal(inputBytes);

			       FileOutputStream outputStream = new FileOutputStream(outputFile);
			       outputStream.write(outputBytes);

			       inputStream.close();
			       outputStream.close();

			    } catch (NoSuchPaddingException | NoSuchAlgorithmException 
		                     | InvalidKeyException | BadPaddingException
			             | IllegalBlockSizeException | IOException e) {
				e.printStackTrace();
		            }
			return inputFile;
		     }
		
	
	
	
	

	
	
	
	}


