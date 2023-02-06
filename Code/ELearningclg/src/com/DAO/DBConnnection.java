package com.DAO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.imageio.ImageIO;


import com.model.*;




public class DBConnnection {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/elearn?autoReconnect=true&useSSL=false";
	static final String USER = "root";
	static final String PASS = "root";

	public static Connection makeConnection() {
		java.sql.Connection con = null;
		try {
			Class.forName(JDBC_DRIVER);
			con =DriverManager.getConnection(DB_URL , USER, PASS);
        //con = DriverManager.getConnection(DB_URL, USER, PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (Connection) con;

	}
	
	
	
	
	/**************************************User Details*************************************************************/
	public static ArrayList<userModel> getuser(int uid)
	{
		
		ArrayList<userModel> list=new ArrayList<userModel>();
		Connection con = makeConnection();
		int i = 0;
		try {
			System.out.println("AArraa  raha hai test Info");
			String sql = "SELECT * FROM userregister where uid='"+uid+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				userModel info=new userModel();
			/*	info.setTestid(rs.getInt("testid"));*/
				info.setFirstName(rs.getString("fname").toUpperCase());
				info.setLastName(rs.getString("lname").toUpperCase());
				info.setdept(rs.getString("dept"));
				list.add(info);
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	 
	
	
	
	
	
	
	
	
	
	
	
	

	public static List<Exam_details> getqunattestdata(int tid)
	{
		System.out.println("hiiiiiiiiiiiiiiii");
		List<Exam_details> list=new ArrayList<Exam_details>();
		Connection con = makeConnection();
		int i = 0;
		try {
			String sql = "select * from chiledtest where tid='"+tid+"' ";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				Exam_details obj=new Exam_details();
				obj.setQ_no(rs.getInt("qno"));
				obj.setQue(rs.getString("question"));
				obj.setA(rs.getString("option1"));
				obj.setB(rs.getString("option2"));
				obj.setC(rs.getString("option3"));
				obj.setD(rs.getString("option4"));
				obj.setCorrectAns(rs.getString("answer"));
				//obj.setMarks(rs.getInt("marks"));
				list.add(obj);
				
			}
			System.out.println(list);
			System.out.println("oooo"+list.get(0).getQue());
			System.out.println("fiftth"+list.get(5).getQ_no());
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
	
	
	public static List<Exam_details> get_ans_qunattestdata()
	{
		System.out.println("hiiiiiiiiiiiiiiii");
		List<Exam_details> list=new ArrayList<Exam_details>();
		Connection con = makeConnection();
		int i = 0;
		try {
			System.out.println("\n in db");
			String sql = "select * from chiledtest";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				Exam_details obj=new Exam_details();
				//Testinfo info=new Testinfo();
				obj.setQ_no(rs.getInt("qno"));
		//	System.out.println(obj.getQ_no());
				obj.setQue(rs.getString("question"));
				obj.setA(rs.getString("option1"));
				obj.setB(rs.getString("option2"));
				obj.setC(rs.getString("option3"));
				obj.setD(rs.getString("option4"));
				obj.setCorrectAns(rs.getString("answer"));
				//obj.setMarks(rs.getInt("marks"));
				System.out.println("correctAns="+obj.getCorrectAns());
				list.add(obj);
				//Object request;
				
				
			}
		/*	System.out.println(list);
			System.out.println("oooo"+list.get(0).getQue());
			System.out.println("fiftth"+list.get(5).getQ_no());
			System.out.println("CorrectAns="+list.get(0).getCorrectAns());*/
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public static int quant_marks_save(Exam_details obj)
	{ int i=0;
		System.out.println(" DB..Marks=="+obj.getMarks());
	
		Connection con=makeConnection();
		try
		{
			
		//	Exam_details obj=new Exam_details();
		
			//StudentDetails obj=new StudentDetails();
			System.out.println("hiiiiiiiiiiiiiiiiiii");
			String sql="insert into test(s_id1,q_marks)values(?,?)";
			
			PreparedStatement ps=con.prepareStatement(sql);
			//ps.seInt(1,marks);
			System.out.println("-------ADD Marks-------");
			
			ps.setInt(1,obj.getS_id());
			ps.setInt(2,obj.getMarks());
			
			System.out.println("\n marks==="+obj.getMarks());
			System.out.println("\n S_id===="+obj.getS_id());
			


i=ps.executeUpdate();

	}catch(Exception e)
		{
		e.printStackTrace();
		}
		return i;
		}
	
	
	public static List<UserTestInfo> getMCQdata(int tid)
	{
		System.out.println("++++++++++++++++IN DB CONNECTION++++++++++++++");
		List<UserTestInfo> list=new ArrayList<UserTestInfo>();
		Connection con = makeConnection();
		int i = 0;
		try {
			//System.out.println("AArraa  raha hai");
			String sql = "select qno,question,option1,option2,option3,option4,answer from chiledtest where tid='"+tid+"';";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				UserTestInfo obj=new UserTestInfo();
				obj.setQid(rs.getInt("qno"));
				obj.setQname(rs.getString("question"));
				obj.setOption1(rs.getString("option1"));
				obj.setOption2(rs.getString("option2"));
				obj.setOption3(rs.getString("option3"));
				obj.setOption4(rs.getString("option4"));
				obj.setAnswer(rs.getString("answer"));
				//obj.setMarks(rs.getInt("marks"));
				list.add(obj);
				
			}
			System.out.println(list);
			System.out.println("oooo"+list.get(0).getQid());
			System.out.println("fiftth"+list.get(5).getQid());
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	public static List<String> getsubject()
	{
		List<String> sname=new ArrayList<String>();
		Connection con = makeConnection();
		int i = 0;
		try {
			//System.out.println("AArraa  raha hai");
			String sql = "select sname from subject";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				sname.add(rs.getString("sname")); 	
				
			}
			//System.out.println(sname);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return sname;
		
	}
	
	
	public static List<Testinfo> getTestName1(int teachid)
	{
		
		List<Testinfo> list=new ArrayList<Testinfo>();
		Connection con = makeConnection();
		int i = 0;
		try {
			//System.out.println("AArraa  raha hai");
			String sql = "select * from alltest where teacherid='"+teachid+"' ";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				Testinfo info=new Testinfo();
				info.setTestid(rs.getInt("testid"));
				info.setTeacherid(rs.getInt("teacherid"));
				info.setTname(rs.getString("testname"));
				info.setCtime(rs.getString("CreateTime"));
				info.setCdate(rs.getString("CreateDate"));
				
				list.add(info);
			}
			//System.out.println(sname);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public static List<TeacherInfo> gettestdata()
	{
		
		List<TeacherInfo> list=new ArrayList<TeacherInfo>();
		Connection con = makeConnection();
		int i = 0;
		try {
			System.out.println("AArraa  raha hai");
			String sql = "select * from teacherregistration";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				TeacherInfo info=new TeacherInfo();
				info.setTid(rs.getInt("id"));
				info.setTeacherfname(rs.getString("fname"));
				info.setTeacherlname(rs.getString("lname"));
				info.setEmail(rs.getString("email"));
				info.setPassword(rs.getString("password"));
				info.setNumber(rs.getString("number"));
				info.setGender(rs.getString("gender"));
				info.setDate(rs.getString("date"));

				
				list.add(info);
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public static List<Testinfo> gettestdata1(int teachid)
	{
		
		List<Testinfo> list=new ArrayList<Testinfo>();
		Connection con = makeConnection();
		int i = 0;
		try {
			System.out.println("AArraa  raha hai test Info");
			String sql = "SELECT * FROM alltest where teacherid='"+teachid+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				Testinfo info=new Testinfo();
				info.setTestid(rs.getInt("testid"));
				info.setTeacherid(rs.getInt("teacherid"));
				info.setTname(rs.getString("testname"));
				info.setCtime(rs.getString("CreateTime"));
				info.setCdate(rs.getString("CreateDate"));
			
				list.add(info);
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	public static ArrayList<Testinfo> gettestdata5()
	{
		
		ArrayList<Testinfo> list=new ArrayList<Testinfo>();
		Connection con = makeConnection();
		int i = 0;
		try {
			System.out.println("Aarraa  raha hai test Info");
			String sql = "SELECT * FROM alltest ";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				Testinfo info=new Testinfo();
				info.setTestid(rs.getInt("testid"));
				/*info.setTeacherid(rs.getInt("teacherid"));*/
				info.setTname(rs.getString("testname"));
				info.setCtime(rs.getString("CreateTime"));
				info.setCdate(rs.getString("CreateDate"));
			    info.setDept(rs.getString("dept"));
				list.add(info);
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public static List<SaveTest> gettestQuestion()
	{
		
		List<SaveTest> list1=new ArrayList<SaveTest>();
		Connection con = makeConnection();
		try {
			
			String sql = "select qno,question,answer from chiledtest";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				SaveTest info=new SaveTest();
				info.setQno(rs.getInt("qno"));
				info.setQuestion(rs.getString("question"));
				info.setAnswer(rs.getString("answer"));
				
				
				list1.add(info);
			}
			//System.out.println(sname);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list1;
		
	}
	
	
	
	
	
	
	public static int getTestQuestionCount(int tid)
	{
		
     	Connection con = makeConnection();
		int count = 0;
		try {
			//System.out.println("AArraa  raha hai");
			String sql = "select count(*) from chiledtest where tid="+tid;
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				count=rs.getInt(1);
				
			}
			//System.out.println(sname);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	
	
	
	public static int createTest(SaveTest s)
	{
		
		Connection con = makeConnection();
		int flage=0;
		try {
			//testid, teacherid, testname, CreateTime, CreateDate
			String sql ="insert into alltest(teacherid,testname,CreateTime,CreateDate) values(?,?,?,?)";
			
		    PreparedStatement st=con.prepareStatement(sql);
			 st.setInt(1,s.getUid());
			 st.setString(2,s.getTname());
			 st.setString(3,s.getTime());
			 st.setString(4,s.getDate());
			 flage=st.executeUpdate();
	        
			 System.out.println("CreateTable sucessfully");
 
	        
	        
								
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	 return flage;	
	}
	
	
	public static int getTesttId() {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		int id=0;		
			String sql = "select * from alltest order by testid desc limit 0,1";	
		
			try {
				pstm = con.prepareStatement(sql);
				ResultSet rs=pstm.executeQuery();
				
				while(rs.next())
				{
				id=rs.getInt("testid");	
					
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			} 
			
			return id;
			
		}
		
	
	
	
	public static int saveTest(SaveTest s)
	{
		
		Connection con = makeConnection();
		int i=0;
		
		try {
			String sql ="insert into subject(sname,uname,date,time) values(?,?,?,?)";
		    PreparedStatement st=con.prepareStatement(sql);
		    st.setString(1,s.getTname());
		    st.setString(2,s.getUname());
		    st.setString(3, s.getDate());
		    st.setString(4, s.getTime());
			 i=st.executeUpdate();
	        System.out.println("insert sucessfully");
 
	        
	        
								
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	return i;
	}
	
	
	
	public static String getTestInfo(int id)
	{
		
		Connection con = makeConnection();
		int i=0;
		String uname="";
		try {
			String sql ="select * from teacherregistration where id=?";
		    PreparedStatement st=con.prepareStatement(sql);
		    st.setInt(1,id);
		   
			 ResultSet rs=st.executeQuery();
	        
			 while (rs.next()) {
				
				 uname=rs.getString("fname")+" "+rs.getString("lname");
				 
				 
			    }
	        
	        
								
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	return uname;
	}
	
	public static int addQuestion(SaveTest s) {

		Connection con = makeConnection();
		String test=s.getTname();
		int i = 0;
		try {
			
			String sql = "insert into chiledtest(tid,question,answer,quecategory,queindex) values(?,?,?,?,?)";
			PreparedStatement pstm = con.prepareStatement(sql);
			
			//pstm.setString(1,s.getTname()); 
			pstm.setInt(1,s.getUid());
			pstm.setString(2,s.getQuestion());
			pstm.setString(3,s.getAnswer());
			pstm.setString(4,s.getQuecategory());
			pstm.setInt(5,s.getQueindex());
			i = pstm.executeUpdate();
			
			if (i == 1)
				System.out.println("Added question in chiledtest");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
		
	
	
	
	public static int addQuestion2(int id,String question,String answer) {

		Connection con = makeConnection();
		
		int i = 0;
		try {
			
			String sql = "insert into chiledtest(tid,question,answer) values(?,?,?)";
			PreparedStatement pstm = con.prepareStatement(sql);
			
			//pstm.setString(1,s.getTname()); 
			pstm.setInt(1,id);
			pstm.setString(2,question);
			pstm.setString(3,answer);
			i = pstm.executeUpdate();
			
			if (i == 1)
				System.out.println("Added");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	
	
	
	/*public static int addQuestion() {

		Connection con = makeConnection();
		
		SaveTest s=new SaveTest();
		s.setTid("1");
		s.setQuestion("what is java");
		s.setAnswer("jhvjhvjh");
		s.setTname("english1");
		String test=s.getTname();
		
		int i = 0;
		try {
			
			String sql = "insert into "+test+"(tid,question,answer) values(?,?,?)";
			PreparedStatement pstm = con.prepareStatement(sql);
			
			//pstm.setString(1,s.getTname()); 
			pstm.setInt(1,s.getUid());
			pstm.setString(2,s.getQuestion());
			pstm.setString(3,s.getAnswer());
			
           
			i = pstm.executeUpdate();
			if (i == 1)
				System.out.println("Added");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
*/		
	
	

	

	
	public static ArrayList<String> getheading() {
		Connection con = makeConnection();
		ArrayList<String> heading=new ArrayList<>();
		PreparedStatement pstm = null;
		String sql = "select * from studynotes1";
		try {
			pstm = con.prepareStatement(sql);
			ResultSet rs=pstm.executeQuery();
			
			while(rs.next())
			{
				
				heading.add(rs.getString("heading"));	
				
			}
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
		return heading;
	}

	

	
	public static ArrayList<String> getchiledheading(int cid) {
		Connection con = makeConnection();
		ArrayList<String> heading=new ArrayList<>();
		PreparedStatement pstm = null;
		String sql = "select * from studynotes2 where cid="+cid;
		try {
			pstm = con.prepareStatement(sql);
			ResultSet rs=pstm.executeQuery();
			
			while(rs.next())
			{
				
				heading.add(rs.getString("heading"));	
				
			}
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
		System.out.println(heading);
		return heading;
	}

	
	
	
	
	
	public static Double profilePercentage(int id) {
		Double percentage=0.0;
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		String sql = "select * from userregister2 where id="+id;
		try {
			
			pstm = con.prepareStatement(sql);
			ResultSet rs=pstm.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			Double columnsNumber = (double) rsmd.getColumnCount();
			Double total=(100.0/columnsNumber); 
			System.out.println("percentage="+100.0/columnsNumber);  
			//id, fname, lname, email, password, number, gender, date, mobile, city, Qualification, TI, Department, CN, CA, PA, profile
			while(rs.next())
			{
			 if(rs.getString("fname")!=null)
			 {
				 if(!rs.getString("fname").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 
			 if(rs.getString("lname")!=null)
			 {
				 if(!rs.getString("lname").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("email")!=null)
			 {
				 if(!rs.getString("email").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("password")!=null)
			 {
				 if(!rs.getString("password").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("number")!=null)
			 {
				 if(!rs.getString("number").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("gender")!=null)
			 {
				 if(!rs.getString("gender").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("date")!=null)
			 {
				 if(!rs.getString("date").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("mobile")!=null)
			 {
				 if(!rs.getString("mobile").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("city")!=null)
			 {
				 if(!rs.getString("city").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("Qualification")!=null)
			 {
				 if(!rs.getString("Qualification").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("TI")!=null)
			 {
				 if(!rs.getString("TI").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("Department")!=null)
			 {
				 if(!rs.getString("Department").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("CN")!=null)
			 {
				 if(!rs.getString("CN").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("CA")!=null)
			 {
				 if(!rs.getString("CA").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("PA")!=null)
			 {
				 if(!rs.getString("PA").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 if(rs.getString("profile")!=null)
			 {
				 if(!rs.getString("profile").equals(""))
				 {
					 System.out.println("welcomw");
					 percentage=percentage+total;	 
					 
				 }	 
				 
			 }
			 
			 
			 percentage=percentage+total;
		 
			 System.out.println("percentage===="+percentage);
				 
				
			}
			
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
		
		return percentage;
	}

	
	
	
	public static int gettid() {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		int id=0;		
			String sql = "select * from testscore1 order by tid desc limit 0,1";	
		
			try {
				pstm = con.prepareStatement(sql);
				ResultSet rs=pstm.executeQuery();
				
				while(rs.next())
				{
				id=rs.getInt("tid");	
					
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			} 
			
			return id;
			
		}
		
	
	public static int gettestId(String testname) {
		int tid=0;
		Connection con = makeConnection();
		PreparedStatement pstm = null;		
			String sql = "select * from alltest where testname='"+testname.trim()+"'";	
		
			try {
				pstm = con.prepareStatement(sql);
				ResultSet rs=pstm.executeQuery();
				
				while(rs.next())
				{
				tid=rs.getInt("testid");	
					
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			} 
			
			return tid;
			
		}
		
	

	
	public static void addtest(int tid1,int id,String testname,String testtime,String testdate,int marks)
	{
		Connection con = makeConnection();
		
		String testdate1="2019-05-31";
		String testtime1="12:01:30";
		PreparedStatement pstm = null;
				
			String sql = "insert into testscore1(uid,tid,testname,testtime,testdate,totalmarks)values(?,?,?,?,?,?)";	
		
			try {
				pstm = con.prepareStatement(sql);
				
				pstm.setInt(1,id);
				pstm.setInt(2,tid1);
				pstm.setString(3,testname);
				pstm.setString(4,testtime);
				pstm.setString(5,testdate);
				pstm.setInt(6,marks);
				
				pstm.executeUpdate();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			} 
			
		}

		
		
	

	
	public static void addanswer(int tid,Map<Integer,String> answerlist,List<Integer> marklist) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
			
		List<Integer> qid=new ArrayList<>(answerlist.keySet());
		List<String> answer=new ArrayList<>(answerlist.values());
		
		
		 for(int i=0;i<answer.size();i++)
		 {
		
			String sql = "insert into testscore2(tid,qid,answer,marks)values(?,?,?,?)";	
		
			try {
				pstm = con.prepareStatement(sql);
				
				pstm.setInt(1,tid);
				pstm.setInt(2,qid.get(i));
				pstm.setString(3,answer.get(i));
				pstm.setInt(4,marklist.get(i));
				 	
				pstm.executeUpdate();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			} 
			
		 }
		 
		 
		}

		

	
	
	


	/*public static void addmarks(int qid,int marks) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
			
	    String sql = "update testscore2 set marks="+marks+" where qid="+qid+"";	
		
			try {
				pstm = con.prepareStatement(sql);
				
				pstm.executeUpdate();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
				

	*/
	

	
	
	/*public static int getid() {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		int uid=0;	
	    String sql = "select uid from testscore order by uid desc limit 0,1";	
		
			try {
				pstm = con.prepareStatement(sql);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
					
				uid=rs.getInt("uid");
				
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
			
		return uid;	
		
		}

*/

	
	
	
	public static Map<Integer,String> getans() {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		Map<Integer,String> list=new HashMap<>();
		int uid=0;	
	   // String sql = "select * from java";	
		 String sql = "select * from chiledtest";	
			try {
				pstm = con.prepareStatement(sql);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
					
				list.put(rs.getInt("qno"),rs.getString("answer"));
				
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
			
		return list;	
		
		}

		
	

	
	public static ArrayList<ArrayList> gettestdata(int id) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		
		ArrayList<ArrayList> list=new ArrayList();
		//HashSet<String> list=new HashSet<>();
		int uid=0;	
	    String sql = "select * from testscore1 where uid="+id;	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
					
			   ArrayList al=new ArrayList();
					
				al.add(rs.getInt("tid"));
				al.add(rs.getString("testname"));
				al.add(rs.getString("testtime"));
				al.add(rs.getString("testdate"));
				al.add(rs.getInt("totalmarks"));
				
				list.add(al);
				 
				}
				
			
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
			
			//System.out.println(list.toString());
		return list;	
		
		}

	
	
	public static List<FileInfomation> get1() {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		List<FileInfomation> list11=new ArrayList<FileInfomation>();
		try
		{
			
			
			
			con = DBConnnection.makeConnection();  
			 
		
			 
			 PreparedStatement ps=con.prepareStatement("Select * from file_info");
			 rs=ps.executeQuery();
			 while(rs.next())
			 {
				 FileInfomation u=new FileInfomation();
			     
			     u.setCatname(rs.getString("gname"));
			     u.setFilename(rs.getString("file_name"));
			     u.setDate(rs.getString("upload_date"));
			     u.setTime(rs.getString("upload_time"));
				 list11.add(u);
				 
				 
				 System.out.println(u);
			 }
			 con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list11;
	}
	
	
	
	
	
	
	
	
	
	public static List<FileInfomation> get2() {
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		List<FileInfomation> list11=new ArrayList<FileInfomation>();
		try
		{
			
			
			
			conn = DBConnnection.makeConnection();  
			 
		
			 
			 PreparedStatement ps=conn.prepareStatement("SELECT gname FROM elearn.file_info");
			 rs=ps.executeQuery();
			 while(rs.next())
			 {
				 FileInfomation u=new FileInfomation();
			     
			     u.setCatname(rs.getString("gname"));
			    
				 
			     list11.add(u);
				 System.out.println(u);
				 System.out.println("ala ka");
			 }
			 conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list11;
	}
	
	
	
	
	
	
	/*------------------------------gname count ---------------------------*/
	public static int getgname( String gname)
	{
		int count=0;
  	     Connection conn=DBConnnection.makeConnection();
  	     try {
  	     	
  	     	 System.out.println("connected");	
  	     	 PreparedStatement pstm3 = conn.prepareStatement("select count(gname) from elearn.file_info where gname='"+gname+"'");
  			ResultSet rs3=pstm3.executeQuery();
  			while( rs3.next() )
  			{
  				count=Integer.parseInt(rs3.getString(1));
  				 System.out.println(count);
  			}
  			}
  			catch (Exception e) 
  	     {
  			
  			 System.out.println("Error="+e);

  	     }
		return count;
		
		}
	
	
	public static ArrayList<ArrayList> gettestdata2(int id) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		
		ArrayList<ArrayList> list=new ArrayList();
		//HashSet<String> list=new HashSet<>();
		int uid=0;	
	    String sql = "select * from alltest where teacherid="+id;	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
					
			   ArrayList al=new ArrayList();
					
				al.add(rs.getInt("testid"));
				al.add(rs.getString("testname"));
				al.add(rs.getString("Createtime"));
				al.add(rs.getString("Createdate"));
				list.add(al);
				 
				}
				
			
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
			
			//System.out.println(list.toString());
	      	return list;	
		
		}
	
	
	
	
	
	
	
	public static ArrayList<ArrayList> gettestlist1(int id) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		
		ArrayList<ArrayList> list=new ArrayList();
		//HashSet<String> list=new HashSet<>();
		int uid=0;	
	    String sql = "select * from alltest where teacherid="+id;	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
				
					ArrayList al=new ArrayList();
			   	
					al.add(rs.getInt("testid"));
					 
					al.add(rs.getString("testname"));
				 
					list.add(al);
				}
				
			//System.out.println(list);
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
			
			//System.out.println(list.toString());
	      	return list;	
		
		}
	
	
	
	
	
	
	public static int gettotalquestion(int id) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		
		ArrayList<ArrayList> list=new ArrayList();
		//HashSet<String> list=new HashSet<>();
		int tq=0;	
	    String sql = "select count(qno) from chiledtest where tid="+id;	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				ResultSet rs=pstm.executeQuery();
				
				
				while (rs.next()) {
			
				tq=rs.getInt(1);
					
				 
				}
				
			
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
			
			//System.out.println(tq);
	      	return tq;	
		
		}
	
	
	
	
	

	public static int deletetest(int id) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
        ArrayList<ArrayList> list=new ArrayList();
		//HashSet<String> list=new HashSet<>();
		int flage=0;	
	    String sql = "delete from alltest where testid="+id;	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				flage=pstm.executeUpdate();
				
				if(flage!=0)
				{	
				System.out.println("delete sucessfully");
				}
				else
				{
					System.out.println("delete failed");
						
				}	
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
	      	return flage;	
		
		}
	
	public static int deleteQuestion(String qno) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
        ArrayList<ArrayList> list=new ArrayList();
		//HashSet<String> list=new HashSet<>();
        System.out.print("\n\nQno in database============>"+qno);
		int flage=0;	
	    String sql1 = "delete from chiledtest where qno="+qno;	
		
			try {
				
				pstm = con.prepareStatement(sql1);
				
				flage=pstm.executeUpdate();
				
				if(flage!=0)
				{	
				System.out.println("delete sucessfully");
				}
				else
				{
					System.out.println("delete failed");
						
				}	
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
	      	return flage;	
		
		}

	public static ArrayList<ArrayList> gettestquestion(int id) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
        ArrayList<ArrayList> list=new ArrayList();
		//HashSet<String> list=new HashSet<>();
		int flage=0;	
	    String sql = "select * from chiledtest where tid="+id;	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				ResultSet rs=pstm.executeQuery();
				
				while(rs.next())
				{
				ArrayList al=new ArrayList();
				
				al.add(rs.getInt("qno"));
				al.add(rs.getString("question"));
				al.add(rs.getString("answer"));
				
				list.add(al);
				}
				
				System.out.println(list);
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
	      	return list;	
		
		}
		
	
	public static int deletetestquestion(int id) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
       	int flage=0;	
	    String sql = "delete from chiledtest where qno="+id;	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				flage=pstm.executeUpdate();
				
				if(flage!=0)
				{
					System.out.println("sucess");
					
				}
				else
				{
					System.out.println("failed");
					
				}	
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
	      	return flage;	
		
		}
	
	
	
	
	
	
	
	
	
	

	
	
	
	//this method is for retriving graph chart values
	public static ArrayList<Integer> getchartcontent(int id) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;		
		
		ArrayList<Integer> list=new ArrayList<>(); 
		
		for(int i=0;i<=5;i++)
		{	
		
	    String sql = "select sum(marks) from testscore2 where tid=? and marks=?";	
		
			try {
				
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, id);
				pstm.setInt(2, i);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
			
					list.add(rs.getInt(1));
					System.out.println(rs.getInt(1));
					
				}
				
			
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} 

		
}		
		
		return list;
		//System.out.println(list);
			
		
		}


	
	
	public static ArrayList<String> gettestlist(int id) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;		
		
		ArrayList<String> list=new ArrayList<>(); 
		
		
		
	    String sql = "select testname from alltest where teacherid=?";	
		
			try {
				
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, id);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
			
					list.add(rs.getString(1));
					
				}
				
			
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} 
	
	
		

		
		return list;
		//System.out.println(list);
			
		
		}
	
	
	
	
	public static ArrayList<Integer> getquestionid(int tid) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		
		ArrayList<Integer> list=new ArrayList();
		//HashSet<String> list=new HashSet<>();
		int uid=0;	
	    String sql = "select * from testscore2 where tid="+tid;	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
					
			     list.add(rs.getInt("qid"));
					
				}
				
				//System.out.println(list);
			
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
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
			
			//System.out.println(list.toString());
		return list;	
		
		}

	
	
	
	public static ArrayList<Integer> getquestion(ArrayList<Integer> list1) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		
		ArrayList list=new ArrayList();
	
		for(int i=0;i<list1.size();i++)
		{
		int uid=0;	
	    String sql = "select * from chiledtest where qno="+list1.get(i);	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
					
			     list.add(rs.getString("question"));
					
				}
				
				//System.out.println(list);
			
					
			} catch (SQLException e) {
				
				e.printStackTrace();
			} 
		}
			
			//System.out.println(list.toString());
		return list;	
		
		}

	
	
	public static ArrayList<Integer> getanswer(ArrayList<Integer> list1,int tid) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		
		ArrayList list=new ArrayList();
	
		for(int i=0;i<list1.size();i++)
		{
		int uid=0;	
	    String sql = "select * from chiledtest where qno=? and tid=?";	
		
			try {
				
				pstm = con.prepareStatement(sql);
				pstm.setInt(1,list1.get(i));
				pstm.setInt(2,tid);
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
					
			     list.add(rs.getString("answer"));
					
				}
				
			//	System.out.println(list);
			
					
			} catch (SQLException e) {
				
				e.printStackTrace();
			} 
		}
			
			//System.out.println(list.toString());
		return list;	
		
		}

	
	
	
	public static ArrayList<Integer> getuseranswer(ArrayList<Integer> list1,int tid) {
		Connection con = makeConnection();
		PreparedStatement pstm = null;
		
		ArrayList list=new ArrayList();
	
		for(int i=0;i<list1.size();i++)
		{
		int uid=0;	
	    String sql = "select * from testscore2 where tid=? and qid=?";	
		
			try {
				
				pstm = con.prepareStatement(sql);
				
				pstm.setInt(1,tid);
				pstm.setInt(2,list1.get(i));
				
				
				ResultSet rs=pstm.executeQuery();
				
				while (rs.next()) {
					
			     list.add(rs.getString("answer"));
					
				}
				
			//	System.out.println(list);
			
					
			} catch (SQLException e) {
				
				e.printStackTrace();
			} 
		}
			
			//System.out.println(list.toString());
		return list;	
		
		}

	
	public static int checkMailForPass(String email) {

		Connection con = makeConnection();
		
		int flage = 0;
		try {
			
			String sql = "select * from teacherregister where email='"+email+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     	while(rs.next())
	     	{
	     		
	     	flage=rs.getInt(1);	
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flage;
	}
		
	
	
	public static int checkMailForPass2(String email) {

		Connection con = makeConnection();
		
		int flage = 0;
		try {
			
			String sql = "select * from userregister2 where email='"+email+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     	while(rs.next())
	     	{
	     		
	     	flage=rs.getInt(1);	
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flage;
	}
		
	
	public static String returnPassForReset(String email) {

		Connection con = makeConnection();
		
		String pass="";
		try {
			
			String sql = "select * from teacherregister where email='"+email+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     	while(rs.next())
	     	{
	     		
	     	pass=rs.getString("password");
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pass;
	}
		
	
	
	
	
	public static String returnPassForReset2(String email) {

		Connection con = makeConnection();
		
		String pass="";
		try {
			
			String sql = "select * from userregister2 where email='"+email+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     	while(rs.next())
	     	{
	     		
	     	pass=rs.getString("password");
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pass;
	}
		
	
	
	
	public static int checkPass(String email,String oldpass) {

		Connection con = makeConnection();
		
		int flage=0;
		try {
			
			String sql = "select * from teacherregister where email='"+email+"' and password='"+oldpass+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     	while(rs.next())
	     	{
	     		
	     	flage=rs.getInt(1);
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flage;
	}
	
	
	
	public static int checkPass2(String email,String oldpass) {

		Connection con = makeConnection();
		
		int flage=0;
		try {
			
			String sql = "select * from userregister2 where email='"+email+"' and password='"+oldpass+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     	while(rs.next())
	     	{
	     		
	     	flage=rs.getInt(1);
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flage;
	}
	
	
	public static int chnagepass(String email,String newpass) {

		Connection con = makeConnection();
		
		int flage=0;
		try {
			
			String sql = "update teacherregister  set password='"+newpass+"' where email='"+email+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
	     	flage= pstm.executeUpdate();
		   
	     
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flage;
	}
	
	
	
	public static int chnagepass2(String email,String newpass) {

		Connection con = makeConnection();
		
		int flage=0;
		try {
			
			String sql = "update userregister2  set password='"+newpass+"' where email='"+email+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
	     	flage= pstm.executeUpdate();
		   
	     
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flage;
	}
	
	
	
	
	public static String gettestname(int tid) {

		Connection con = makeConnection();
		
		String testname="";
		try {
			
			String sql = "select * from alltest where testid="+tid;
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     
	     	while(rs.next())
	     	{
	     		testname=rs.getString("testname");
	     		
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return testname;
	}
	
	
	
	public static int getmin(int tid) {

		Connection con = makeConnection();
		
		int min=0;
		try {
			
			String sql = "select * from chiledtest where tid=? limit 1";
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1,tid);
	     	ResultSet rs= pstm.executeQuery();
		   
	     
	     	while(rs.next())
	     	{
	     		min=rs.getInt("qno");
	     		
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return min;
	}
	
	
	public static int getmax(int tid) {

		Connection con = makeConnection();
		
		int max=0;
		try {
			
			String sql = "select * from chiledtest where tid=? order by qno desc limit 1";
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1,tid);
	     	ResultSet rs= pstm.executeQuery();
		   
	     
	     	while(rs.next())
	     	{
	     		max=rs.getInt("qno");
	     		
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
	}
	
	
	
	
	public static ArrayList<Integer> getuserid(int tid) {

		Connection con = makeConnection();
		
		ArrayList<Integer> al=new ArrayList<>();
		try {
			
			String sql = "select * from testscore1 where tid="+tid;
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     
	     	while(rs.next())
	     	{
	     		al.add(rs.getInt("uid"));
	     		
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return al;
	}
	
	
	public static ArrayList<ArrayList> getresultinfo(int tid,ArrayList<String> list1) {

		
		Connection con = makeConnection();
		ArrayList<ArrayList> al=new ArrayList<ArrayList>();
		String uname="";
		
		try {
			
			String sql = "select * from testscore1 where tid="+tid;
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     	 int temp=0;
	     
	     	while(rs.next())
	     	{
	     	
	     	ArrayList list=new ArrayList();
	     	list.add(rs.getInt("uid"));
	     	list.add(rs.getInt("tid"));
	     	list.add(rs.getString("testname"));
	     	list.add(rs.getInt("totalmarks"));
	     	
	     	if(temp<=list1.size()-1)
	     	{
	     		list.add(list1.get(temp));
	     		temp++;
	     	}	
	     	
	     	al.add(list);	
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
	
	public static String getuname(int uid) {

		Connection con = makeConnection();
		String uname="";
		int max=0;
		try {
			
			String sql = "select * from userregister2 where id="+uid;
			PreparedStatement pstm = con.prepareStatement(sql);
	     	ResultSet rs= pstm.executeQuery();
		   
	     
	     	while(rs.next())
	     	{
	     	uname=rs.getString("fname")+" "+rs.getString("lname");	
	     		
	     	}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uname;
	}
	public static void setTestInfo(int tid, int uid, Map<Integer, String> answerlist) {
        int count=0; 
		Set<Integer> keyset = answerlist.keySet();
		Connection con = DBConnnection.makeConnection();
		try {
			PreparedStatement pstm = con.prepareStatement("insert into test_info(tid,id,qno,answer) values(?,?,?,?)");

			for (Integer key : keyset) {
				pstm.setInt(1, tid);
				pstm.setInt(2, uid);
				pstm.setInt(3, key);
				pstm.setString(4, answerlist.get(key));
				pstm.executeUpdate();
				count=count+1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println(count+"  row inserted sucessfully");
	}
	
	public static void setTestResult(int tid, int uid,int result) {
        int count=0; 
		Connection con = DBConnnection.makeConnection();
		try {
			PreparedStatement pstm = con.prepareStatement("insert into test_result(tid,uid,result) values(?,?,?)");
				pstm.setInt(1, tid);
				pstm.setInt(2, uid);
				pstm.setInt(3, result);
				
				count=pstm.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println(count+"result updated sucessfully");
	}


	public static int getTestCount1(int uid,int tid)
	{
		int count=0;
  	     Connection con=DBConnnection.makeConnection();
  	     try {
  	     	
  	     	  	System.out.println("connected");	
  	       	PreparedStatement pstm3 = con.prepareStatement("select count(tid) from test_result  where uid='"+uid+"' and tid='"+tid+"';");
  			ResultSet rs3=pstm3.executeQuery();
  			while( rs3.next() )
  			{
  				count=rs3.getInt(1);
  				 System.out.println(count);
  			}
  			}
  			catch (Exception e) 
  		{
  			
  			 System.out.println("Error="+e);
  		}
		return count;
		
		}
	
	
	/*****************Test Report *******************************************/
	public static List<TestReport> getTestreport() {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		List<TestReport> list11=new ArrayList<TestReport>();
		try
		{
			
			
			
			con = DBConnnection.makeConnection();  
			 
		
			 
			 PreparedStatement ps=con.prepareStatement("select userregister.fname,userregister.lname,userregister.dept,alltest.testname,test_result.uid,count(test_result.result) as 'Total  Attempts',max(test_result.result) as 'Max Marks',min(test_result.result ) as 'Min Marks' from elearn.userregister, elearn.test_result,elearn.alltest where userregister.uid = test_result.uid and test_result.tid=alltest.testid  group by userregister.uid; ");
			 rs=ps.executeQuery();
			 while(rs.next())
			 {
				 TestReport u=new TestReport();
			     
			     /*u.setCatname(rs.getString("gname"));*/
				 u.setFname(rs.getString("fname"));	
				 u.setLname(rs.getString("lname"));
				 u.setDept(rs.getString("dept"));
				 u.setTestname(rs.getString("testname"));
				 u.setUid(rs.getInt(5));
				 u.setTotalattempts(rs.getInt(6));
				 u.setMaxmarks(rs.getInt(7));
				 u.setMinmarks(rs.getInt(8));
				 
		
				 list11.add(u);
				 
				 
				 System.out.println(u);
			 }
			 con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list11;
	}
	
	/*----------------------------------------------Test Report 2----------------------------------------------------------/
	 * 
	
	 */
	
	
	public static List<TestReport> getTestreport1(int uid) {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		List<TestReport> list11=new ArrayList<TestReport>();
		try
		{
			
			
			
			con = DBConnnection.makeConnection();  
			 
		String sql="select count(test_result.result)  as 'fail' from elearn.test_result where  uid='"+uid+"'  and test_result.result<=4 ";
			 
			 PreparedStatement ps=con.prepareStatement(sql);
			 rs=ps.executeQuery();
			 System.out.println("report "+sql);
			 while(rs.next())
			 {
				 TestReport u=new TestReport();
			     
			     
				 
				 u.setNoOfTestFailed(rs.getInt(1));
		
				 list11.add(u);
				 
				 
				 System.out.println(u);
			 }
			 con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list11;
	}
	
	/*-------------------------------------------------Test 3-----------------------------------*/
	public static List<TestReport> getTestreport2(int uid) {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		List<TestReport> list11=new ArrayList<TestReport>();
		try
		{
			
			
			
			con = DBConnnection.makeConnection();  
			 
		String sql="select count(test_result.result)  as 'pass' from elearn.test_result where  uid='"+uid+"'  and test_result.result>=4 ";
			 
			 PreparedStatement ps=con.prepareStatement(sql);
			 rs=ps.executeQuery();
			 System.out.println("report "+sql);
			 while(rs.next())
			 {
				 TestReport u=new TestReport();
			     
			     
				 
				 u.setNoOfTestPassed(rs.getInt(1));
		
				 list11.add(u);
				 
				 
				 System.out.println(u);
			 }
			 con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list11;
	}
	
	
	
	public static void main(String[] args) {
		
		System.out.println(getuserid(2));
		ArrayList al=new ArrayList();
		al.add("vaibhav");
		al.add("tushar");
		System.out.println(getresultinfo(2,al));
		
		//getanswer(list1,2);
		/*System.out.println(gettestId("english"));*/
		//getchartcontent(18);
		//deletetest(2);	
	//System.out.println(getTestQuestionCount(2));
	/*ArrayList<Integer> list=new ArrayList<>();
	list.add(1);
	list.add(3);
	list.add(4);
	list.add(5);
	list.add(6);
	list.add(10);
	
		getuseranswer(list,11);*/
		//gettestquestion(3);
		//deletetest(4);
	
		//gettestlist1(2);
		
		//gettotalquestion(4);
		
		/*ArrayList<String> list=gettestlist(2);
		System.out.println(list.toString());*/
		
		/*Retrive graph  value
	    getchartcontent(6);
       */
		
		
	/*	Map<Integer, String> map1=new HashMap<Integer,String>();
		
	   map1.put(1,"tushar");
	   map1.put(2,"sagar");
	   map1.put(3,"vaibhav");
	   map1.put(4,"Rahul");
	   map1.put(5,"yogesh");

	
	
	   Map<Integer, String> map2=new HashMap<Integer,String>(map1);

	   System.out.println("data=="+map2);
	   */
	   
	//	addmarks(16,4);
		
		
		/*int id=gettid();
		System.out.println(id);*/
		
	
		
		
	/*//ADD TEST ANSWER	
		int tid=1;
		Map<Integer, String> answerlist=new  HashMap<>();
		
		answerlist.put(13,"1umale");
		answerlist.put(14,"1patil");
		answerlist.put(15,"1sawarkar");
		answerlist.put(16,"1shete");
		
		addanswer(tid,answerlist);
		
		
	*/
		
		
		
		//gettestdata();
		
		/*Map<Integer, String> answerlist=new HashMap<>();
		
		answerlist.put(6,"vaibhav");
		answerlist.put(7,"vaibhav umale");
		answerlist.put(2,"umale");
		answerlist.put(1,"tushar");
		
		addanswer(answerlist);
		*/
		//addmarks(2,3,15);
	}
	


}