package com.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

public class randomnumber1 {
	
	
	public static int randommethod1(ArrayList<Integer> list)
	{
	
		Collections.sort(list);
		
	Random r = new Random();
	int max =list.get(list.size()-1), min =list.get(0),code =  r.nextInt((max - min) + 1) + min;
	
	System.out.println("min="+min +"  max="+max);

	System.out.println("code=="+code);
	
	return code;
	}

}
