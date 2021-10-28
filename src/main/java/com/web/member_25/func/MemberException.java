package com.web.member_25.func;

public class MemberException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	
	Integer Id;
	String userEmail;
	



	public MemberException(Integer id, String userEmail) {
		Id = id;
		this.userEmail = userEmail;
	}



	public Integer getId() {
		return Id;
	}



	public void setId(Integer id) {
		Id = id;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public MemberException() {
		// 
	}

	public MemberException(String message) {
		super(message);
		
	}

	public MemberException(Throwable cause) {
		super(cause);
		// 
	}

	public MemberException(String message, Throwable cause) {
		super(message, cause);
		// 
	}

	public MemberException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// 
	}

}
