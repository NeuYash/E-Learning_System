package com.controller;

import java.io.*;
import java.nio.file.*;

public class forfilertesting {

	public static void main(String[] args) throws IOException {

		File encryptedLicenceFile = new File("C:\\Users\\kasnet\\Desktop\\New folder\\GroupDataSharing\\WebContent\\UploadedFileMerkle\\enc.txt");
		File item=new File("C:\\Users\\kasnet\\Desktop\\New folder\\GroupDataSharing\\WebContent\\BMIForm.jsp");
		
	    BufferedReader br = new BufferedReader(new FileReader(item));
	    BufferedWriter wr=new BufferedWriter(new FileWriter(encryptedLicenceFile));
	    String st;
	    
	    while ((st = br.readLine()) != null) 
	    {
	    	wr.write(st+"\n");
	    	System.out.println(st); 
	    }
	    
	    	wr.close();
	    	System.out.println("done");

	}

}
