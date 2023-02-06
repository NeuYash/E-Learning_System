package com.model;

import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

public class FileDetails {
	String FileID,filename,cloudbucket,cloudkeyname,securekey,path,categoryname;
	String hashval;
	List<InputStream> items;
	public List<InputStream> getItems() {
		return items;
	}

	public void setItems(List<InputStream> items) {
		this.items = items;
	}

	Blob file_data;
	InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	byte[] filecontent;
	public byte[] getFilecontent() {
		return filecontent;
	}

	public void setFilecontent(byte[] filecontent) {
		this.filecontent = filecontent;
	}

	public void setFile_data(Blob file_data) {
		this.file_data = file_data;
	}

	public Blob getFile_data() {
		return file_data;
	}

	
	public String getHashval() {
		return hashval;
	}

	public void setHashval(String hashval) {
		this.hashval = hashval;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	int Uid;
	
	
	
	public String getFileID() {
		return FileID;
	}

	public void setFileID(String fileID) {
		FileID = fileID;
	}

	public int getUid() {
		return Uid;
	}

	public void setUid(int uid2) {
		Uid = uid2;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	

	public String getCloudbucket() {
		return cloudbucket;
	}

	public void setCloudbucket(String cloudbucket) {
		this.cloudbucket = cloudbucket;
	}

	public String getCloudkeyname() {
		return cloudkeyname;
	}

	public void setCloudkeyname(String cloudkeyname) {
		this.cloudkeyname = cloudkeyname;
	}

	public String getSecurekey() {
		return securekey;
	}

	public void setSecurekey(String securekey) {
		this.securekey = securekey;
	}
}

