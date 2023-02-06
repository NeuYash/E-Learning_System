package com.DAO;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.tomcat.jni.FileInfo;

import com.model.FileInfomation;
import com.model.HealthForm;
import com.model.Register;
import com.model.Signature;
import com.model.UserModel2;
import com.model.groupmodel;
import com.model.userModel;


public class DataAccessLayer {
	
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
	
	public static boolean Checkgroupadmin(Object id, String gname) {
		
		Connection con=makeConnection();
		boolean flag=false;
		int i=0;
		String sql="select * from groupinfo where groupname='" +gname+ "' and groupadmin="+id;
	    try {
	    	ResultSet rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
				i=rs.getInt("groupadmin");
			}
			
			if(i!=0)
			{
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		
		return flag;
	}
	public static boolean deleteGroup(String gname) {
		
		Connection con=makeConnection();
		boolean flag=false;
		int i=0;
		String sql="delete  from groupinfo where groupname=?";
	    try {
	    	
	    	PreparedStatement ps=con.prepareStatement(sql);  
	    	System.out.println("delete Query");
                   
       ps.setString(1, gname);
             
       i=ps.executeUpdate();
			if(i!=0)
			{
				flag=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	    
		return flag;
	}
public static boolean deleteGroup1(String gname) {
		
		Connection con=makeConnection();
		boolean flag=false;
		int i=0;
		String sql="delete from follows_relation where gname=?";
	    try {
	    	
	    	PreparedStatement ps=con.prepareStatement(sql);  
	    	System.out.println("delete Query follows_relation");
                   
       ps.setString(1, gname);
             
       i=ps.executeUpdate();
			if(i!=0)
			{
				flag=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	    
		return flag;
	}
	public static List<Integer> getUser_ids(Object name)
	{
		List<Integer> list=new ArrayList<>();
		Connection con=makeConnection();
		   try {
			   PreparedStatement ps=con.prepareStatement("select * from follows_relation where gname='"+name+"'");  
		          
	            ResultSet rs=ps.executeQuery();
      int id=0;
           while(rs.next())
           {
        	   
        	   System.out.println("groupuserid==="+rs.getInt("userid"));
        	    id=rs.getInt("followerid");
        	   list.add(rs.getInt("userid"));
           
           }
           list.add(id);
		   }catch (Exception e) {
			// TODO: handle exception
		}
		   
		return list;
	}
	public static int getInsertRegistration(Register register) {
		 
	   Connection con=makeConnection();
	   int i=0;
	   PreparedStatement pstm=null;
	   String sql="insert into userregister(fname,lname,contact,email,pass,photo,dept) values (?,?,?,?,?,?,?)";
	   try {
		pstm=con.prepareStatement(sql);
		pstm.setString(1, register.getFname());
		pstm.setString(2, register.getLname());
		pstm.setString(3, register.getContact());
		pstm.setString(4, register.getEmail());
		pstm.setString(5, register.getPass());
		pstm.setString(7, register.getdept());
		//pstm.setString(6, register.getCategory());
		pstm.setBlob(6, register.getPhoto());
		
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
		String sql="select * from userregister where email='" +email+ "' and pass='" +pass+ "' and dept='" +dept+ "'";
	    try {
	    	ResultSet rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
				reg.setEmail(rs.getString("email"));
				reg.setPass(rs.getString("pass"));
			    reg.setdept(rs.getString("dept"));
				reg.setUid(rs.getInt("uid"));
				i=rs.getInt("uid");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		
		return i;
	}

	public static boolean Checkadmin(int id){
		Register reg=new Register();
		Connection con=makeConnection();
		boolean i=false;
		int i1=0;
		String sql="select * from groupinfo where groupadmin="+id;
	    try {
	    	ResultSet rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
				i1=rs.getInt("groupadmin");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    if(i1!=0)
	    {
	    	i=true;
	    }
		
		return i;
	}

	
	
	
	public static InputStream getFile(String filenm) {
		InputStream file=null;
		Connection con=makeConnection();
		String sql="select * from userregister where email='" +filenm+ "'";
		try {
			ResultSet rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
				
				file=(InputStream) rs.getBlob("file_data");
				System.out.println("file=="+file);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return file;
	}

	
	public static Register getEmail(Register register) {
		Register reg=new Register();
		Connection con=makeConnection();
		String sql="select * from userregister where email='" +register.getEmail()+ "'";
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
                         "update userregister set pass=? where email=?");  
           System.out.println("Update Query");
                        
            ps.setString(1, pass);
            ps.setString(2, reg.getEmail());
            System.out.println(reg.getEmail());
            
            i=ps.executeUpdate();  
             
            }catch(Exception ex){ex.printStackTrace();}  
          
        return i;  
    }
	public static int getDeactive(int id) {
        int i=0;  
        try{  
            Connection con=makeConnection();
            PreparedStatement ps=con.prepareStatement(  
                         "update userregister set active=? where uid="+id);  
           System.out.println("Update Query");
                        
            ps.setInt(1, 0);
                       
            i=ps.executeUpdate();  
             
            }catch(Exception ex){ex.printStackTrace();}  
          
        return i;  
    }
	
	
	
	public static int getActive(int id) {
        int i=0;  
        try{  
            Connection con=makeConnection();
            PreparedStatement ps=con.prepareStatement(  
                         "update userregister set active=? where uid="+id);  
           System.out.println("Update Query");
                        
            ps.setInt(1, 1);
                       
            i=ps.executeUpdate();  
             
            }catch(Exception ex){ex.printStackTrace();}  
          
        return i;  
    }
	
	public static int checkActive(int id)
	{
				int i=0;
        try{  
            Connection con=makeConnection();
            PreparedStatement ps=con.prepareStatement("select active from userregister where uid="+id);  
          
            ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				i=rs.getInt("active");
				
			}
                        
            }catch(Exception ex){ex.printStackTrace();}  
		return i;
	}
	public static groupmodel getGroupinfo(String name)
	{
		groupmodel gpn=new groupmodel();
		
        try{  
            Connection con=makeConnection();
            PreparedStatement ps=con.prepareStatement("select * from groupinfo where groupname='"+name+"'");  
          
            ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				gpn.setAdmin_id(rs.getInt("groupadmin"));
				gpn.setDate(rs.getString("date"));
				
			}
                        
            }catch(Exception ex){ex.printStackTrace();}  
		return gpn;
	}
	
	public static String getName(int id)
	{
		String name=null;
		
        try{  
            Connection con=makeConnection();
            PreparedStatement ps=con.prepareStatement("select * from userregister where uid="+id);  
          
            ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				name=rs.getString("fname")+" "+rs.getString("lname");
				
			}
                        
            }catch(Exception ex){ex.printStackTrace();}  
		return name;
	}
	
	public static List<String> getAvailableUsers() {
		UserModel2 u=new UserModel2();
		List<String> userlist=new ArrayList<String>();
        int i=0;  
        try{  
            Connection con=makeConnection();
            PreparedStatement ps=con.prepareStatement("select fname,lname from userregister");  
            System.out.println("Update Query");
            ResultSet rs=ps.executeQuery();
            String str="";
            while(rs.next())
            {
            str=rs.getString("fname");
            str=str+" "+rs.getString("lname");
            
            userlist.add(str);
            }
             
             
            }catch(Exception ex){ex.printStackTrace();}  
          
        return userlist;  
    }
	
//add user ****************************************************************	
	
	public static List<userModel> getAvailableUsers(int userid ) {
		System.out.println(userid);
		List<userModel> availableUserList = new ArrayList<userModel>();
		Connection conn = makeConnection();
		List<Integer> followingId = getFollowingIdList(userid);
		 
		String sql = "select * from userregister where uid not in(select uid from userregister where uid=?)";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, userid);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				userModel u = new userModel();
				u.setId(rs.getInt("uid"));
				u.setFirstName(rs.getString("fname"));
				u.setLastName(rs.getString("lname"));
				u.setEmailID(rs.getString("email"));
				u.setdept(rs.getString("dept"));
				if (followingId.contains(u.getId())) {
					u.setFollowing(true);
				} else {
					u.setFollowing(false);
				}
				availableUserList.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return availableUserList;
	}
	public static List<userModel> getAvailableUsers1(List<Integer> list) {
		
		List<userModel> availableUserList = new ArrayList<userModel>();
		Connection conn = makeConnection();
		 for(Integer s:list) {
			 System.out.println("userid-----------"+s);
		String sql = "select * from userregister where uid="+s;
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
		
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				userModel u = new userModel();
				u.setId(rs.getInt("uid"));
				u.setFirstName(rs.getString("fname"));
				u.setLastName(rs.getString("lname"));
				u.setEmailID(rs.getString("email"));
				u.setMobileNo(rs.getString("contact"));
				System.out.println(rs.getString("fname")+rs.getString("lname")+rs.getString("email")+rs.getString("contact")+rs.getInt("uid"));
				
				availableUserList.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
		return availableUserList;
	}
	public static List<Integer> getFollowingIdList(int userID) {
		List<Integer> idList = new ArrayList<Integer>();
		Connection con = makeConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select userid as follows from Follows_Relation where followerid=" + userID;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				idList.add(rs.getInt("follows"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idList;
	}
	public static List<Integer> getFollowingIdList1(Object userID) {
		List<Integer> idList = new ArrayList<Integer>();
		Connection con = makeConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select userid as follows from Follows_Relation where followerid=" + userID;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				idList.add(rs.getInt("follows"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idList;
	}
			
	public static int getTotalmember(String gname) {

		int tm=0;
		Connection con = makeConnection();
		Statement stmt = null;
		ResultSet rs = null;
		System.out.println(gname);
		String sql = "select * from Follows_Relation where gname='"+gname+"'";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				tm++;
				rs.getString("userid");
				System.out.println("user id "+rs.getString("userid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("totalmember=="+tm);
		return tm;
	}

	public static void createGroup(groupmodel gm) {
		
		Connection con = makeConnection();
		 PreparedStatement pstm=null;
		try {
					
			System.out.println(gm.getGname());
			System.out.println(gm.getAdmin_id());
			System.out.println(gm.getDate());
			System.out.println(gm.getTotalmember());
			
			String sql = "insert into groupinfo(groupname,groupadmin,date,totalmember) values(?,?,?,?)";
				pstm=con.prepareStatement(sql);
				pstm.setString(1, gm.getGname());
				pstm.setInt(2, gm.getAdmin_id());
				pstm.setString(3, gm.getDate());
				pstm.setString(4, gm.getTotalmember());
				
				pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	public static void follow(int userId, int profileId) {
		Connection con = makeConnection();
		Statement stmt = null;
		try {
			stmt = con.createStatement();
			
			String sql = "insert into follows_relation(followerid,userid) values(" + userId + "," + profileId + ")";
			stmt.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();	
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	
	public static void unfollow(int userId, int profileID) {
		Connection con = makeConnection();
		Statement stmt = null;
		try {
			stmt = con.createStatement();
			String sql = "delete from follows_relation where userid=" + profileID + " and followerid=" + userId;
			stmt.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	
	public static int addgroupname(String gname,int id) {
		  
		int i=0;
        try{
        	
            Connection con=makeConnection();
            System.out.println("group name=="+gname);
            System.out.println("user id=="+id);
            String str="update follows_relation set gname='"+gname+"' where followerid="+id;
            PreparedStatement ps=con.prepareStatement(str);  
            System.out.println("Update Query");
            i=ps.executeUpdate(); 
            
            }catch(Exception ex){ex.printStackTrace();}  
          
          return i;
    }

	public static List<String> getAllGroup1() {
		List<String> group=new ArrayList<String>();
		
        try{
        	
            Connection con=makeConnection();
       
            String str="select distinct(gname) from follows_relation ";
            PreparedStatement ps=con.prepareStatement(str);  
           
            System.out.println("Update Query");
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
            	group.add(rs.getString("gname"));	
            	
            	
            }
            System.out.println(group);
            }catch(Exception ex){ex.printStackTrace();}  
        
        //System.out.println(group);  
          return group;
    }
	
	/**---------------------------demo------------------------------*/
	
	public static List<String> getAllGroup(int id) {
		List<String> group=new ArrayList<String>();
		
        try{
        	
            Connection con=makeConnection();
       
            String str="select distinct(gname) from follows_relation where userid=? or followerid=?";
            PreparedStatement ps=con.prepareStatement(str);  
            ps.setInt(1,id);
            ps.setInt(2,id);
            System.out.println("Update Query");
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
            	group.add(rs.getString("gname"));	
            	
            	
            }
            System.out.println(group);
            }catch(Exception ex){ex.printStackTrace();}  
        
        //System.out.println(group);  
          return group;
    }
	
	
	
	
public static boolean addFileDetails(List<FileInfomation> fileLists) {

		
		System.out.println("in add file details");
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		boolean flag = false;
		try {
			String sqlf1 = "insert into file_info(uid,gname,file_name,path,hash_value,file_data,upload_date,upload_time) values(?,?,?,?,?,?,?,?)";
			pstm = con.prepareStatement(sqlf1);

			for (FileInfomation fileinfo : fileLists) {
				pstm.setInt(1,fileinfo.getUid());
				pstm.setString(2, fileinfo.getCatname());
				pstm.setString(3, fileinfo.getFilename());
				pstm.setString(4, fileinfo.getPath());
				pstm.setString(5, fileinfo.getHashvalue());
				pstm.setBlob(6, fileinfo.getInputStream());
				pstm.setString(7, fileinfo.getDate());
				pstm.setString(8, fileinfo.getTime());
				int i = pstm.executeUpdate();
				if (i == 1) {
					flag = true;
				}
			}
		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	
public static boolean addFileDetails2(FileInfomation fileinfo) {

		
		System.out.println("in add file details");
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		boolean flag = false;
		try {
			String sqlf1 = "insert into file_info(uid,gname,file_name,path,hash_value,file_data,upload_date,upload_time) values(?,?,?,?,?,?,?,?)";
			pstm = con.prepareStatement(sqlf1);

				pstm.setInt(1,fileinfo.getUid());
				pstm.setString(2, fileinfo.getCatname());
				pstm.setString(3, fileinfo.getFilename());
				pstm.setString(4, fileinfo.getPath());
				pstm.setString(5, fileinfo.getHashvalue());
				pstm.setBytes(6, fileinfo.getBytes());
				pstm.setString(7, fileinfo.getDate());
				pstm.setString(8, fileinfo.getTime());
				int i = pstm.executeUpdate();
				if (i == 1) {
					flag = true;
				
			}
		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}



public static int getfileid() {

			Connection con = makeConnection();
		    PreparedStatement pstm = null;
		    int  flag=0;
		try {
			String sqlf1 = "select max(id) from file_info";
			pstm = con.prepareStatement(sqlf1);
            ResultSet rs=pstm.executeQuery();
		   
            while(rs.next())
            {
            	
            flag=rs.getInt(1);	
            	
            }	
		
		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
public static String getfilename(int id) {

	
	Connection con = makeConnection();
    PreparedStatement pstm = null;
    String  fname="";
try {
	String sqlf1 = "select * from elearn.file_info where id="+id;
	pstm = con.prepareStatement(sqlf1);
    ResultSet rs=pstm.executeQuery();
   
    while(rs.next())
    {
    fname=rs.getString("file_name");	
    	
    }	

} catch (SQLException e) { // TODO Auto-generated catch block
	e.printStackTrace();
}
return fname;
}

	

public static int addallowuser(int fid,String gname,String fname,int id) {

	
	Connection con = makeConnection();
    PreparedStatement pstm = null;
    int flage=0;
    
   System.out.println(fid+id+gname+fname);
try {
	String sqlf1 = "insert into chield_file_info(fid,uid,filename,gname) values(?,?,?,?)";
	pstm = con.prepareStatement(sqlf1);
	pstm.setInt(1,fid);
	pstm.setInt(2,id);
	pstm.setString(3,fname);
	pstm.setString(4,gname);
    flage=pstm.executeUpdate();
   
   

} catch (SQLException e) { // TODO Auto-generated catch block
	e.printStackTrace();
}
    
    
    
    
return flage;
}



	
	public static ArrayList<FileInfomation> getFileDetailsList(int id,String cname) {
		ArrayList<FileInfomation> v = new ArrayList<FileInfomation>();
		Connection conn;
		try {
			conn = makeConnection();
			//String sql = "select * from file_info where gname=?";
			String sql="select * from file_info where id in(SELECT fid FROM chield_file_info where uid=? and gname=?);";
			// String sql = "select cl.fid,cl.File_name,cl.catid,c.cat_name from
			// Catfile_list cl innerjoin categoryfile c on cl.catid=c.catid and
			// cl.aid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, cname);
			ResultSet rs = ps.executeQuery();
			FileInfomation fd = new FileInfomation();
			while (rs.next()) {
				{
					fd = new FileInfomation();
					fd.setFid(rs.getInt("id"));
					fd.setUid(rs.getInt("uid"));
					fd.setFilename(rs.getString("file_name"));
					fd.setDate(rs.getString("upload_date"));
					fd.setTime(rs.getString("upload_time"));
					v.add(fd);

				}

			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}
	public static ArrayList<userModel> getuserDetails(String dept) {
		ArrayList<userModel> v = new ArrayList<userModel>();
		Connection conn;
		try {
			conn = makeConnection();
			
			String sql="select * from userregister where dept=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, dept);
			ResultSet rs = ps.executeQuery();
			userModel fd = new userModel();
			while (rs.next()) {
				{
					fd=new userModel();
					fd.setId(rs.getInt("uid"));
					fd.setFirstName(rs.getString("fname"));
					fd.setLastName(rs.getString("lname"));
					fd.setMobileNo(rs.getString("contact"));
					fd.setEmailID(rs.getString("email"));
					fd.setAccess(rs.getInt("active"));
					fd.setdept(rs.getString("dept"));
					v.add(fd);
				}

			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}
	public static ArrayList<groupmodel> allgroupdetails() {
		ArrayList<groupmodel> v = new ArrayList<groupmodel>();
		Connection conn;
		try {
			conn = makeConnection();
			
			String sql="select fname, lname, groupname, date, totalmember from groupinfo join userregister on uid=groupadmin";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				{
					
					groupmodel fd = new groupmodel();				
					fd.setGname(rs.getString("groupname"));
					fd.setFname(rs.getString("fname"));
					fd.setLname(rs.getString("lname"));
					fd.setDate(rs.getString("date"));
					fd.setTotalmember(rs.getString("totalmember"));


					v.add(fd);

				}
			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}
	
	public static int Deletefile(int fid) throws SQLException
	{
		int i=0;
		Connection con =makeConnection();
		String sql="delete from file_info where id="+fid;
		PreparedStatement pstm=con.prepareStatement(sql);
		i=pstm.executeUpdate();
				
		return i;
	}
	public static int Deletefilec(int fid) throws SQLException
	{
		int i=0;
		Connection con =makeConnection();
		String sql="delete from chield_file_info where fid="+fid;
		PreparedStatement pstm=con.prepareStatement(sql);
		i=pstm.executeUpdate();
				
		return i;
	}
	public static String getusername(int id)
	{
		String uname="";
		Connection conn;
		try {
			conn = makeConnection();
			String sql = "select fname,lname from userregister where uid=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				{
				 uname=rs.getString("fname")+" ";
				 uname=uname+rs.getString("lname");
				 System.out.println(uname);
				}

			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return uname;
   		
	}


	public static ArrayList getGroupMembar(String categoryName)
	{
		String uname="";
		Connection conn;
		ArrayList al=new ArrayList<>();
		Integer adminid=0;
		try {
			conn = makeConnection();
			String sql = "select userid,followerid from follows_relation where gname=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, categoryName);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				 al.add(rs.getInt("userid"));
				
                   adminid=rs.getInt("followerid");
			}
			al.add(adminid);
                 
		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return al;
		
	}
	
	
	
	public static ArrayList<ArrayList> getGroupMemberInfo(ArrayList al)
	{
		String uname="";
		Connection conn;
		
		/*ArrayList memberemail=new ArrayList();
		ArrayList membernumber=new ArrayList();*/
		ArrayList<ArrayList> info=new ArrayList<ArrayList>();
		Integer adminid=0;
		try {
			conn = makeConnection();
			
			for(int i=0;i<al.size();i++)
			{	
			String sql = "select * from userregister where uid="+al.get(i);	
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList memberinfo=new ArrayList();
			while (rs.next()) {
			 
					
			String fullname=rs.getString("fname")+" "+rs.getString("lname");	
			String email=rs.getString("email");
			
			memberinfo.add(fullname);
			memberinfo.add(email);
			memberinfo.add(rs.getString("contact"));
			}
			
			info.add(memberinfo);
			
			}	
			
			System.out.println("information"+info);
			
        
			
		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return info;
		
		
	}
	
	
	public static int checkGroupExist(String gname)
	{
		int count=0;
		Connection conn;
		try {
			conn = makeConnection();
			String sql = "select count(*) from follows_relation where gname=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, gname);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				{
				count=Integer.parseInt(rs.getString(1));
				
				}

			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return count;
   		
	}
	
	
	public static boolean addDigitalSignature(Signature sg) {
		boolean flag = false;
		Connection con = makeConnection();

		try {
			String sql1 = "insert into signature(bls,uid) values(?,?)";
			PreparedStatement pstm1 = con.prepareStatement(sql1);

			pstm1.setString(1, sg.getSign());
			pstm1.setInt(2, sg.getUserId());

			int i = pstm1.executeUpdate();
			if (i > 0) {
				flag = true;
			} else {
				flag = false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}
	
	
	public static int uploadprofile(int id1,String savePath)
	{
		int count=0;
		Connection conn;
		try {
			conn = makeConnection();
			String sql = "insert into groupprofile(uid,path) values(?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id1);
			ps.setString(2,savePath);
			count= ps.executeUpdate();		
			

			

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return count;
   		
	}
	
	public static BufferedImage getImg(int uid) {
		BufferedImage image = null;
		Connection connection =makeConnection();
		String sql = "select * from profilePic where id=" + uid;
		
		try {
			ResultSet rs = connection.createStatement().executeQuery(sql);
			while (rs.next()) {
				int uid1 = rs.getInt("id");
				Blob blob = rs.getBlob("img");
				InputStream in = blob.getBinaryStream();
				try {
					image = ImageIO.read(in);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return image;
	}
	public static BufferedImage getImg(Object uid) {
		BufferedImage image = null;
		Connection connection =makeConnection();
		String sql = "select * from profilePic where id=" + uid;
		
		try {
			ResultSet rs = connection.createStatement().executeQuery(sql);
			while (rs.next()) {
				int uid1 = rs.getInt("id");
				Blob blob = rs.getBlob("img");
				InputStream in = blob.getBinaryStream();
				try {
					image = ImageIO.read(in);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return image;
	}
	public static BufferedImage getImage(Object gname) {
		BufferedImage image = null;
		Connection connection =makeConnection();
		String sql = "select * from groupinfo where groupname='"+gname+"'";
		
		try {
			ResultSet rs = connection.createStatement().executeQuery(sql);
			while (rs.next()) {
				//int uid1 = rs.getInt("id");
				Blob blob = rs.getBlob("profile");
				System.out.println(gname);
				if(blob!=null) {
				InputStream in = blob.getBinaryStream();
				try {
					image = ImageIO.read(in);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return image;
	}
	public static BufferedImage getImg1(int id) throws SQLException, IOException
	{
		Connection con =makeConnection();
		BufferedImage imag = null;
		String query = "select * from userregister where uid ="+id;
		System.out.println(query);

		ResultSet rs=con.createStatement().executeQuery(query);
		if(rs.next())
		{

			Blob aBlob = rs.getBlob("photo");
			byte[] imageByte = aBlob.getBytes(1, (int) aBlob.length());
			InputStream is=new ByteArrayInputStream(imageByte);
			imag=ImageIO.read(is);
		}
		return imag;
	}

	
	public static void uploadImage(InputStream is, String gname) {
		Connection con =makeConnection();
		PreparedStatement pstm = null;
		String sql = "update groupinfo set profile=? where groupname='"+gname+"'";
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setBlob(1, is);
			pstm.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public static ArrayList<Integer> getcategoryuserid(String cname)
	{
		ArrayList<Integer> al=new ArrayList<Integer>();
		int adminid=0;
		Connection con =makeConnection();
		String query = "select * from follows_relation where gname='"+cname+"'";
		System.out.println(query);

		try {
			ResultSet rs=con.createStatement().executeQuery(query);
			
			while(rs.next())
			{
			 al.add(rs.getInt("userid"));	
			 adminid=rs.getInt("followerid");	
				
			}
			
			if(adminid!=0)
			{
			al.add(adminid);
			  	
			}
			
			System.out.println("list====="+al);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return al;
	}
	
	
	
	public static ArrayList<String> getuserdetails(ArrayList<Integer> list)
	{
		ArrayList<String> al=new ArrayList<String>();
		
		Connection con =makeConnection();
		
		for(int i=0;i<list.size();i++)
		{	
			
		String query = "select * from userregister where uid="+list.get(i);
		System.out.println(query);

		try {
			ResultSet rs=con.createStatement().executeQuery(query);
			
			while(rs.next())
			{
			 al.add(rs.getString("fname")+" "+rs.getString("lname"));	
			 	
			}
			
			
			
			//System.out.println("list====="+al);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		}	
		return al;
	}
	
	
	
	public static void main(String[] args) {
		
		int fid=1;
		String fname="abc.txt",gname="my group";
		
		String names[]={"1","3","4","5"};
		
		
	}
}
