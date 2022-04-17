package com.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.RedirectView;

import com.www.dto.SanPhamDTO;
import com.www.entity.CuaHang;
import com.www.entity.DanhMuc;
import com.www.entity.SanPham;
import com.www.repository.CuaHangRepository;
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
	
	@Autowired
	private CuaHangRepository cuaHangRepository;
	
	@GetMapping("/")
	public String getDanhMucs() {
		return "/admin/danh-muc-san-pham";
	}
	
	@GetMapping("/{id}")
	public String getSanPhamsByDanhMuc(@PathVariable int id,Model model) {
		model.addAttribute("danhMucId",id);
		model.addAttribute("danhMucSP",sanPhamRepository.getSanPhamByDanhMucId(id));
		return "/danh-muc-san-pham";
	}
	
	@RequestMapping(value="/san-pham-admin/{id}")
	public String getSanPhamBysDanhMucAdmin(@PathVariable int id,Model model) {
		model.addAttribute("danhMucSPAdmin", sanPhamRepository.getSanPhamByDanhMucId(id));
		model.addAttribute("danhMucId",id);
		return "/admin/danh-sach-san-pham";
	}
	
	@RequestMapping("/form-add-san-pham/{id}")
	public String getFormAddSanPhamAdmin(@PathVariable int id,Model model) {
		model.addAttribute("danhMucId",id);
		model.addAttribute("getTenDanhMuc",danhMucRepository.findById(id).get());
		return "/admin/form-add-san-pham";
	}

	@PostMapping(value = "/form-add-san-pham/{id}", consumes = "application/x-www-form-urlencoded")
	public RedirectView postAddSanPham(@PathVariable int id,SanPhamDTO sanPhamDTO, Model model, HttpServletRequest request) {

		SanPham sanPham = new SanPham();
		sanPham.setTenSanPham(sanPhamDTO.getTenSanPham());
		sanPham.setDonGia(sanPhamDTO.getDonGia());
		sanPham.setHinhAnh("/images/"+sanPhamDTO.getHinhAnh());
		sanPham.setMoTa(sanPhamDTO.getMoTa());
		sanPham.setSoLuong(sanPhamDTO.getSoLuong());
		CuaHang cuaHang = cuaHangRepository.findById(1).get();
		sanPham.setCuaHang(cuaHang);
		DanhMuc danhMuc = danhMucRepository.findById(id).get();
		sanPham.setDanhMuc(danhMuc);
		sanPhamRepository.save(sanPham);

		return new RedirectView(request.getContextPath() + "/danhmuc/san-pham-admin/" + id);

	}
	
//	@RequestMapping(value="/update/{id}")   
//	public String getUpdateSanPhamAdmin(@PathVariable int id, Model model) {
//		SanPham sanPham = sanPhamRepository.findById(id).get();   
//		model.addAttribute("sanPhamId",id);
//		model.addAttribute("sanPham",sanPham);
//		return "admin/form-update-sanpham";
//	}
//	
//	@RequestMapping(value="/saveUpdate/{id}",method = RequestMethod.POST)    
//	public String saveUpdateSanPhamAdmin(@PathVariable int id,@ModelAttribute("sanPham") SanPham sanPham){
//		SanPham sanPham1 = sanPhamRepository.findById(id).get();
//		sanPham1.setTenSanPham(sanPham.getTenSanPham());
//		sanPham1.setDonGia(sanPham.getDonGia());
//		sanPham1.setMoTa(sanPham.getMoTa());
//		sanPham1.setSoLuong(sanPham.getSoLuong());
//		sanPham1.setHinhAnh("/images/"+sanPham.getHinhAnh());
//		CuaHang cuaHang = cuaHangRepository.findById(1).get();
//		sanPham1.setCuaHang(cuaHang);
//		sanPhamRepository.save(sanPham1);
//		
//		return "redirect:/admin" ;
//	} 
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String deleteSanPhamAdmin(@PathVariable int id) {
		SanPham sanPham1 = sanPhamRepository.findById(id).get();
		sanPhamRepository.delete(sanPham1);
//		sanPhamRepository.deleteById(id);
		return "redirect:/admin";
	}
	@RequestMapping("/timkiem")
	public String timKiemSanPham(String tenSanPham,Model model) {
		model.addAttribute("sanPhamTimKiem",sanPhamRepository.getSanPhamByTenSanPham("%"+tenSanPham+"%"));
		return "/tim-kiem";
	}
}
