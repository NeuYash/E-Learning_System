package com.algorithm;

import java.sql.*;
import java.util.ArrayList;

import com.model.FileInfomation;
import com.DAO.DataAccessLayer;;
public class Redundancy_remove {
	
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
	public static ArrayList<FileInfomation> getFileDetailsList(int id,String cname) {
		ArrayList<FileInfomation> v = new ArrayList<FileInfomation>();
		Connection conn;
		try {
			conn = makeConnection();
			
			
			  
			
			String sql ="SELECT   DISTINCT hash_value ,file_name,gname,path,uid  FROM file_info where id  in(SELECT fid FROM chield_file_info where uid=? and gname=?);";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, cname);
			ResultSet rs = ps.executeQuery();
			
			FileInfomation fd = new FileInfomation();
			while (rs.next()) {
				{
					fd = new FileInfomation();
					
					fd.setUid(rs.getInt("uid"));
					fd.setFilename(rs.getString("file_name"));
				  
					v.add(fd);

				}
			}
			

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}

}
