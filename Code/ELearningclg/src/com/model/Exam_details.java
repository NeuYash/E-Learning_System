package com.model;

public class Exam_details {

	 private String que,a,b,c,d,correctAns;
	 private int s_id,q_no,marks;
	 
	 
		
	
	public String getA() {
		return a;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id1) {
		this.s_id = s_id1;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	public String getQue() {
		return que;
	}
	public void setQue(String que) {
		this.que = que;
	}
	/*public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}*/
	public String getCorrectAns() {
		return correctAns;
	}
	public void setCorrectAns(String correctAns) {
		this.correctAns = correctAns;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
}
