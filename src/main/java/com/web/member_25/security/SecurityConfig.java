package com.web.member_25.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

//配置一夏usernama pwd (不是那麼的實用)
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{

//	@Override     //基礎寫死的方法
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
//		//加密
//		BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
//		String password=passwordEncoder.encode("password");
//		//設定sa 和pws 
//		auth.inMemoryAuthentication().withUser("sa").password(password).roles("admin");
//	
//	}
	
	
	//實際上使用
	@Autowired
	private UserDetailsService userDetailsService;
	//先配置
	@Override
	protected void configure(AuthenticationManagerBuilder auth)throws Exception{
		auth.userDetailsService(userDetailsService).passwordEncoder(password());
	}
	
	
	@Bean
	PasswordEncoder password() {
		return new BCryptPasswordEncoder();
	}
	
}

