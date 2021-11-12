//package com.web.member_25.func.security;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Service;
//
//@Configuration
//@EnableWebSecurity
//@EnableGlobalMethodSecurity(prePostEnabled = true)
//public class WebSecurityConfig  extends WebSecurityConfigurerAdapter{
//
//	
////	@Bean
////	UserDetailsService UserService() {
////		return new UserSecurityService();
////	}
//	@Override
//	public void configure(WebSecurity web) throws Exception{
//		web.ignoring().antMatchers("/static/**","/static/*","/static/**/**");   //不攔截靜態資源
////		auth.userDetailsService(null).passwordEncoder(new BCryptPasswordEncoder() {});
//	}
//	
//	@Bean
//	public PasswordEncoder passwordEncoder() {
//		//用BCrypt加個密
//		return new BCryptPasswordEncoder();
//	}
//	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception{
//		http.formLogin().usernameParameter("userEmail").passwordParameter("userPwd").
//		loginPage("/try/login").permitAll()
//		.defaultSuccessUrl("/").permitAll()
//						.and()
//						.authorizeRequests()  //決定哪些URL要保護那些不要
//						.antMatchers("/try/member_Ui").hasRole("ADMIN")  //index下的所有路徑只有ADMIN可以訪問
//						.antMatchers("/","/try/add","/member_25/signUpPage","/member_25/signUpPage_error","/member_25/loginpage_error").permitAll()
//						//除了上面的所有請求之外  其他全部都要驗證
//						.anyRequest().authenticated();
//			http.logout().permitAll();
//			http.rememberMe().rememberMeParameter("rememberme");
//			//處裡例外 拒絕造訪的話就給我去403
//			http.exceptionHandling().accessDeniedPage("/403");
//			http.logout().logoutSuccessUrl("/");
//			http.csrf().disable();  //先關閉csrf保護
////			http.csrf().ignoringAntMatchers("/admin/upload");
//	}
//	
//	
//	
//	
//	
////	@Override   //boot_book_ver
////	protected void configure(HttpSecurity http) throws Exception{
////		http.formLogin().usernameParameter("userEmail").passwordParameter("userPwd").
////		loginPage("/try/login").permitAll()
////		.defaultSuccessUrl("/").permitAll()
////						.and()
////						.authorizeRequests()  //決定哪些URL要保護那些不要
////						.antMatchers("/try/member_Ui").hasRole("ADMIN")  //index下的所有路徑只有ADMIN可以訪問
////						.antMatchers("/","/try/add","/member_25/signUpPage","/member_25/signUpPage_error","/member_25/loginpage_error").permitAll()
////						//除了上面的所有請求之外  其他全部都要驗證
////						.anyRequest().authenticated();
////			http.logout().permitAll();
////			http.rememberMe().rememberMeParameter("rememberme");
////			//處裡例外 拒絕造訪的話就給我去403
////			http.exceptionHandling().accessDeniedPage("/403");
////			http.logout().logoutSuccessUrl("/");
////			http.csrf().disable();  //先關閉csrf保護
//////			http.csrf().ignoringAntMatchers("/admin/upload");
////	}
//	
//	
//}
