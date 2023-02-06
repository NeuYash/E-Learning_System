package com.algorithm;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

public class Crypto {

   public static void fileProcessor(int cipherMode,File inputFile,String outputFile){
	 try {
		 
		 String key = "This is a secret";
		 
		 
	       Key secretKey = new SecretKeySpec(key.getBytes(), "AES");
	       Cipher cipher = Cipher.getInstance("AES");
	       cipher.init(cipherMode, secretKey);

	       FileInputStream inputStream = new FileInputStream(inputFile);
	       byte[] inputBytes = new byte[(int) inputFile.length()];
	       inputStream.read(inputBytes);

	       byte[] outputBytes = cipher.doFinal(inputBytes);

	       FileOutputStream outputStream = new FileOutputStream(outputFile);
	       outputStream.write(outputBytes);

	       inputStream.close();
	       outputStream.close();

	    } catch (NoSuchPaddingException | NoSuchAlgorithmException 
                     | InvalidKeyException | BadPaddingException
	             | IllegalBlockSizeException | IOException e) {
		e.printStackTrace();
            }
     }
	
     public static void main(String[] args) {
	//String key = "This is a secret";
	File inputFile = new File("C:\\Users\\KasNet-9\\Desktop\\decrypt\\enc\\personal or Sensitive Information Hiding for Secure Cloud Storage.pdf");
	File encryptedFile = new File("C:\\Users\\KasNet-9\\Desktop\\decrypt\\enc\\demo");
	//File decryptedFile = new File("C:\\Users\\KasNet-9\\Desktop\\decrypt\\enc\\decrypted-docx.docx");
/*	File decryptedFile = new File("C:\\Users\\KasNet-9\\Desktop\\decrypt\\enc\\demo.pdf");
*/	  String filename="demo.pdf";
	String filePath1="C:\\HEMANT\\27_Jan_2020\\HEMANT_BACKUP\\e-learning\\ELearningclg\\WebContent\\decryptedLicenceFile\\"+filename;
	try {
	     //Crypto.fileProcessor(Cipher.ENCRYPT_MODE,inputFile,encryptedFile);
	     Crypto.fileProcessor(Cipher.DECRYPT_MODE,encryptedFile,filePath1);
	     System.out.println("Sucess");
	 } catch (Exception ex) {
	     System.out.println(ex.getMessage());
             ex.printStackTrace();
	 }
     }
	
}