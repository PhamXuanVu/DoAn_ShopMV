package com.www.authentication;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.www.entity.TaiKhoan;
import com.www.entity.VaiTro;
import com.www.repository.UserRepository;

@Service
public class MyDBAuthenticationService implements UserDetailsService {

	@Autowired
	UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		TaiKhoan taiKhoan = userRepository.findByEmail(username);


		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
		grantList.add(new SimpleGrantedAuthority(taiKhoan.getVaiTro().getTenVaiTro()));

		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		UserDetails userDetails = (UserDetails) new org.springframework.security.core.userdetails.User(taiKhoan.getEmail(), //
				taiKhoan.getMatKhau(), enabled, accountNonExpired, //
				credentialsNonExpired, accountNonLocked, grantList);

		return userDetails;
	}
}
