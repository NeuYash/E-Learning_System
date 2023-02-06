package com.controller;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;

import com.model.UserTestInfo;
import com.utility.*;
import com.DAO.*;


public class RandomQuestion {
	
	

	public static Map<Integer, UserTestInfo> getQuestion(int testid) {
		
		ArrayList<Integer> list=getQuestionId(testid);
		HashSet<Integer> list2=new HashSet<Integer>();
		while(list2.size()!=10)
		{
		
		Integer rn=randomnumber1.randommethod1(list);
		
		if(list.contains(rn))
		{
			list2.add(rn);	
			
		}	
		
		}
		
		System.out.println("new list=="+list2);

		ArrayList<Integer> qnolist=new ArrayList<>(list2);
		
		System.out.println("new list12345=="+qnolist);
		
		Map<Integer, UserTestInfo> map = new LinkedHashMap<Integer, UserTestInfo>();
		 Connection conn =DBConnnection.makeConnection();
		
		/*Don't make connection null it will throw error when deploy on cloudjiffy */
		
		
		try {
			
			String str = "select * from chiledtest where tid="+testid+" and qno in(";
            String str2="";   
            
            for(int i=0;i<qnolist.size();i++)
            {
            str2=str2+qnolist.get(i)+",";		
            }
            str=str+str2;
            String query=str.substring(0,str.length()-1)+");";

            System.out.println("new=="+str2);
            System.out.println("main=="+query);
			
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				
				UserTestInfo obj=new UserTestInfo();
				obj.setQid(rs.getInt("qno"));
				obj.setQname(rs.getString("question"));
				obj.setOption1(rs.getString("option1"));
				obj.setOption2(rs.getString("option2"));
				obj.setOption3(rs.getString("option3"));
				obj.setOption4(rs.getString("option4"));
				obj.setAnswer(rs.getString("answer"));
				
				map.put(rs.getInt("qno"),obj);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//System.out.println(map);
		
		return map;
		}
		

			
	
public static ArrayList<Integer> getQuestionId(int testid) {
		
	
	   ArrayList<Integer> list=new ArrayList<>();
	  
			
	   Connection conn =DBConnnection.makeConnection();
	 
		try {
			
			
			
			String str = "select * from chiledtest where tid="+testid;
			PreparedStatement st = conn.prepareStatement(str);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
		
				list.add(rs.getInt("qno"));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	
		System.out.println(list);
		
		return list;
		}
		
	
		

	public static void main(String[] args) {
	
		
		getQuestion(1);
		
		
	}

}
