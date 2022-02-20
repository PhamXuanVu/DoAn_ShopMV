package com.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.www.entity.SanPham;
import com.www.repository.DanhMucRepository;
import com.www.repository.SanPhamRepository;

@Controller
@Transactional
@EnableWebMvc
@RequestMapping("/danhmuc")
public class SanPhamController {

	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@Autowired
	private DanhMucRepository danhMucRepository;
	
	@RequestMapping(value="/{id}")
	public String getSanPhamByLoaiKeo(@PathVariable int id,Model model ) {
		model.addAttribute("danhMucSP", sanPhamRepository.getSanPhamByDanhMucId(id));
		
		return "danh-muc-san-pham";
	}
	
	@RequestMapping(value="/san-pham-admin/{id}")
	public String getSanPhamByLoaiKeoAdmin(@PathVariable int id,Model model) {
		model.addAttribute("danhMucSPAdmin", sanPhamRepository.getSanPhamByDanhMucId(id));
		return "/admin/danh-sach-san-pham";
	}
}
