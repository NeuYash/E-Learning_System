package com.controller;
import java.io.*;

import java.util.*;
import java.text.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/*import java.nio.charset.StandardCharsets;
import java.sql.Blob;
import java.time.LocalTime;
import java.util.Map.Entry;
import java.util.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.commons.io.*;
import org.omg.PortableServer.ServantRetentionPolicyValue;*/

import com.DAO.DataAccessLayer;
import com.model.FileInfomation;

@WebServlet("/FileUpload1")

@MultipartConfig(maxFileSize = 52428800)
public class fileupload1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static final String UPLOAD_DIRECTORY = "C:\\Users\\KasNet-9\\Desktop\\final selected cloud computing\\MY DOC 2019\\Group data sharing\\Towards_MerkleFiles\\";
	
	private static final String UPLOAD_DIRECTORY ="C:\\HEMANT\\27_Jan_2020\\HEMANT_BACKUP\\e-learning\\ELearningclg\\WebContent\\Towards_MerkleFiles\\";
	//public static List<List> CatList = new ArrayList<List>();
	public static List<String> FriendCatList = new ArrayList<String>();
	public static List<String> FamilyCatList = new ArrayList<String>();
	//public static Map<String, List<List>> CatMap = new TreeMap<String, List<List>>();
	public static List<String> hashFileList = new ArrayList<String>();
	public static List<File> encFileList = new ArrayList<File>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		
		
	
		
		String names[]=request.getParameterValues("names");	
		List<String> list=new ArrayList<>();
		
		for(int i=0;i<names.length;i++)
		{
		System.out.println("userid="+names[i]);
		list.add(names[i]);
		}	
		
		System.out.println("we are in file upload controller");	
		
		HttpSession session = request.getSession();
		int userid = Integer.parseInt(session.getAttribute("uid").toString());
		String iiii=session.getAttribute("uid").toString();
		System.out.println("iiii===="+iiii);
		list.add(iiii);
		
		List<Integer> listid=new ArrayList<>();
		for(String o:list)
		{
			listid.add(Integer.parseInt(o));
			System.out.println("allow ids===="+o);
		}
		
		String cname = (String) session.getAttribute("cname");

		String hashVal = "";
				
		ArrayList<Integer> al=DataAccessLayer.getcategoryuserid(cname);
	   
		final Part filePart = request.getPart("fileField");
		
		
		InputStream fileInputStream =filePart.getInputStream();
		//File createfile = new File("C:\\Users\\KasNet-9\\Desktop\\final selected cloud computing\\MY DOC 2019\\Group data sharing\\controllerFiles\\"+filePart.getSubmittedFileName());
		
		File createfile = new File("C:\\HEMANT\\27_Jan_2020\\HEMANT_BACKUP\\e-learning\\ELearningclg\\WebContent\\controllerFiles\\"+filePart.getSubmittedFileName());
		
		BufferedWriter wr=new BufferedWriter(new FileWriter(createfile));
		 
		BufferedReader reader = new BufferedReader(new InputStreamReader(fileInputStream));
 	    StringBuilder out1 = new StringBuilder();
 	    String line;
 	    while ((line = reader.readLine()) != null) {
 	        out1.append(line);
 	    }
 	    String str=out1.toString();
 	    System.out.println(str);
 	   wr.write(str);
 	   wr.close();
   		System.out.println("done");
 	    reader.close();
 	    
 	  // String path="C:\\Users\\KasNet-9\\Desktop\\final selected cloud computing\\MY DOC 2019\\Group data sharing\\controllerFiles\\";
 	
 	   String path="C:\\HEMANT\\27_Jan_2020\\HEMANT_BACKUP\\e-learning\\ELearningclg\\WebContent\\controllerFiles\\";
 	    File savedFile = new File(path+filePart.getSubmittedFileName());
 	    
		FileInfomation fileInfomation2 = new FileInfomation();
					try {
					
						System.out.println(filePart);
						InputStream FileBytes = null;
						FileBytes = filePart.getInputStream();
						
						final byte[] bytes = new byte[FileBytes.available()];
						FileBytes.read(bytes);
						
						System.out.println("start encrypting File");
						File encFile = Algorithm.encrypt(savedFile);
												 
						AmazonStorage.uploadFile(UPLOAD_DIRECTORY, encFile, encFile.getName());

						encFileList.add(encFile);

						hashVal = Algorithm.sha1File(encFile);

						String str2[] = curate().split(" ");
						String date1 = str2[0];
						String time1 = str2[1];

						fileInfomation2.setUid(userid);
						fileInfomation2.setCatname(cname);
						fileInfomation2.setHashvalue(hashVal);
						fileInfomation2.setFilename(filePart.getSubmittedFileName());
						fileInfomation2.setPath(path);
						fileInfomation2.setBytes(bytes);
						fileInfomation2.setTime(time1);
						fileInfomation2.setDate(date1);
						System.out.println(userid); 
						System.out.println(cname); 
						System.out.println(hashVal); 
						System.out.println(filePart.getName()); 
						System.out.println(savedFile.getPath()); 
						System.out.println(bytes); 
						System.out.println(time1); 
						System.out.println(date1); 
						
						} catch (Exception e) {
						e.printStackTrace();
					}
				
			 boolean flag=DataAccessLayer.addFileDetails2(fileInfomation2);
			int fid=0;
			 String fname=null;
			 if(flag==true)
			 {
                 fid=DataAccessLayer.getfileid();
				 fname=DataAccessLayer.getfilename(fid);
				 for(Integer o:listid)
				    {
					 DataAccessLayer.addallowuser(fid,cname,filePart.getSubmittedFileName(),o);
				    	System.out.println("user ids======fid====canem=====fname==="+o+"  "+fid+"  "+cname+"  "+filePart.getSubmittedFileName());
				    	
				    }
				 } 
			 
			if (flag==true) {
				System.out.println("success");
				PrintWriter out = response.getWriter();

				out.println("<script type=\"text/javascript\">");
				out.println("alert('File Uploaded Successfully On Cloud');");
				out.println("location='opration1.jsp';");
				out.println("</script>");
			} else {
				System.out.println("fail");
				PrintWriter out = response.getWriter();

				out.println("<script type=\"text/javascript\">");
				out.println("alert('File Upload Failed...Try again');");
				out.println("location='FrmUploadFile.jsp';");
				out.println("</script>");
			}

	}

	public static String curate() {
		
/*		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String strDate = dateFormat.format(date);
		System.out.println("Converted String: " + strDate);
*/
		LocalDateTime myDateObj = LocalDateTime.now();  
	  
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");  
	    
	    String formattedDate = myDateObj.format(myFormatObj);  
	    System.out.println("After formatting: " + formattedDate);  
		
		return formattedDate;
	}
	
}