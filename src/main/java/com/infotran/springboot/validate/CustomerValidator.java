package com.infotran.springboot.validate;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.infotran.springboot.model.CustomerBean;

//Validator兩個方法   support:檢查型別(是不是這個beaN的物件 否就丟例外)   validate:
public class CustomerValidator implements Validator {
	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");

	@Override
	public boolean supports(Class<?> clazz) {
		return CustomerBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) { //Errors是bindingresult的父類

//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "=bean中變數=jsp的path", "識別字串",  "找不到識別字串時用這邊替代");
		//空的或空白                              
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "customerBean.name.empty",  "必須輸入姓名欄");
		ValidationUtils.rejectIfEmpty(errors, "password", "customerBean.password.empty", "必須輸入密碼欄");
		ValidationUtils.rejectIfEmpty(errors, "password1", "customerBean.password1.empty", "必須輸入確認密碼欄");
		ValidationUtils.rejectIfEmpty(errors, "email", "customerBean.email.empty", "email欄不能空白");

		CustomerBean customer = (CustomerBean) target;
		
		if (customer.getName() != null && customer.getName().length() > 0 && customer.getName().length() < 2 || customer.getName().length() > 30) {
			errors.rejectValue("name", "customerBean.name.size", "姓名欄至少要有兩個字元，最多不得超過30個字元");
		}

		if (customer.getPassword() != null && customer.getPassword().contains(" ")) {
			errors.rejectValue("password", "customerBean.password.space", "密碼欄不能包含空白字元");
		}

		if (customer.getPassword1() != null && customer.getPassword1().contains(" ")) {
			errors.rejectValue("password1", "customerBean.password1.space", "確認密碼欄不能包含空白字元");
		}
		
		if (customer.getPassword() != null && customer.getPassword().length() > 0 && (customer.getPassword().length() < 5 || customer.getPassword1().length() > 30)) {
			errors.rejectValue("password", "customerBean.password.size", "密碼欄至少要有五個字元，最多不得超過30個字元");
		}
		
		if (customer.getPassword1() != null && customer.getPassword1().length() > 0  && (customer.getPassword1().length() < 5 || customer.getPassword1().length() > 30)) {
			errors.rejectValue("password1", "customerBean.password1.size", "確認密碼欄至少要有五個字元，最多不得超過30個字元");
		}
		
		
		if (customer.getPassword1() != null && customer.getPassword() != null &&
			!customer.getPassword1().equals(customer.getPassword())
		) {
			errors.rejectValue("password", "customerBean.password.mustEqual", "密碼欄與確認密碼欄必須完全一致");
		}

		if (customer.getEmail() != null && customer.getEmail().length() > 0 && !EMAIL_REGEX.matcher(customer.getEmail()).matches()) {
			errors.rejectValue("email", "customerBean.email.invalid", "電子郵件地址的格式不正確");
		}

	}

}
