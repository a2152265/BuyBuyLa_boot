package com.web.member_25.func.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.web.member_25.dao.UserRepository;
import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;

public class UserSecurityService implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private MemberService memberService;
	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException{
//		membershipInformationBean mb=memberService.findMemberDataAll(name);
		System.out.println("username------->"+name);
		User user=userRepository.findByname(name);
		if (user==null) {
			User mobileUser =userRepository.findByMobile(name);
			if (mobileUser==null) {
				User emailUser=userRepository.findByEmail(name);
				if (emailUser==null) {
					throw new UsernameNotFoundException("使用者名稱,電子郵件,或手機號碼不存在");
				}else {
					user=userRepository.findByEmail(name);
				}
			}
			//測試中
//			else if ("locked".equals(user.getStatus())) {
//				throw new LockedException("使用者被鎖定");
//			}

		}	
		return user;
	}
}
