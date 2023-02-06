package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.model.UserTestInfo;


@WebServlet("/StartTestController")
public class StartTestController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
   
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("===================================In startTestController======================");
		HttpSession session1 = request.getSession();
		HttpSession session = request.getSession();
		
		int tid=Integer.parseInt(session.getAttribute("tid").toString()); 
		System.out.print("TestId==========:::"+tid);
		
		//this is code for get 10 random question from data base 
		Map<Integer, UserTestInfo> map = (Map<Integer, UserTestInfo>) RandomQuestion.getQuestion(tid);
	
		//this is question id set and we pass first question id here
		session.setAttribute("map", map);
        ArrayList<Integer> keyset1=new ArrayList<>(map.keySet());
        int keyid=keyset1.get(0);
		session.setAttribute("keyset",keyid);
		
		int qnumber=1;
		session.setAttribute("qestionnumber",qnumber);
		
		
		
		
		
		//this is for create empty answerlis with given question id 
		Map<Integer, String> answerlist=new HashMap<Integer,String>();
		
		for(int i=0;i<keyset1.size();i++)
		{
			answerlist.put(keyset1.get(i),"NA");//here we put " "
			
		}
		session.setAttribute("answerlist",answerlist);
		
		
		
		response.sendRedirect("starttest1.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String question=request.getParameter("question");
		String answer=request.getParameter("option");
		
		
		String qid=request.getParameter("qid");
		
		String submit=request.getParameter("submit");
		System.out.println("button value=="+submit);
		
		
		int keyid1=Integer.parseInt(qid);
		System.out.println("begining key=="+keyid1);
		
		
		
		// get map from session 
		HttpSession session = request.getSession();
		
		Map<Integer, String> map =(Map<Integer, String>)session.getAttribute("map");
		System.out.println(map.keySet());
	 
		//here we create question id list 
		ArrayList<Integer> keyset1=new ArrayList<>(map.keySet());
       
		
		//get answerlist from session to set first answer using put method 
		Map<Integer, String> answerlist=(Map<Integer, String>)session.getAttribute("answerlist");
		answerlist.put(keyid1,answer);
		answerlist.replace(keyid1, null, "NA");
		System.out.println("answer map=="+answerlist);
		
		
	
		int count1 = Collections.frequency(answerlist.values(),"NA"); 
		
	

	System.out.println("null Count"+count1);
	 int tot=count1;
	System.out.println("Total Unanswer count"+tot);


	int an=10;
	int count2 = an-tot;
	System.out.println("Total Ans Count"+count2);
	
	
	    
		//this session is for question number
		int qnumber=(int)session.getAttribute("qestionnumber");
		
		
		
		//this are the controll condition for next and previous button
		
		
if(submit.equals("Next"))
		{
			System.out.println("inside");
			int index=keyset1.indexOf(keyid1);
			System.out.println("index=="+index);
	        index=index+1;
	        
	        int keyid=0;
	        	if(index<=9)
	        	{	
	    	            System.out.println("index2=="+index);
	    	            keyid=keyset1.get(index);
	                    session.setAttribute("keyset",keyid);
	        
	        
	                    System.out.println("next key==="+keyid);
			
	                   //this is for increase question number 
	                    qnumber=qnumber+1;
	                    session.setAttribute("qestionnumber", qnumber);
	
	       

	                    response.sendRedirect("starttest1.jsp");	
	        
			    } 
	      
}
		
		
if(submit.equals("Save"))
{
  		  
    		
    
		response.sendRedirect("starttest1.jsp");
    		
}

if(submit.equals("Save Test"))
{
  		
		response.sendRedirect("starttest1.jsp");
    	
}
	

//Previous Button
		
if(submit.equals("Prev"))
		{
			
			int index=keyset1.indexOf(keyid1);
	        
		   //this is for decrising question number by 1
			        if(qnumber>1)
			             {	
			                   qnumber=qnumber-1;
	                           session.setAttribute("qestionnumber", qnumber);
			             }
			         else
			             {
			                	  qnumber=1;
			                	  session.setAttribute("qestionnumber", qnumber);
					                 
			             }	  
				
			
		            if(index==0)
	                     {
	         
	        	                   index=0;
	                               int keyid3=keyset1.get(index);
		                           session.setAttribute("keyset",keyid3);
		       
		                           System.out.println("next key==="+keyid3);
		                           response.sendRedirect("starttest1.jsp");	
			
	        	
	                    }
			        else
			            {	
			                        index=index-1;
	                                int keyid=keyset1.get(index);
	                                session.setAttribute("keyset",keyid);
	       
	                                 System.out.println("next key==="+keyid);
	        
	                                  response.sendRedirect("starttest1.jsp");	
		
			            }
	            
		}
	
//End Test 
		if(submit.equals("Submit Test"))
	    	{
			
			response.sendRedirect("testEnd.jsp");
			
		   }   

	        		
		 }
	        	
  }
