package com.web.member_25.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service   //登入後呼叫
public class SpringUserService implements UserDetailsService {
    @Autowired
    private AppUserService appUserService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
        	 AppUser appUser = appUserService.getUserByEmail(username);
             List<SimpleGrantedAuthority> authorities = appUser.getAuthorities().stream()
                     .map(auth -> new SimpleGrantedAuthority(auth.name()))
                     .collect(Collectors.toList());

             return new User(appUser.getEmailAddress(), appUser.getPassword(), authorities);
        } catch (NotFoundException e) {
            throw new UsernameNotFoundException("帳號名稱錯誤  Username is wrong.");
        }
    }
}