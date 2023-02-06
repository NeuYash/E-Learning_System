package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Register;

public class OwnerDataAccessLayer {
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/elearn?autoReconnect=true&useSSL=false";
	static final String USER = "root";
	static final String PASS = "root";

	public static Connection makeConnection() {
		Connection con = null;
		try {
			Class.forName(JDBC_DRIVER);
			con = DriverManager.getConnection(DB_URL, USER, PASS);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;

	}
	

	public static int getInsertRegistration(Register register) {
		//uid, fname, lname, contact, email, pass
	   Connection con=makeConnection();
	   int i=0;
	   PreparedStatement pstm=null;
	  // String sql="insert into ownerregister(fname,lname,contact,email,pass) values (?,?,?,?,?)";
	   try {
		pstm=con.prepareStatement("insert into ownerregister(fname,lname,contact,email,pass,dept) values (?,?,?,?,?,?)");
		pstm.setString(1, register.getFname());
		pstm.setString(2, register.getLname());
		pstm.setString(3, register.getContact());
		pstm.setString(4, register.getEmail());
		pstm.setString(5, register.getPass());
		pstm.setString(6, register.getdept());
		i=pstm.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   return i;
	}


	public static int getCheckEmail(String email, String pass,String dept) {
		Register reg=new Register();
		Connection con=makeConnection();
		int i=0;
		String sql="select * from ownerregister where email='" +email+ "' and pass='" +pass+ "' and dept='" +dept+ "'" ;
	    try {
	    	ResultSet rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
				reg.setEmail(rs.getString("email"));
				reg.setPass(rs.getString("pass"));
				reg.setdept(rs.getString("dept"));
				reg.setUid(rs.getInt("uid"));
				i=rs.getInt("uid");
				System.out.println("owner id="+i+" "+rs.getInt("uid"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		
		return i;
	}


	public static Register getEmail(Register register) {
		Register reg=new Register();
		Connection con=makeConnection();
		String sql="select * from ownerregister where email='" +register.getEmail()+ "'";
		try {
			ResultSet rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
				
				reg.setUid(rs.getInt("uid"));
				reg.setEmail(rs.getString("email"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return reg;
	}


	
	
/*	public static int getUpdatePass(String pass2) {
		int i=0;
		Register reg=new Register();
		Connection con=makeConnection();
		
		String sql="Update register set email where pass='" +pass2+ "'";
		try {
			ResultSet rs=con.createStatement().executeQuery(sql);
			
			while(rs.next()){
				
				reg.setUid(rs.getInt("uid"));
				reg.setEmail(rs.getString("email"));
				reg.setPass(rs.getString("pass"));
				i=rs.getInt("uid");
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}*/
	
	
	public static int getUpdatePass(Register reg,String pass) {
        int i=0;  
        try{  
            Connection con=makeConnection();
            PreparedStatement ps=con.prepareStatement(  
                         "update ownerregister set pass=? where email=?");  
           System.out.println("Update Query");
                        
            ps.setString(1, pass);
            ps.setString(2, reg.getEmail());
            System.out.println(reg.getEmail());
            
            i=ps.executeUpdate();  
             
            }catch(Exception ex){ex.printStackTrace();}  
          
        return i;  
    }


}
