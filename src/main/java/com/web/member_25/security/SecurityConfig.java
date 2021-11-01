package com.web.member_25.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
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
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		//自定義404page
		http.exceptionHandling().accessDeniedPage("/member_25/error404.jsp");
		
		
		http.formLogin()  //自定義的登入葉面
			.loginPage("/member_25/loginpage") //登入葉面配置
			.loginProcessingUrl("/user/login") //登入地址
			.defaultSuccessUrl("/").permitAll()  //登入成功後的跳轉葉面
			.and().authorizeRequests()
				.antMatchers("/","test/hello","/try/login","/user/login","/member_25/loginpage").permitAll() //那些路徑訪問不用登入
				//設定權限s
//				.antMatchers("/try/member_Ui","member_25/loginpage").hasAuthority("member")	  //1.單個權限腳色
//				.antMatchers("/try/member_Ui").hasAnyAuthority("memberm,manager")   //2.多個腳色權限
//				.antMatchers("/try/member_Ui").hasRole("member")    //3.ROLE_member 腳色才可查看
				.antMatchers("/member_25/member_Ui").hasAnyRole("member","manager")    //4.ROLE_member或ROLE_manager 腳色才可查看
				
				.anyRequest().authenticated()
			.and().csrf().disable(); //關閉csrf防護
	}
	
}

