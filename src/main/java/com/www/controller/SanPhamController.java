package com.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.www.repository.SanPhamRepository;

@Controller
@Transactional
@EnableWebMvc
@RequestMapping("/danhmuc")
public class SanPhamController {

	@Autowired
	private SanPhamRepository sanPhamRepository;
	

 
}
