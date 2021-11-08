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

import com.web.member_25.func.error.NotFoundException;
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
		List<GrantedAuthority> auths;
		//登入結果   // 0錯誤 1成功 2無帳號 3重複帳號(除了自己+的應該不會出現這個可能)
		result=	memberService.loginByEmail(username);
		if (result==1) {
			mb=memberService.findMemberDataAll(username);
			System.out.println("-userDetail成功登入--->"+username);
			System.out.println("-userDetail成功登入---pwd>"+mb.getUserPwd());
			BCryptPasswordEncoder encoder1 = new BCryptPasswordEncoder(); 
			System.out.println("-userDetail成功登入---pwdencode>"+new BCryptPasswordEncoder().encode(mb.getUserPwd()));
			boolean isPasswordMatches = encoder1.matches(
					mb.getUserPwd(),
					new BCryptPasswordEncoder().encode(mb.getUserPwd())
			);
			System.out.println("--密碼比對-------------->"+isPasswordMatches);
			
			
			
			if (memberService.memberOrManager(username)==false) {
				mb.setUserName("管理員");
				//設定一下腳色 -->manager
				auths=AuthorityUtils.commaSeparatedStringToAuthorityList("manager,ROLE_manager");
				System.out.println("這傢伙是管員<-----------------------");
			}
		}else {
			System.out.println("userDetail--------錯誤--->"+result);
			throw new UsernameNotFoundException("userDetail 帳號不存在!!!!!!");
		}
		
		//設定一下腳色 --> member
		auths=AuthorityUtils.commaSeparatedStringToAuthorityList("member,ROLE_member");
		//DB返回的帳密+ 腳色-->role
		return new User(mb.getUserEmail(), new BCryptPasswordEncoder().encode(mb.getUserPwd()), auths);
	}
	

}
