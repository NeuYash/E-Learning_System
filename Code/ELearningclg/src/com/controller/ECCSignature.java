package com.controller;

import com.DAO.DataAccessLayer;
import com.DAO.Database_con;
import com.model.*;
import com.algorithm.Cryptography;
import com.model.Signature;
import com.model.usrDetails;

import com.utility.*;
import java.io.IOException;
import java.math.BigInteger;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.ECGenParameterSpec;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 */
@WebServlet("/ECCSignature")
public class ECCSignature extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ECCSignature() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// KeyGenerator kg=new KeyGenerator();
		HttpSession session=request.getSession();
		Signature sig = new Signature();

		int Uid = (int) session.getAttribute("uid");
		String FID = request.getParameter("fid");
		String file_name=request.getParameter("filename");
		
		//int user_id = Integer.parseInt(Uid);

		int fid = Integer.parseInt(FID);

		usrDetails u = Database_con.getEmailPassByID(Uid);

		String email = u.getEmail();
		String pass = u.getPass();
		/*
		 * Random r = new Random(); int max = 999999, min = 100000; int code1 =
		 * r.nextInt((max - min) + max); // Database_con.addCode(code);
		 * 
		 * String bls=Integer.toString(code1);
		 */
		
		 KeyPairGenerator kpg = null;
		    try {
				kpg = KeyPairGenerator.getInstance("EC","SunEC");
			} catch (NoSuchAlgorithmException | NoSuchProviderException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		    ECGenParameterSpec ecsp;
		    ecsp = new ECGenParameterSpec("secp192r1");
		    try {
				kpg.initialize(ecsp);
			} catch (InvalidAlgorithmParameterException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		    KeyPair kp = kpg.genKeyPair();
		    PrivateKey privKey = kp.getPrivate();
		    PublicKey pubKey = kp.getPublic();
 
		  
		    
		   String bls=privKey.toString();
		    System.out.println(privKey.toString());
		    System.out.println(pubKey.toString());
		/*String bls = Cryptography.generateKeys("DSA", 1024);*/
		sig.setUserId(Uid);
		sig.setSign(bls);
		
	
		System.out.println("signature==="+"\"" + bls + "\"");
		try {

			SendMailBySite.sendBLS("smtp.gmail.com", "587", "project.varification@gmail.com", "Email@123", email,bls);

			// Database_con.insertSecCode(code);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
            
		boolean flag = true;
		if (flag == true) {
			
			session.setAttribute("uid", Uid);
			session.setAttribute("FID", FID);
			session.setAttribute("bls", bls);
			session.setAttribute("filename", file_name);

			response.sendRedirect("checkSignature.jsp");
		} else {
			response.sendRedirect("Error.jsp");
		}

	}

}
