package com.www.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.RedirectView;

import com.www.dto.NguoiDungDTO;
import com.www.entity.NguoiDung;
import com.www.entity.Role;
import com.www.entity.User;
import com.www.repository.NguoiDungRepository;
import com.www.repository.RoleRepository;
import com.www.repository.UserRepository;

@Controller
@Transactional
@EnableWebMvc
@RequestMapping("/user")
public class UserController {
	@Autowired
	private NguoiDungRepository nguoiDungRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("/login")
	public String login() {	
	    return "login";
	}
	
	@GetMapping("/register")
	public String register() {	
	    return "register";
	}
	
	@PostMapping(value = "/register", consumes = "application/x-www-form-urlencoded")
    public RedirectView postRegister(NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            System.out.println("Co loi xay ra " + bindingResult);

            return new RedirectView(request.getContextPath() + "/user/login");
        } else {
            if (userRepository.findByEmail(nguoiDungDTO.getEmail()) == null) {
                Role role = roleRepository.findByName("ROLE_MEMBER");

                User user = new User();
                Set<Role> roles = new HashSet<>();
                roles.add(role);
                user.setRoles(roles);
                user.setEmail(nguoiDungDTO.getEmail());
                user.setPassword(passwordEncoder.encode(nguoiDungDTO.getMatKhau()));
         
                userRepository.save(user);

                NguoiDung nguoiDung = new NguoiDung();
                nguoiDung.setUser(user);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                nguoiDungRepository.save(nguoiDung);

                return new RedirectView(request.getContextPath() + "/user/login?success");
            }

            return new RedirectView(request.getContextPath() + "/user/register?failure");
        }

    }
}
