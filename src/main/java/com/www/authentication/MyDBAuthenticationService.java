package com.www.authentication;

import com.www.entity.Role;
import com.www.entity.User;
import com.www.repository.RoleRepository;
import com.www.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MyDBAuthenticationService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username);

        if (user == null) {
            throw new UsernameNotFoundException("User " //
                    + username + " was not found in the database");
        }

        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();

        for (Role role: user.getRoles()) {
            grantList.add(new SimpleGrantedAuthority(role.getName()));
        }

        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;

        UserDetails userDetails = (UserDetails) new org.springframework.security.core.userdetails.User(user.getEmail(), //
                user.getPassword(), enabled, accountNonExpired, //
                credentialsNonExpired, accountNonLocked, grantList);

        return userDetails;
    }
}
