package com.web.member_25.func;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	 @Autowired  //這邊就是實作userDetailsService的自己寫的springuser去搞拉
	    private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		 http
         .authorizeRequests()
         .antMatchers(HttpMethod.GET, "/**").authenticated() //get所有呼叫方須授權
         .antMatchers(HttpMethod.GET).permitAll()
         .antMatchers(HttpMethod.POST, "/").permitAll() //post可存取不用授權
         .anyRequest().authenticated()  //對剩下的做定義 有驗證的才可
         .and()
         .csrf().disable()  //csrf防護關閉 這樣才不會擋住前端請求
         .formLogin();    //它內建的登入
		 
		 //「*」：代表0到多個字元。如「/products/*」適用於「/products」、「/products/123」，但不適用「/products/123/draft」
		 //「**」：代表0到多個路徑。如「/products/**」適用於「/products」底下任何路徑。
		 //「?」：代表一個字元。如「/products/?*」適用於「/products/1」、「/products/123」，但不適用「/products」。
    }
	
	
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userDetailsService)  //傳入
                .passwordEncoder(new BCryptPasswordEncoder());  //加密密碼
    }

}
