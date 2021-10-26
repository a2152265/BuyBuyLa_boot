package com.web.member_25.func;

import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;

//Validator兩個方法   support:檢查型別(是不是這個beaN的物件 否就丟例外)   validate:
public class MemberValidator implements Validator {
	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");


	MemberService memberService;
	ServletContext servletContext; // get pic用

	@Autowired
	public MemberValidator(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	}
	public  MemberValidator() {
	}
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return membershipInformationBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) { //Errors是bindingresult的父類

//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "=bean中變數=jsp的path", "識別字串",  "找不到識別字串時用這邊替代");
		//空的或空白                              
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "membershipInformationBean.userName.empty",  "必須輸入姓名欄");
		ValidationUtils.rejectIfEmpty(errors, "userPwd", "membershipInformationBean.userPwd.empty", "必須輸入密碼欄");
		ValidationUtils.rejectIfEmpty(errors, "userPwd1", "membershipInformationBean.userPwd1.empty", "必須輸入確認密碼欄");
		ValidationUtils.rejectIfEmpty(errors, "userEmail", "membershipInformationBean.userEmail.empty", "email欄不能空白");

		membershipInformationBean member = (membershipInformationBean) target;
		
//		if (member.getUserName() != null && member.getUserName().length() > 0 && member.getUserName().length() < 2 || member.getUserName().length() > 30) {
//			errors.rejectValue("userName", "memberBean.userName.size", "姓名欄至少要有兩個字元，最多不得超過30個字元");
//		}

		if (member.getUserPwd() != null && member.getUserPwd().contains(" ")) {
			errors.rejectValue("userPwd", "memberBean.userPwd.space", "密碼欄不能包含空白字元");
		}

		if (member.getUserPwd1() != null && member.getUserPwd1().contains(" ")) {
			errors.rejectValue("userPwd1", "memberBean.userPwd1.space", "確認密碼欄不能包含空白字元");
		}
		
		if (member.getUserPwd() != null && member.getUserPwd().length() > 0 && (member.getUserPwd().length() < 5 || member.getUserPwd().length() > 20)) {
			errors.rejectValue("userPwd", "memberBean.userPwd.size", "密碼欄至少要有五個字元，最多不得超過20個字元");
		}
		
		if (member.getUserPwd1() != null && member.getUserPwd1().length() > 0  && (member.getUserPwd1().length() < 5 || member.getUserPwd1().length() > 20)) {
			errors.rejectValue("userPwd1", "memberBean.userPwd1.size", "確認密碼欄至少要有五個字元，最多不得超過20個字元");
		}
		
		
		if (member.getUserPwd1() != null && member.getUserPwd() != null &&
			!member.getUserPwd1().equals(member.getUserPwd())
		) {
			errors.rejectValue("userPwd", "memberBean.userPwd.mustEqual", "密碼欄與確認密碼欄必須完全一致");
		}

		if (member.getUserEmail() != null && member.getUserEmail().length() > 0 && !EMAIL_REGEX.matcher(member.getUserEmail()).matches()) {
			errors.rejectValue("userEmail", "memberBean.userEmail.invalid", "電子郵件地址的格式不正確");
		}
		
		if (member.getUserPhone() != null && member.getUserPhone().length() > 0 && (member.getUserPhone().length() > 11 ) && (member.getUserPhone().length() < 9 )) {
			errors.rejectValue("userPhone", "memberBean.userPhone.size", "手機不正確");
		}
		//帳號判斷
		if (member.getUserPhone() != null && member.getUserPhone().length() > 0 && (member.getUserPhone().length() > 11 ) && (member.getUserPhone().length() < 9 )) {
			errors.rejectValue("userPhone", "memberBean.userPhone.size", "手機不正確");
		}
		if (memberService.overlappedAccount(member.getUserEmail())==false) {
			errors.rejectValue("userEmail", "memberBean.userPhone.size", "帳號重複");
		}

	}

}
