package com.model;

public class TestReport {
	String fname; 
	String lname ;
	String dept; 
	String testname ;
	int totalattempts ;
	int maxmarks ;
	int minmarks ;
	int NoOfTestPassed; 
	int NoOfTestFailed ;
	int uid;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getTestname() {
		return testname;
	}
	public void setTestname(String testname) {
		this.testname = testname;
	}
	public int getTotalattempts() {
		return totalattempts;
	}
	public void setTotalattempts(int totalattempts) {
		this.totalattempts = totalattempts;
	}
	public int getMaxmarks() {
		return maxmarks;
	}
	public void setMaxmarks(int maxmarks) {
		this.maxmarks = maxmarks;
	}
	public int getMinmarks() {
		return minmarks;
	}
	public void setMinmarks(int minmarks) {
		this.minmarks = minmarks;
	}
	public int getNoOfTestPassed() {
		return NoOfTestPassed;
	}
	public void setNoOfTestPassed(int noOfTestPassed) {
		NoOfTestPassed = noOfTestPassed;
	}
	public int getNoOfTestFailed() {
		return NoOfTestFailed;
	}
	public void setNoOfTestFailed(int noOfTestFailed) {
		NoOfTestFailed = noOfTestFailed;
	}
	
}
