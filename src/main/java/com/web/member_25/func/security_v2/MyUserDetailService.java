package com.web.member_25.func.security_v2;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

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
			
			
			//拿密碼
			 HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		        String password = request.getParameter("userPwd"); // get from request parameter
		        System.out.println("password---登入實---->"+password);
			//加密
			BCryptPasswordEncoder encoder1 = new BCryptPasswordEncoder(); 
			System.out.println("-userDetail成功登入---pwdencode>"+new BCryptPasswordEncoder().encode(mb.getUserPwd()));
			boolean isPasswordMatches = encoder1.matches(password,mb.getUserPwd());
			System.out.println("--密碼比對-------------->"+isPasswordMatches);
			
			
			if (isPasswordMatches==true) {
				System.out.println("------------密碼驗證成功 準備登入月球");
				if (memberService.memberOrManager(username)==false) {
					mb.setUserName("管理員");
					//設定一下腳色 -->manager
					auths=AuthorityUtils.commaSeparatedStringToAuthorityList("manager,ROLE_manager");
					System.out.println("這傢伙是管員<-----------------------");
				}
				
				//設定一下腳色 --> member
				auths=AuthorityUtils.commaSeparatedStringToAuthorityList("member,ROLE_member");
				//DB返回的帳密+ 腳色-->role
				return new User(mb.getUserEmail(), mb.getUserPwd(), auths);	
			}
			
			
			
		}else {
			System.out.println("userDetail--------錯誤--->"+result);
			auths=AuthorityUtils.commaSeparatedStringToAuthorityList("customer");
			throw new UsernameNotFoundException("userDetail 帳號不存在!!!!!!");
		}
		//設定一下腳色 --> member
		auths=AuthorityUtils.commaSeparatedStringToAuthorityList("member,ROLE_member");
		return new User(mb.getUserEmail(), mb.getUserPwd(), auths);
	}
	

}
