package com.controller;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import com.model.UserTestInfo;

public class MachResult {

	public static int getResult(Map<Integer, String> answerlist, Map<Integer, UserTestInfo> dblist) {
		int sum = 0;
		Set<Integer> list = dblist.keySet();

		for (Integer i : list) {
			
System.out.println("inside");
			if (answerlist.get(i).equals(dblist.get(i).getAnswer())) {
				sum = sum + 1;
			}

		}
		System.out.println("marks=="+sum);

		return sum;
		
	}
	
	
	public static void main(String[] args) {
		
	}

}
