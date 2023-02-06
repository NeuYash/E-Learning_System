package com.controller;

import java.util.Random;


public class randomnumber {

	
	
	
	public static int randommethod()
	{
		
	int min=1000;	
	int max=9999;
		
		
	Random r = new Random();
	
	int code = r.nextInt(max);
	//System.out.println(code);
	return code;
	
	}
	
/*	public static void main(String[] args) {
		
		randommethod();
	}*/
}
