//package com.web.member_25.func.security;
//
//import java.util.Collections;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.LockedException;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//
//import com.web.member_25.model.membershipInformationBean;
//import com.web.member_25.service.MemberService;
//
//
////Security 機制在進行身份驗證時，會使用 UserDetails 介面的物件作為使用者詳情的載體。
////雖然設計了 AppUser 類別，但實作時仍需準備 UserDetails 的物件。
//public class UserSecurityService implements UserDetailsService{
//
////	@Autowired
////	private UserRepository userRepository;
//	@Autowired
//	private MemberService memberService;
//	@Override
//	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException{
//		
//		//自訂義bean
//		try {
//			System.out.println("------------進入loadUserByUsername");
//			membershipInformationBean mb=memberService.findMemberDataAll(userEmail);
//			System.out.println("--try-----------"+mb.getUserEmail());
//			System.out.println("--try---pa--------"+mb.getUserPwd());
//			//第三個參數是 authorities  ------>權限
//			 return new User(mb.getUserEmail(),mb.getUserPwd(), Collections.emptyList());
//		} catch (Exception e) {
//			throw new UsernameNotFoundException("Username is wrong. 無此帳號!!!");
//		}
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		//使用內建的user包型態
////		System.out.println("username------->"+name);
////		User user=userRepository.findByname(name);
////		if (user==null) {
////			User mobileUser =userRepository.findByMobile(name);
////			if (mobileUser==null) {
////				User emailUser=userRepository.findByEmail(name);
////				if (emailUser==null) {
////					throw new UsernameNotFoundException("使用者名稱,電子郵件,或手機號碼不存在");
////				}else {
////					user=userRepository.findByEmail(name);
////				}
////			}
////			//測試中
//////			else if ("locked".equals(user.getStatus())) {
//////				throw new LockedException("使用者被鎖定");
//////			}
////
////		}	
////		return user;
//		
//		
//		
//	}
//}
