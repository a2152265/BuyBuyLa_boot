package com.web.member_25.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;



@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService{
	
	
	
	MemberService memberService;
	ServletContext servletContext; // get pic用
	@Autowired
	public MyUserDetailsService(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	} 
	
	
	@Override
	public UserDetails loadUserByUsername(String s)throws UsernameNotFoundException{
		
		//在這裡加上去DB找出帳密的方法 -> 我的memberService
		int loginResult = 0; 
		//登入結果   // 0錯誤 1成功 2無帳號 3重複帳號(除了自己+的應該不會出現這個可能)
		loginResult = memberService.loginByEmail(s);
		
		if (loginResult==0||loginResult==2||loginResult==3) {  //認證失敗時
			throw new UsernameNotFoundException("用戶不存在");
		}
		//成功就去挖資料
		membershipInformationBean mb=memberService.findMemberDataAll(s);
		
		//加上配置
		List<GrantedAuthority> auths=AuthorityUtils.commaSeparatedStringToAuthorityList("role");
		//認證成功返回 email 和pwd
		return new User(mb.getUserEmail(),new BCryptPasswordEncoder().encode(mb.getUserPwd()),auths);
	}
	
	

}
