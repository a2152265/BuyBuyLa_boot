package com.web.member_25.func.security_v2;

import java.util.Set;

import org.aspectj.weaver.tools.Trace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.StaticResourceLocation;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration    //securedEnabled有哪些腳色   prePostEnabled
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true,prePostEnabled = true) 
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private UserDetailsService userDetailsService;
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailsService).passwordEncoder(password());  //指定讓這個service去取用戶名稱密碼
	
	}
	@Override
    public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
        web.ignoring().antMatchers("/static/**");
    }
	
	
	@Bean
	PasswordEncoder password() {
		return new BCryptPasswordEncoder();
	}
	
	
	@Override
	protected void configure(HttpSecurity http)  throws Exception{
		//自訂無權限錯誤葉面
		http.exceptionHandling().accessDeniedPage("/error_403");
		//登出
		http.logout().logoutUrl("/try/logout").logoutSuccessUrl("/").permitAll();
		//自訂login
		http.formLogin()     //自訂login
			.loginPage("/try/login")   //登入地址
			.loginProcessingUrl("/try/login")  //登入後跳到哪個controller 路徑
			.usernameParameter("userEmail")///登入表單form中使用者名稱輸入框input的name名，不修改的話預設是username
            .passwordParameter("userPwd")//form中密碼輸入框input的name名，不修改的話預設是password
			.defaultSuccessUrl("/").permitAll()  //登入後跳轉到哪個路徑
			
			.and().authorizeRequests() //定義那些需要保護那些不需要
				  .requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll() //允許靜態資源
		
				  //,"/member_25/member_Ui"
				  .antMatchers("/","/try/login","/index","../src/main/resources/static/**").permitAll()
				  .antMatchers("/try/login","../static/**","/resources/**").permitAll()
				  .antMatchers("/static/css/**","/static/images/**","/static/img/**","/static/js/**","/static/vendors/**").permitAll()
				  
				  
				  //設定一下權限
//				  .antMatchers("/try/member_Ui","/member_25/member_Ui").hasAuthority("member") //需要member權限才能登陸
				  .antMatchers("/try/member_Ui","/member_25/member_Ui").hasRole("member") //需要ROLE_membe才能訪問
				  .antMatchers("/try/add").hasRole("member") //需要ROLE_membe才能訪問
				  .antMatchers("/try/member_Ui","/member_25/member_Ui").hasAnyAuthority("member","manager")
				  
			.anyRequest().authenticated()
			.and().csrf().disable();   
				
	}
	
	
}
