package com.web.member_25.func.security_v2;

import java.util.List;

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
public class MyUserDetailService implements UserDetailsService{
	
	@Autowired
	private MemberService memberService;
	
	
	@Override   //根據用戶名作的操作
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//要連上SQL的話就在這邊做login判斷
		System.out.println("username-----userDetail--------->"+username);
		int result=0;
		membershipInformationBean mb=new membershipInformationBean();
		result=	memberService.loginByEmail(username);
		if (result==1) {
			System.out.println("-userDetail成功登入---");
			 mb=memberService.findMemberDataAll(username);
		}else {
			System.out.println("userDetail--------錯誤--->"+result);
			throw new UsernameNotFoundException("userDetail 帳號不存在!!!!!!");
		}
		
		
		
		
		List<GrantedAuthority> auths=AuthorityUtils.commaSeparatedStringToAuthorityList("role");
		//DB返回的帳密+ 腳色-->role
		return new User(mb.getUserEmail(), new BCryptPasswordEncoder().encode(mb.getUserPwd()), auths);
	}
	

}
