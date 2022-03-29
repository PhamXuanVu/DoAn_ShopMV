package com.www.controller;

import com.www.entity.DanhMuc;
import com.www.entity.NguoiDung;
import com.www.entity.TaiKhoan;
import com.www.repository.DanhMucRepository;
import com.www.repository.NguoiDungRepository;
import com.www.repository.UserRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class AdviceController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    
    @Autowired
    private DanhMucRepository danhMucRepository;

    @ModelAttribute("nguoiDung")
    public NguoiDung getNguoiDungLogin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        TaiKhoan taiKhoan = userRepository.findByEmail(authentication.getName());

        NguoiDung nguoiDung = nguoiDungRepository.findByTaiKhoan(taiKhoan);

        return nguoiDung;
    }
    
    @ModelAttribute("danhMuc")
    public List<DanhMuc> getDanhMucs() {
    	List<DanhMuc> danhMucs = (List<DanhMuc>) danhMucRepository.findAll();
    	return danhMucs;
    }
}
