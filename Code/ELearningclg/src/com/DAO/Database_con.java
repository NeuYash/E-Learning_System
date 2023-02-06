package com.DAO;

import com.model.Signature;
import com.model.usrDetails;
import com.model.*;
import com.model.Request;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class Database_con {

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

	
/*
	public static boolean SetPermissionToUser(Request rq) {
		boolean flag = false;
		Connection con = makeConnection();
		String sql = "update RequestUserToAdmin set RequestStatus=? where ReqID=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, rq.getRequestStatus());
			ps.setInt(2, rq.getReqID());
			int i = ps.executeUpdate();
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
*/
	/*public static boolean RevokePermissionFromUser(Request rq) {
		boolean flag = false;
		Connection con = makeConnection();
		String sql = "Update RequestUserToAdmin set RequestStatus=? where CatId=? and userId=?";
		try {

			System.out.println("in databse method");
			System.out.println("req status" + rq.getRequestStatus());
			System.out.println("req user id" + rq.getUserId());
			System.out.println("cat id" + rq.getCatId());

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, rq.getRequestStatus());
			ps.setInt(2, rq.getCatId());
			ps.setInt(3, rq.getUserId());
			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			} else {
				flag = false;
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	public static ArrayList<Request> GetAllUserAcceptList()

	{
		Request r1;
		ArrayList<Request> rq = new ArrayList<Request>();

		Connection con = makeConnection();

		try {
			ResultSet rs = con.createStatement().executeQuery("select * from requestusertoadmin");
			while (rs.next()) {
				r1 = new Request();
				r1.setUserId(rs.getInt("UserId"));
				r1.setCatId(rs.getInt("CatId"));
				r1.setRequestStatus(rs.getString("RequestStatus"));
				r1.setReqID(rs.getInt("ReqID"));
				rq.add(r1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rq;
	}

	public static Signature getSignature(int id) {
		Signature kg = null;
		Connection con = makeConnection();

		try {
			ResultSet rs = con.createStatement().executeQuery("select bls from BLSSignature where uid=" + id);
			while (rs.next()) {
				kg = new Signature();
				kg.setSign(rs.getString("bls"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return kg;
	}

	public static FileInfomation getFile(int fid) {
		FileInfomation fd = null;
		Connection con = makeConnection();
		try {

			ResultSet rs = con.createStatement()
					.executeQuery("select File_name,File_data from catfile_list where fid=" + fid);
			while (rs.next()) {
				fd = new FileInfomation();
				fd.setFilename(rs.getString("File_name"));
				Blob blb = (Blob) rs.getBlob("File_data");

				fd.setInputStream(blb.getBinaryStream());
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return fd;
	}

	public static boolean DeleteFile(int fid) {
		boolean flag = false;

		Connection con = makeConnection();
		String sql = "delete from catfile_list where fid=" + fid;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			int i = ps.executeUpdate();
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

	public static usrDetails getEmailPassByID(int id) {
		usrDetails u = new usrDetails();
		Connection con = makeConnection();
		try {
			ResultSet rs = con.createStatement().executeQuery("select email,pass from tmccuserdetails where id=" + id);
			while (rs.next()) {
				u = new usrDetails();
				u.setEmail(rs.getString("email"));
				u.setPass(rs.getString("pass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	public static Category setCategory(String cat) {
		Category c = null;
		String catdb;
		Connection con = makeConnection();
		ResultSet rs;
		try {
			rs = con.createStatement().executeQuery("select cat_name from Category");

			while (rs.next()) {
				catdb = rs.getString("cat_name");
				if (catdb.equals(cat)) {
					c.setCat_name(catdb);
				} else {
					c.setCat_name(cat);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;

	}

	public static boolean updateRequest(Request rq) {
		boolean flag = false;
		Connection con = makeConnection();
		String sql = "Update RequestUserToAdmin set RequestStatus=? where UserId=? and CatId=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, rq.getRequestStatus());
			ps.setInt(2, rq.getUserId());
			ps.setInt(3, rq.getCatId());
			int i = ps.executeUpdate();
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

	public static boolean addRequest(Request rq) {
		boolean flag = false;
		Connection con = makeConnection();
		String sql = "insert into RequestUserToAdmin(UserId,CatId,RequestStatus) values(?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, rq.getUserId());
			ps.setInt(2, rq.getCatId());
			ps.setString(3, rq.getRequestStatus());
			int i = ps.executeUpdate();
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

	public static boolean addCategory(Category c) {
		boolean flag = false;
		Connection con = makeConnection();
		int i = 0;
		try {
			String sql = "insert into categoryfile(cat_name) values(?)";
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setString(1, c.getCat_name());

			i = pstm.executeUpdate();

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

	public static boolean deleteCategory(Category c) {
		boolean flag = false;
		Connection con = makeConnection();
		int i = 0;
		try {
			String sql = "delete from categoryfile where catid=?";
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setInt(1, c.getId());

			i = pstm.executeUpdate();

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

	public static boolean deleteFilesfromCategory(Category c) {
		boolean flag = false;
		Connection con = makeConnection();
		int i = 0;
		try {
			String sql = "delete from catfile_list where catid=?";
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setInt(1, c.getId());

			i = pstm.executeUpdate();

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

	public static AdminDetails getAdminDetails(int id) {
		AdminDetails u = null;
		Connection con = makeConnection();
		try {
			ResultSet rs = con.createStatement().executeQuery("select * from tmccAdmincode where id=" + id);

			while (rs.next()) {
				u = new AdminDetails();
				u.setCode(Integer.parseInt(rs.getString("vcode")));

				System.out.println("vcode" + rs.getString("vcode"));
				u.setAd_Name(rs.getString("Adminname"));

				u.setPass(rs.getString("pass"));
				u.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return u;

	}

	public static usrDetails getEmailPass(String email, String pass) {
		usrDetails u = new usrDetails();

		Connection con = makeConnection();
		try {
			ResultSet rs2 = con.createStatement()
					.executeQuery("select * from tmccUserDetails where email='" + email + "' and pass='" + pass + "'");
			System.out.println("select * from tmccUserDetails where email='" + email + "' and pass='" + pass + "'");
			while (rs2.next()) {

				u.setId(rs2.getInt("id"));

				u.setEmail(rs2.getString("email"));
				u.setPass(rs2.getString("pass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return u;

	}

	public static AdminDetails getAdminEmailPass(String email, String pass) {
		AdminDetails u = new AdminDetails();

		Connection con = makeConnection();
		try {
			ResultSet rs2 = con.createStatement()
					.executeQuery("select * from tmccAdminDetails where email='" + email + "' and pass='" + pass + "'");
			System.out.println("select * from tmccAdminDetails where email='" + email + "' and pass='" + pass + "'");
			while (rs2.next()) {

				u.setId(rs2.getInt("id"));
				u.setAd_Name(rs2.getString("AdminName"));
				u.setEmail(rs2.getString("email"));
				u.setPass(rs2.getString("pass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return u;

	}

	public static Category getCatName(int cid) {
		Category c = null;

		Connection con = makeConnection();
		String sql = "Select cat_name from category where catid=?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Category();
				c.setCat_name(rs.getString(1));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return c;

	}

	public static Request chkRequestStatus(Request rq) {
		Request rq2 = null;

		Connection con = makeConnection();
		String sql = "select RequestStatus from RequestUserToAdmin where UserId=? and catId=? ";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, rq.getUserId());
			ps.setInt(2, rq.getCatId());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				rq2 = new Request();
				rq2.setRequestStatus(rs.getString(1));

				System.out.println("request status" + rq2.getRequestStatus());

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rq2;
	}*/

	/*public static ArrayList<Request> getPermissionRequest() {
		ArrayList<Request> al = new ArrayList<Request>();
		Connection con;
		con = makeConnection();
		try {
			String sql = "select uid,fname,groupname,RequestStatus from RequestUserToAdmin where requeststatus='Requested' or requeststatus='Rejected'";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			Request rq = null;
			while (rs.next()) {
				rq = new Request();
				rq.setReqID(rs.getInt(1));
				rq.setUserId(rs.getInt(2));
				rq.setCatId(rs.getInt(3));
				rq.setRequestStatus(rs.getString(4));
				al.add(rq);
			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

		return al;
	}

	public static ArrayList<FileInfomation> getFileDetailsList(int id) {
		ArrayList<FileInfomation> v = new ArrayList<FileInfomation>();
		Connection conn;
		try {
			conn = makeConnection();
			String sql = "select fid,File_name,catid from Catfile_list where aid=?";
			// String sql = "select cl.fid,cl.File_name,cl.catid,c.cat_name from
			// Catfile_list cl innerjoin categoryfile c on cl.catid=c.catid and
			// cl.aid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			FileInfomation fd = null;
			while (rs.next()) {
				{
					fd = new FileInfomation();
					fd.setFID(rs.getInt(1));
					fd.setFilename(rs.getString(2));
					fd.setCatid(rs.getInt(3));
					// fd.setCatname(rs.getString(4));
					v.add(fd);

				}

			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}

	public static ArrayList<FileInfomation> getFileDetailsListUser(int id) {
		ArrayList<FileInfomation> v = new ArrayList<FileInfomation>();
		Connection conn;
		try {
			conn = makeConnection();
			String sql = "select fid,File_name,catid from Catfile_list where catid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			FileInfomation fd = null;
			while (rs.next()) {
				{
					fd = new FileInfomation();
					fd.setFID(rs.getInt(1));
					fd.setFilename(rs.getString(2));
					fd.setCatid(rs.getInt(3));
					v.add(fd);

				}

			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}

	public static AdminDetails getAdminDetails1(int id) {
		AdminDetails u = null;
		Connection con = makeConnection();
		try {
			ResultSet rs2 = con.createStatement().executeQuery("select * from tmccAdminDetails where id=" + id);
			System.out.println("select * from tmccAdminDetails where id=" + id);
			while (rs2.next()) {
				u = new AdminDetails();

				u.setAd_Name(rs2.getString("AdminName"));

				u.setEmail(rs2.getString("email"));
				u.setPass(rs2.getString("pass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return u;

	}

	public static int getMaxCode() {
		int id = 0;
		Connection con = makeConnection();
		try {
			ResultSet rs = con.createStatement().executeQuery("select max(id) as id  from tmcccode ");
			while (rs.next()) {
				id = rs.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return id;

	}

	public static int getMaxCodeBEcode() {
		int id = 0;
		Connection con = makeConnection();
		try {
			ResultSet rs = con.createStatement().executeQuery("select max(id) as id  from tmccadmincode ");
			while (rs.next()) {
				id = rs.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return id;

	}

	public static int getMaxId() {
		int id = 0;
		Connection con = makeConnection();
		try {
			ResultSet rs1 = con.createStatement().executeQuery("select max(id) as id  from tmccuserdetails ");
			while (rs1.next()) {
				id = rs1.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return id;

	}

	public static int getMaxIdAdmin() {
		int id = 0;
		Connection con = makeConnection();
		try {
			ResultSet rs1 = con.createStatement().executeQuery("select max(id) as id  from tmccadmindetails ");
			while (rs1.next()) {
				id = rs1.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return id;

	}

	public static void main(String[] args) {

		getAllcategory();

	}

	public static Boolean getCat(String catname) {
		boolean flag = false;
		Connection con = makeConnection();
		String sql = "select *from categoryfile where cat_name='" + catname + "'";
		Statement st = null;
		ResultSet rs = null;

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				flag = true;
			}
			System.out.println("flag in database" + flag);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public static AdminDetails getEmail(String email) {
		AdminDetails admin = new AdminDetails();
		Connection con = makeConnection();
		String sql = "select *from  tmccadmindetails where email='" + email + "'";
		System.out.println(sql);
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()){
				admin.setId(rs.getInt("id"));
			admin.setEmail(rs.getString("email"));
			admin.setPass(rs.getString("pass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return admin;
	}
	public static usrDetails getEmailToUser(String email) {
		usrDetails admin = new usrDetails();
		Connection con = makeConnection();
		String sql = "select *from  tmccuserdetails where email='" + email + "'";
		System.out.println(sql);
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()){
				admin.setId(rs.getInt("id"));
			admin.setEmail(rs.getString("email"));
			admin.setPass(rs.getString("pass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return admin;
	}
*/
	
	
	public static boolean addDigitalSignature(Signature sg) {
		boolean flag = false;
		Connection con = makeConnection();

		try {
			String sql1 = "insert into BLSSignature(bls,uid) values(?,?)";
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

	public static usrDetails getEmailPassByID(int id) {
		usrDetails u = new usrDetails();
		Connection con = makeConnection();
		try {
			ResultSet rs = con.createStatement().executeQuery("select email,pass from userregister where uid=" + id);
			while (rs.next()) {
				u = new usrDetails();
				u.setEmail(rs.getString("email"));
				u.setPass(rs.getString("pass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	
	
}
