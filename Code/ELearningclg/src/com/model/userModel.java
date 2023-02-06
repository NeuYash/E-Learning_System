
	package com.model;

	public class userModel {
		
		String FirstName;
		String LastName;
		String Gender;
		String MobileNo;
		String EmailID;
		String UserName;
		String Password;
		String Dept;
		int access;
		public int getAccess() {
			return access;
		}


		public void setAccess(int access) {
			this.access = access;
		}


		boolean isFollowing;
		private int id;
		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public boolean isFollowing() {
			return isFollowing;
		}


		public void setFollowing(boolean isFollowing) {
			this.isFollowing = isFollowing;
		}


		public String getFirstName() {
			return FirstName;
		}


		public void setFirstName(String firstName) {
			FirstName = firstName;
		}


		public String getLastName() {
			return LastName;
		}


		public void setLastName(String lastName) {
			LastName = lastName;
		}


		public String getGender() {
			return Gender;
		}


		public void setGender(String gender) {
			Gender = gender;
		}


		public String getMobileNo() {
			return MobileNo;
		}


		public void setMobileNo(String mobileNo) {
			MobileNo = mobileNo;
		}


		public String getEmailID() {
			return EmailID;
		}


		public void setEmailID(String emailID) {
			EmailID = emailID;
		}


		public String getUserName() {
			return UserName;
		}


		public void setUserName(String userName) {
			UserName = userName;
		}


		public String getPassword() {
			return Password;
		}


		public void setPassword(String password) {
			Password = password;
		}

		
		
		public String getdept() {
			return Dept;
		}


		public void setdept(String dept) {
			Dept = dept;
		}
		
		
		//Method for adding details
		/*public boolean addDeatils()
		{
			boolean flag=false;
			flag=DataAccessLayer.addUser(this);
			return flag;
		}
		
		public int checkLogin()
		{
			int id=0;
		//	String username=null;
			id=DataAccessLayer.checkLogin(this);
			return id;
		}*/
		
	}


