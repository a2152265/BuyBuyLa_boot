package com.web.member_25.func.security_v2;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.StaticResourceLocation;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private UserDetailsService userDetailsService;
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailsService).passwordEncoder(password());  //指定讓這個service去取用戶名稱密碼
	
	}
	@Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/static/**");
    }
	
	
	@Bean
	PasswordEncoder password() {
		return new BCryptPasswordEncoder();
	}
	
	
	@Override
	protected void configure(HttpSecurity http)  throws Exception{
		http.formLogin()     //自訂login
			.loginPage("/try/login")   //登入地址
			.loginProcessingUrl("/")  //登入後跳到哪個controller 路徑
			.defaultSuccessUrl("/index").permitAll()  //登入後跳轉到哪個路徑
			.and().authorizeRequests() //定義那些需要保護那些不需要
				  .requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll() //允許靜態資源
				  .requestMatchers(PathRequest.toStaticResources().at(StaticResourceLocation.JAVA_SCRIPT)).permitAll()
				  .requestMatchers(PathRequest.toStaticResources().at(StaticResourceLocation.CSS)).permitAll()
				  .requestMatchers(PathRequest.toStaticResources().at(StaticResourceLocation.IMAGES)).permitAll()
				  .requestMatchers(PathRequest.toStaticResources().at(StaticResourceLocation.FAVICON)).permitAll()
				  .requestMatchers(PathRequest.toStaticResources().at(StaticResourceLocation.WEB_JARS)).permitAll()
				  
				  .antMatchers("/","/try/login","/index","../src/main/resources/static/**").permitAll()
				  .antMatchers("/try/member_Ui","/try/login","/index","../static/**","/resources/**").permitAll()
				  .antMatchers("/static/css/**","/static/images/**","/static/img/**","/static/js/**","/static/vendors/**").permitAll()
			.anyRequest().authenticated()
			.and().csrf().disable();   
				
	}
	
	
}
