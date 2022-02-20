package com.www.config;

import com.www.entity.*;
import com.www.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class DataSeendingListener implements ApplicationListener {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void onApplicationEvent(ApplicationEvent applicationEvent) {

        /*create user admin and member*/
        if (roleRepository.findByName("ROLE_ADMIN") == null) {
            Role role = new Role();
            role.setName("ROLE_ADMIN");
            roleRepository.save(role);
        }

        if (roleRepository.findByName("ROLE_MEMBER") == null) {
            Role role = new Role();
            role.setName("ROLE_MEMBER");
            roleRepository.save(role);
        }

        if (userRepository.findByEmail("admin@gmail.com") == null) {
            User user = new User();
            user.setEmail("admin@gmail.com");
            user.setPassword(passwordEncoder.encode("123456"));
            Set<Role> roles = new HashSet<>();
            roles.add(roleRepository.findByName("ROLE_ADMIN"));
            roles.add(roleRepository.findByName("ROLE_MEMBER"));
            user.setRoles(roles);

            NguoiDung nguoiDung = new NguoiDung();
            nguoiDung.setHoTenDem("Pham Xuan");
            nguoiDung.setTen("Vu");
            nguoiDung.setSoDienThoai("0999999999");
            nguoiDung.setDiaChi("12,Nguyễn Văn Bảo,P4,Gò Vấp,HCM");
            CuaHang cuaHang = new CuaHang("ShopMV"); 
            nguoiDung.setCuaHang(cuaHang);
            nguoiDung.setUser(user);

            nguoiDungRepository.save(nguoiDung);
        }
        if (userRepository.findByEmail("quynhmai@gmail.com") == null) {
            User user = new User();
            user.setEmail("quynhmai@gmail.com");
            user.setPassword(passwordEncoder.encode("123456"));
            Set<Role> roles = new HashSet<>();
            roles.add(roleRepository.findByName("ROLE_MEMBER"));
            user.setRoles(roles);

            NguoiDung nguoiDung = new NguoiDung();
            nguoiDung.setHoTenDem("Nguyen Thi Quynh");
            nguoiDung.setTen("Mai");
            nguoiDung.setSoDienThoai("0999999999");
            nguoiDung.setDiaChi("12, Nguyễn Văn Bảo,P4,Gò Vấp,HCM");
            nguoiDung.setUser(user);

            nguoiDungRepository.save(nguoiDung);
        }

    }
}
