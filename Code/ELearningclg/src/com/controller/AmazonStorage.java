package com.controller;

import java.io.File;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AmazonStorage {
	/*public static String bucketName = "firstbucketforpatil";
	public static String keyName = null;
	private static String uploadFileName = null;
	private static String accessKey = "AKIAII7IFZBKURS2DF2Q";
	private static String secretKey = "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";
	static boolean flag = false;
	*/
	public static String bucketName = "vaibhavstorage12";
	public static String keyName = null;
	private static String uploadFileName = null;
	private static String accessKey = "AKIAJTAXW3RUXW2PSINA";
	private static String secretKey = "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";
	static boolean flag = false;
	static Boolean uploadFile(String UPLOAD_DIRECTORY,File f1,String name)
	{
		
		try
		{
			keyName=name;
			uploadFileName=UPLOAD_DIRECTORY+"encoded\\"+name;
			AWSCredentials credentials=new BasicAWSCredentials(accessKey, secretKey);
			AmazonS3 s3client = new AmazonS3Client(credentials);
			File f=new File(uploadFileName);
			
			s3client.putObject(new PutObjectRequest(bucketName, keyName, f1));	
			System.out.println("done123");
			flag=true;
			
		}
		catch(AmazonServiceException aws)
		{
			System.out.println("Error massage"+aws.getMessage());
		}
		catch(AmazonClientException ace)
		{
			System.out.println("Error massage client "+ace.getMessage());
		}
		return flag;
		
	}
	static Boolean downloadFile(String keyName,String filepath)
	{
		
		try
		{
			AWSCredentials credentials=new BasicAWSCredentials(accessKey, secretKey);			
			AmazonS3 s3client = new AmazonS3Client(credentials);
				
			s3client.getObject(
			        new GetObjectRequest(bucketName, keyName),
			        new File(filepath+keyName)
			);

			
			flag=true;
			System.out.println("file downloded from s3 "+flag);
		}
		catch(AmazonServiceException aws)
		{
			System.out.println("Error massage "+aws.getMessage());
		}
		catch(AmazonClientException ace)
		{
			System.out.println("Error massage client "+ace.getMessage());
		}
		return flag;
		
	}
	
	static boolean deleteFile(String filenm,String rn)
	{
		boolean flag=false;
		AWSCredentials credentials = new BasicAWSCredentials(accessKey,secretKey);
		AmazonS3 s3Client = new AmazonS3Client(credentials);
	        try {
	        	keyName=filenm;
	            s3Client.deleteObject(new DeleteObjectRequest(bucketName, keyName));
	            System.out.println("delete done");
	            flag=true;
	        } catch (AmazonServiceException ase) {
	            System.out.println("Caught an AmazonServiceException.");
	            System.out.println("Error Message:    " + ase.getMessage());
	            System.out.println("HTTP Status Code: " + ase.getStatusCode());
	            System.out.println("AWS Error Code:   " + ase.getErrorCode());
	            System.out.println("Error Type:       " + ase.getErrorType());
	            System.out.println("Request ID:       " + ase.getRequestId());
	        } catch (AmazonClientException ace) {
	            System.out.println("Caught an AmazonClientException.");
	            System.out.println("Error Message: " + ace.getMessage());
	        }
		return flag;
		
	}
}



