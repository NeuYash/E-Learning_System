package com.algorithm;

import java.security.KeyPairGenerator;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.KeyFactory;
import java.security.spec.EncodedKeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.security.spec.InvalidKeySpecException;
import java.security.NoSuchAlgorithmException;

import com.sun.jersey.core.util.Base64;

public class Cryptography {
	public static String generateKeys(String keyAlgorithm, int numBits) {
		String private_key = null;
		try {
			// Get the public/private key pair
			KeyPairGenerator keyGen = KeyPairGenerator.getInstance(keyAlgorithm);
			keyGen.initialize(numBits);
			KeyPair keyPair = keyGen.genKeyPair();
			PrivateKey privateKey = keyPair.getPrivate();
			PublicKey publicKey = keyPair.getPublic();

			System.out.println("\n" + "Generating key/value pair using " + privateKey.getAlgorithm() + " algorithm");

			// Get the bytes of the public and private keys
			byte[] privateKeyBytes = privateKey.getEncoded();
			byte[] publicKeyBytes = publicKey.getEncoded();

			// Get the formats of the encoded bytes
			String formatPrivate = privateKey.getFormat(); // PKCS#8
			String formatPublic = publicKey.getFormat(); // X.509

			private_key = Base64.encode(String.valueOf(privateKeyBytes)).toString();

			System.out.println("Private Key : " + Base64.encode(String.valueOf(privateKeyBytes)));
			System.out.println("Public Key : " + Base64.encode(String.valueOf(publicKeyBytes)));

			// The bytes can be converted back to public and private key objects
			KeyFactory keyFactory = KeyFactory.getInstance(keyAlgorithm);
			EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
			PrivateKey privateKey2 = keyFactory.generatePrivate(privateKeySpec);

			EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(publicKeyBytes);
			PublicKey publicKey2 = keyFactory.generatePublic(publicKeySpec);

			
		} catch (InvalidKeySpecException specException) {
			System.out.println("Exception");
			System.out.println("Invalid Key Spec Exception");
		} catch (NoSuchAlgorithmException e) {
			System.out.println("Exception");
			System.out.println("No such algorithm: " + keyAlgorithm);
		}
		return private_key;

	}

}
