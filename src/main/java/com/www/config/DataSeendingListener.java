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
    
    @Autowired
    private DanhMucRepository danhMucRepository;

    @Override
    public void onApplicationEvent(ApplicationEvent applicationEvent) {

        /*create user admin and member*/
        if (roleRepository.findByTenVaiTro("ROLE_ADMIN") == null) {
            VaiTro vaiTro = new VaiTro();
            vaiTro.setTenVaiTro("ROLE_ADMIN");
            roleRepository.save(vaiTro);
        }

        if (roleRepository.findByTenVaiTro("ROLE_MEMBER") == null) {
            VaiTro vaiTro = new VaiTro();
            vaiTro.setTenVaiTro("ROLE_MEMBER");
            roleRepository.save(vaiTro);
        }

        if (userRepository.findByEmail("admin@gmail.com") == null) {
            TaiKhoan taiKhoan = new TaiKhoan();
            taiKhoan.setEmail("admin@gmail.com");
            taiKhoan.setMatKhau(passwordEncoder.encode("123456"));
            taiKhoan.setVaiTro(roleRepository.findByTenVaiTro("ROLE_ADMIN"));

            NguoiDung nguoiDung = new NguoiDung();
            nguoiDung.setHoTenDem("Pham Xuan");
            nguoiDung.setTen("Vu");
            nguoiDung.setSoDienThoai("0999999999");
            nguoiDung.setDiaChi("12, Nguyễn Văn Bảo,P4,Gò Vấp,HCM");
            nguoiDung.setTaiKhoan(taiKhoan);

            nguoiDungRepository.save(nguoiDung);
        }
        if (userRepository.findByEmail("quynhmai@gmail.com") == null) {
            TaiKhoan taiKhoan = new TaiKhoan();
            taiKhoan.setEmail("quynhmai@gmail.com");
            taiKhoan.setMatKhau(passwordEncoder.encode("123456"));
            taiKhoan.setVaiTro(roleRepository.findByTenVaiTro("ROLE_MEMBER"));

            NguoiDung nguoiDung = new NguoiDung();
            nguoiDung.setHoTenDem("Nguyen Thi Quynh");
            nguoiDung.setTen("Mai");
            nguoiDung.setSoDienThoai("0999999999");
            nguoiDung.setDiaChi("12, Nguyễn Văn Bảo,P4,Gò Vấp,HCM");
            nguoiDung.setTaiKhoan(taiKhoan);

            nguoiDungRepository.save(nguoiDung);
        }
        
//        if(danhMucRepository.findByTenDanhMuc("Thời trang nam") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Thời trang nam");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        if(danhMucRepository.findByTenDanhMuc("Thời trang nữ") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Thời trang nữ");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        if(danhMucRepository.findByTenDanhMuc("Nước hoa") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Nước hoa");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        if(danhMucRepository.findByTenDanhMuc("Giày dép nam") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Giày dép nam");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        if(danhMucRepository.findByTenDanhMuc("Giày dép nữ") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Giày dép nữ");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        if(danhMucRepository.findByTenDanhMuc("Đồng hồ") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Đồng hồ");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        if(danhMucRepository.findByTenDanhMuc("Thiết bị điện tử") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Thiết bị điện tử");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        
//        if(danhMucRepository.findByTenDanhMuc("Phụ kiện điện thoại") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Phụ kiện điện thoại");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        if(danhMucRepository.findByTenDanhMuc("Sắc đẹp") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Sắc đẹp");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        if(danhMucRepository.findByTenDanhMuc("Đồ chơi") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Đồ chơi");
//        	danhMucRepository.save(danhMuc);
//        }
//        
//        if(danhMucRepository.findByTenDanhMuc("Gaming gear") == null) {
//        	DanhMuc danhMuc = new DanhMuc("Gaming gear");
//        	danhMucRepository.save(danhMuc);
//        }
        
    }
    
    
}
