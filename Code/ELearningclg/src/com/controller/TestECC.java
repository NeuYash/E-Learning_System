package com.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.Security;
import java.security.Signature;
import java.security.SignatureException;
import java.security.spec.ECGenParameterSpec;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.KeyAgreement;

public class TestECC {
    public static void main(String args[]) throws NoSuchAlgorithmException, NoSuchProviderException, InvalidAlgorithmParameterException, InvalidKeyException, UnsupportedEncodingException, SignatureException {
    	
    	    KeyPairGenerator  kpg = KeyPairGenerator.getInstance("EC","SunEC");

    	    ECGenParameterSpec  ecsp = new ECGenParameterSpec("sect163k1");
    	    kpg.initialize(ecsp);

    	    KeyPair kp = kpg.genKeyPair();
    	    PrivateKey privKey = kp.getPrivate();
    	    PublicKey pubKey = kp.getPublic();
    	   
    	    Signature ecdsa;
    	    ecdsa = Signature.getInstance("SHA1withECDSA","SunEC");
    	    ecdsa.initSign(privKey);

    	    String text = "In teaching others we teach ourselves";
    	   
    	    byte[] baText = text.getBytes("UTF-8");

    	    ecdsa.update(baText);
    	    System.out.println(baText);
    	    byte[] baSignature = ecdsa.sign();
    	    String bls=(new BigInteger(1, baSignature).toString(16)).toUpperCase();
    	    System.out.println(" Signature : "+bls);

    	    Signature signature = Signature.getInstance("SHA1withECDSA","SunEC");
    	    signature.initVerify(pubKey);
    	    signature.update(baText);
    	   
    	   
    	     	   
    }
}