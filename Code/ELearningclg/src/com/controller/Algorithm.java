package com.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Formatter;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;

import com.mysql.cj.util.Base64Decoder;

public class Algorithm {

	public static char[] password;
	public static byte[] salt;
	public static byte[] initializationVector = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

	public Algorithm() {
		this.password = "Some string as password".toCharArray();
		try {
			this.salt = "Some string as salt".getBytes("UTF-8");
			// Note: initializationVector should be of length 16 bytes

			// this.initializationVector = "Some string of length 16
			// bytes".getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		Algorithm aes = new Algorithm();
		// Pass the plaintext file and location of the encrypted file as command
		// line arguments
		// aes.encrypt(new File(args[0]), new File(args[1]));
		//File f1 = new File("E:/aIEEE/Final2018/TSSM Omkar Godse/TSSM Documents_NEW/FileOperation/NewFiles/plain.txt");
		//File f2 = new File("E:/aIEEE/Final2018/TSSM Omkar Godse/TSSM Documents_NEW/FileOperation/NewFiles/enc.txt");
		//File f3 = new File("E:/aIEEE/Final2018/TSSM Omkar Godse/TSSM Documents_NEW/FileOperation/NewFiles/decrypt.txt");

		/*
		 * aes.encrypt(f1,f2); aes.decrypt(f2,f3);
		 */
		// encrypt(f1);

	}

	public static File encrypt(File item) {
		// File encryptedLicenceFile=new
		// File("E:/kasnetProject/FileOperation/demo/encryptedLicenceFile"+".txt");

		System.out.println("in encryptn function");

		//File encryptedLicenceFile = new File("C:\\Users\\KasNet-9\\Desktop\\final selected cloud computing\\MY DOC 2019\\Group data sharing\\Towards_MerkleFiles\\"  + item.getName());
		
		File encryptedLicenceFile = new File("C:\\HEMANT\\27_Jan_2020\\HEMANT_BACKUP\\e-learning\\ELearningclg\\WebContent\\Towards_MerkleFiles\\"  + item.getName());
		if (encryptedLicenceFile.exists() == false) {
			try {
				encryptedLicenceFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// To read the file to be encrypted
		FileInputStream fileInputStream = null;

		// To write the encrypted file
		FileOutputStream fileOutputStream = null;

		// To read the file information and to encrypt
		CipherInputStream cipherInputStream = null;
		try {
			fileInputStream = new FileInputStream(item);
			fileOutputStream = new FileOutputStream(encryptedLicenceFile);

			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			if (salt == null)
				new Algorithm();
			System.out.println("salt : " + salt);
			KeySpec keySpec = new PBEKeySpec(password, salt, 65536, 128);

			SecretKey secretKey = keyFactory.generateSecret(keySpec);
			SecretKey secret = new SecretKeySpec(secretKey.getEncoded(), "AES");

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			IvParameterSpec ivParameterSpec = new IvParameterSpec(initializationVector);
			cipher.init(Cipher.ENCRYPT_MODE, secret, ivParameterSpec);
			cipherInputStream = new CipherInputStream(fileInputStream, cipher);

			int read;
			while ((read = cipherInputStream.read()) != -1) {
				fileOutputStream.write((char) read);
			}
			System.out.println("done encryption");

			fileOutputStream.flush();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fileInputStream != null) {
					fileInputStream.close();
				}
				if (cipherInputStream != null) {
					cipherInputStream.close();
				}
				if (fileOutputStream != null) {
					fileOutputStream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return encryptedLicenceFile;
	}

	
	static File fileProcessor(File inputFile,File outputFile){
		 try {
			 
			 String key = "sdfsfsddfdsdfddf";
			 
			 
			 
		       Key secretKey = new SecretKeySpec(key.getBytes(), "AES");
		       Cipher cipher = Cipher.getInstance("AES");
		       cipher.init(Cipher.DECRYPT_MODE, secretKey);

		      
		       
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
		return outputFile;
		 
		 
		
	     }
	
	
	
	public static File decrypt(File plainTextFile,String filename) {
		
		//File encryptedLicenceFile = new File("C:\\Users\\KasNet-9\\Desktop\\final selected cloud computing\\MY DOC 2019\\Group data sharing\\decryptedLicenceFile"+ ".txt,.docx");
		
		/*File encryptedLicenceFile = new File("C:\\HEMANT\\27_Jan_2020\\HEMANT_BACKUP\\e-learning\\ELearningclg\\WebContent\\decryptedLicenceFile\\"+filename);
           System.out.println("ala ka re");
           System.out.println("File"+encryptedLicenceFile);
		if (encryptedLicenceFile.exists() == false) {
			try {
				encryptedLicenceFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
*/
		// To read the file to be encrypted
		FileInputStream fileInputStream = null;

		// To write the encrypted file
		FileOutputStream fileOutputStream = null;

		// To read the file information and to encrypt
		CipherInputStream cipherInputStream = null;
		try {
			
			
			fileInputStream = new FileInputStream(plainTextFile);
			/*fileOutputStream = new FileOutputStream(encryptedLicenceFile);*/

			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			if (salt == null)
				new Algorithm();
			KeySpec keySpec = new PBEKeySpec(password, salt, 65536, 128);

			SecretKey secretKey = keyFactory.generateSecret(keySpec);
			SecretKey secret = new SecretKeySpec(secretKey.getEncoded(), "AES");

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			IvParameterSpec ivParameterSpec = new IvParameterSpec(initializationVector);
			cipher.init(Cipher.DECRYPT_MODE, secret, ivParameterSpec);
			//encryptedLicenceFile = new File("C:\\Users\\kasnet\\Downloads\\decryptedLicenceFile"+ ".txt");
			cipherInputStream = new CipherInputStream(fileInputStream, cipher);

			/*int read;
			while ((read = cipherInputStream.read()) != -1) {
				fileOutputStream.write((char) read);
			}

			fileOutputStream.flush();
*/
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		} finally {
			/*try {
				if (fileInputStream != null) {
					fileInputStream.close();
				}
				if (cipherInputStream != null) {
					cipherInputStream.close();
				}
				if (fileOutputStream != null) {
					fileOutputStream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}*/
		}
	    System.out.println("ala ka re  TUUUUUUUUUUUUUUU" );
		/*return encryptedLicenceFile;*/
	    
	  return plainTextFile;
	}
	/*
	 * 
	 * void decrypt(File encryptedFile,File decryptedFile ) { FileInputStream
	 * fileInputStream = null;
	 * 
	 * // To write decrypted file
	 * 
	 * 
	 * // To read encrypted file and decrypt it CipherOutputStream
	 * cipherOutputStream = null; ByteArrayOutputStream byteArrayOutputStream =
	 * null; try { fileInputStream = new FileInputStream(encryptedFile);
	 * byteArrayOutputStream = new ByteArrayOutputStream();
	 * 
	 * SecretKeyFactory factory =
	 * SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1"); KeySpec keySpec = new
	 * PBEKeySpec(password, salt, 65536, 128);
	 * 
	 * SecretKey secretKey = factory.generateSecret(keySpec); SecretKey secret =
	 * new SecretKeySpec(secretKey.getEncoded(), "AES");
	 * 
	 * Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	 * 
	 * IvParameterSpec ivParameterSpec = new
	 * IvParameterSpec(initializationVector);
	 * 
	 * cipher.init(Cipher.DECRYPT_MODE, secret, ivParameterSpec);
	 * 
	 * cipherOutputStream = new CipherOutputStream(byteArrayOutputStream,
	 * cipher); byte[] buffer = new byte[4096];
	 * 
	 * int read; while ((read = fileInputStream.read(buffer)) != -1) {
	 * cipherOutputStream.write(buffer, 0, read); }
	 * 
	 * if (cipherOutputStream != null) { //Unless you close here you won't get
	 * complete plain text cipherOutputStream.close(); }
	 * 
	 * //The byte[] now can be used to obtain the cleartext byte[] plainText =
	 * byteArrayOutputStream.toByteArray();
	 * 
	 * 
	 * 
	 * 
	 * } catch (NoSuchAlgorithmException e) { e.printStackTrace(); } catch
	 * (NoSuchPaddingException e) { e.printStackTrace(); } catch
	 * (InvalidKeySpecException e) { e.printStackTrace(); } catch
	 * (InvalidKeyException e) { e.printStackTrace(); } catch
	 * (FileNotFoundException e) { e.printStackTrace(); } catch (IOException e)
	 * { e.printStackTrace(); } catch (InvalidAlgorithmParameterException e) {
	 * e.printStackTrace(); } finally { try { if (fileInputStream != null) {
	 * fileInputStream.close(); } if (cipherOutputStream != null) {
	 * cipherOutputStream.close(); }
	 * 
	 * 
	 * } catch (IOException e) { e.printStackTrace(); } }
	 * 
	 * }
	 */

	public static String sha1File(File file) throws NoSuchAlgorithmException, IOException {
		final MessageDigest messageDigest = MessageDigest.getInstance("SHA1");

		try (InputStream is = new BufferedInputStream(new FileInputStream(file))) {
			final byte[] buffer = new byte[1024];
			for (int read = 0; (read = is.read(buffer)) != -1;) {
				messageDigest.update(buffer, 0, read);
			}
		}

		// Convert the byte to hex format
		try (Formatter formatter = new Formatter()) {
			for (final byte b : messageDigest.digest()) {
				formatter.format("%02x", b);
			}
			System.out.println("hash of file" + file + "is==>" + formatter.toString());
			return formatter.toString();
		}
	}

}
