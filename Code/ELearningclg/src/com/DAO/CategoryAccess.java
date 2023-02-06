package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryAccess {
	
  public static List<String>  getCategory() throws SQLException
	{
	  List<String> category1=new ArrayList<String>();	
		
	Connection con=DataAccessLayer.makeConnection();
	PreparedStatement pstm=null;
	String str="select * from category";
	pstm=con.prepareStatement(str);
	ResultSet rs=pstm.executeQuery();
	
	while(rs.next())
	{
		
	category1.add(rs.getString("cname"));
	//System.out.println(rs.getString("cname"));
	}
	
	
	return(category1);
	}
  
  /*public static void main(String[] args) throws SQLException {
	
	  List<String> category1=new ArrayList<String>();
	  
	  category1=getCategory();
	  System.out.println(category1);
}*/
	
}
