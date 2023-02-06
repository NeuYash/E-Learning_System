package com.model;

import java.sql.Blob;

public class groupmodel {
	
String gname,totalmember,fname,lname;
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
int admin_id;
String date,ad_name;

public String getAd_name() {
	return ad_name;
}
public void setAd_name(String ad_name) {
	this.ad_name = ad_name;
}
Blob gimage;
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getGname() {
	return gname;
}
public void setGname(String gname) {
	this.gname = gname;
}
public String getTotalmember() {
	return totalmember;
}
public void setTotalmember(String totalmember) {
	this.totalmember = totalmember;
}
public int getAdmin_id() {
	return admin_id;
}
public void setAdmin_id(int admin_id) {
	this.admin_id = admin_id;
}

public Blob getGimage() {
	return gimage;
}
public void setGimage(Blob gimage) {
	this.gimage = gimage;
}
}
