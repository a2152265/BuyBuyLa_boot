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
		web.ignoring().antMatchers("/public/**");
        web.ignoring().antMatchers("/static/**");
        web.ignoring().antMatchers("/static/css/**");
        web.ignoring().antMatchers("/static/images/**");
        web.ignoring().antMatchers("/static/img/**");
        web.ignoring().antMatchers("/static/js/**");
        web.ignoring().antMatchers("/static/vendors/**");
        web.ignoring().antMatchers("/static/vendors/bootstrap/**");
        web.ignoring().antMatchers("/static/vendors/fontawesome/**");
        web.ignoring().antMatchers("/static/vendors/jquery/**");
        web.ignoring().antMatchers("/static/vendors/linericon**");
        web.ignoring().antMatchers("/static/vendors/nice-select/**");
        web.ignoring().antMatchers("/static/vendors/owl-carousel/**");
        web.ignoring().antMatchers("/static/vendors/themify-icons/**");
        web.ignoring().antMatchers("/global/**");
        
        web.ignoring().antMatchers("/vendors/**");
        web.ignoring().antMatchers("/css/**");
        web.ignoring().antMatchers("/img/**");
        web.ignoring().antMatchers("img/**");
        web.ignoring().antMatchers("/images/**");
        web.ignoring().antMatchers("/js/**");
        
        //跑版區
        web.ignoring().antMatchers("/Home/**");
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
		http.logout().logoutUrl("/try/logout").logoutSuccessUrl("/try/logoutSuccess").permitAll();
		//自訂login
		http.formLogin()     //自訂login
		
			.loginPage("/try/login")   //登入地址
			.loginProcessingUrl("/try/login")  //登入後跳到哪個controller 路徑
			.usernameParameter("userEmail")///登入表單form中使用者名稱輸入框input的name名，不修改的話預設是username
            .passwordParameter("userPwd")//form中密碼輸入框input的name名，不修改的話預設是password
			.defaultSuccessUrl("/",true).permitAll()  //登入後跳轉到哪個路徑
			
			.and().authorizeRequests() //定義那些需要保護那些不需要
				  .requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll() //允許靜態資源
		
				  //不需要權限區------------------------------------
				  //靜態資源區
				  .antMatchers("/","/homeLa","/try/login","/index","../src/main/resources/static/**").permitAll()
				  .antMatchers("../static/**","/resources/**","/products/**").permitAll()
				  .antMatchers("/static/css/**","/static/images/**","/static/img/**","/static/js/**","/static/vendors/**").permitAll()
				  //product_11
				  .antMatchers("/products/**","/product/**","/categoryList/**","/getPicture/**","/comment/**").permitAll()
				  //member_25
				  .antMatchers("/try/login/**","/try/add/**").permitAll()
				  //cart_30
				  .antMatchers("/xxx/xxx","/xxx/xxx").permitAll()
				  //forum_32
				  .antMatchers("/xxx/xxx","/xxx/xxx").permitAll()
				  //cele_36
				  .antMatchers("/xxx/xxx","/xxx/xxx").permitAll()
				  //不需要權限區------------------------------------
				  
				  
				  			  
				  
				  //需要權限區member---------------------------------
//				  .antMatchers("/try/member_Ui","/member_25/member_Ui").hasAuthority("member") //需要member權限才能登陸
				  	//product_11
				  .antMatchers("/xxx/xxx").hasRole("member") //需要ROLE_membe才能訪問
				  	//member_25
//				  .antMatchers("/try/member_Ui","/member_25/member_Ui").hasRole("member") //需要ROLE_membe才能訪問
//				  .antMatchers("/try/member_Ui","/member_25/member_Ui").hasAnyAuthority("member","manager")
				  .antMatchers("/try/member_Ui").hasAnyRole("manager","member")
				  	//cart_30
				  .antMatchers("/xxx/xxx").hasRole("member") //需要ROLE_member才能訪問
				  	//forum_32
				  .antMatchers("/xxxx/xxx").hasRole("member") //需要ROLE_member才能訪問
				  	//cele_36
				  .antMatchers("/xxx/xxx").hasRole("member") //需要ROLE_member才能訪問
				  //需要權限區member---------------------------------
				  
				  
				  
				  //需要權限區-------管理員---------------------------------
				  	//product_11
				  .antMatchers("/xxx/xxx").hasRole("manager") //需要ROLE_manager才能訪問
				  	//member_25
				  .antMatchers("/xxx/xxx").hasRole("manager") //需要ROLE_manager才能訪問
				  	//cart_30
				  .antMatchers("/xxx/xxx").hasRole("manager") //需要ROLE_manager才能訪問
				  	//forum_32
				  .antMatchers("/xxx/xxx").hasRole("manager") //需要ROLE_manager才能訪問
				  	//cele_36
				  .antMatchers("/xxx/xxx").hasRole("manager") //需要ROLE_manager才能訪問
				  //需要權限區-------管理員---------------------------------
				  
				  
			.anyRequest().authenticated()
			.and().csrf().disable();   			
	}
}
