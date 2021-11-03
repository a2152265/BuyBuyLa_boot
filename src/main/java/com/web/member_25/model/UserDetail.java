package com.web.member_25.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="UserDetail")
public class UserDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Column(name="userEmail")
	String userEmail;
	@Column(name="userPhone")
	String userPhone;
	@Column(name="userPwd")
	String userPwd;
	
	@Column(name="username")
	String username;
	
	
	@Column(name="userNickname")
	String userNickname;
	@Column(name="userGender")
	String userGender;
	@Column(name="address")
	String address;
	@Column(name="Identification")
	String Identification;
	
	@Column(name="head_shot")
	Blob head_shot;
	@Column(name="fileName")
	String  fileName;
	
	@Column(name="birthday")
	String birthday;
	
	@Column(name="notes")
	String notes;
	
	//verify 驗證碼
	@Column(name="verifyCode")
	Integer verifyCode;
	
	
	public UserDetail() {
		
	}
	
	@Transient
	String userPwd1;
	
	@Transient
	int VerificationCode;
	
	//-----------------上傳'檔案(船幾個就要有幾份)-------------------------------
		@Transient  //@Transient告訴spring要忽略  我們自己要用來裝圖片的
		private MultipartFile  productImage;  //jsp中 form:input 的path屬性

		public MultipartFile getProductImage() {
		    return productImage;
		}

		public void setProductImage(MultipartFile productImage) {
		    this.productImage = productImage;
		}
		
		
		

		public UserDetail(Integer id, String userEmail, String userPhone, String userPwd,
				String username, String userNickname, String userGender, String address, String identification,
				Blob head_shot, String fileName, String birthday, String notes, Integer verifyCode, String userPwd1,
				int verificationCode, MultipartFile productImage) {

			this.id = id;
			this.userEmail = userEmail;
			this.userPhone = userPhone;
			this.userPwd = userPwd;
			this.username = username;
			this.userNickname = userNickname;
			this.userGender = userGender;
			this.address = address;
			Identification = identification;
			this.head_shot = head_shot;
			this.fileName = fileName;
			this.birthday = birthday;
			this.notes = notes;
			this.verifyCode = verifyCode;
			this.userPwd1 = userPwd1;
	
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getUserEmail() {
			return userEmail;
		}

		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}

		public String getUserPhone() {
			return userPhone;
		}

		public void setUserPhone(String userPhone) {
			this.userPhone = userPhone;
		}

		public String getUserPwd() {
			return userPwd;
		}

		public void setUserPwd(String userPwd) {
			this.userPwd = userPwd;
		}

		public String getUsename() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getUserNickname() {
			return userNickname;
		}

		public void setUserNickname(String userNickname) {
			this.userNickname = userNickname;
		}

		public String getUserGender() {
			return userGender;
		}

		public void setUserGender(String userGender) {
			this.userGender = userGender;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getIdentification() {
			return Identification;
		}

		public void setIdentification(String identification) {
			Identification = identification;
		}

		public Blob getHead_shot() {
			return head_shot;
		}

		public void setHead_shot(Blob head_shot) {
			this.head_shot = head_shot;
		}

		public String getFileName() {
			return fileName;
		}

		public void setFileName(String fileName) {
			this.fileName = fileName;
		}

		public String getBirthday() {
			return birthday;
		}

		public void setBirthday(String birthday) {
			this.birthday = birthday;
		}

		public String getNotes() {
			return notes;
		}

		public void setNotes(String notes) {
			this.notes = notes;
		}

		public Integer getVerifyCode() {
			return verifyCode;
		}

		public void setVerifyCode(Integer verifyCode) {
			this.verifyCode = verifyCode;
		}

		public String getUserPwd1() {
			return userPwd1;
		}

		public void setUserPwd1(String userPwd1) {
			this.userPwd1 = userPwd1;
		}

		public int getVerificationCode() {
			return VerificationCode;
		}

		public void setVerificationCode(int verificationCode) {
			VerificationCode = verificationCode;
		}
		
		
		
		
		
		
		
		

}