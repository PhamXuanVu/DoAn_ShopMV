package com.www.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.www.entity.ChiTietSanPhamHoaDon;
import com.www.entity.DonViVanChuyen;
import com.www.entity.HoaDon;
import com.www.repository.DonViVanChuyenRepository;
import com.www.repository.HoaDonRepository;


@Controller
@Transactional
@EnableWebMvc
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	@Autowired
	private DonViVanChuyenRepository donViVanChuyenRepository;
	
	
	@GetMapping(value = {"", "/"})
    public String getDashboard() {
        return "admin/index";
    }
	
	@GetMapping("/hoadon")
		public String getHoaDon(HttpServletRequest request,ModelMap modelMap) {
			PagedListHolder pagedListHolder = new PagedListHolder((List) hoaDonRepository.findAll());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setPageSize(8);
			modelMap.put("pagedListHolder", pagedListHolder);
			return "/admin/hoa-don";
	}
	@GetMapping("/don-vi-van-chuyen")
	public String getDonViVanChuyen(HttpServletRequest request,ModelMap modelMap) {
		PagedListHolder pagedListHolder = new PagedListHolder((List) donViVanChuyenRepository.findAll());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(8);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "/admin/don-vi-van-chuyen";
}
	@GetMapping("/hoadon/chi-tiet-hoa-don/{id}")
	public String getChiTietHoaDon(@PathVariable int id, Model model) {
		HoaDon hoaDon = hoaDonRepository.findById(id).get();
		Set<ChiTietSanPhamHoaDon> chiTietSanPhamHoaDons = new HashSet<ChiTietSanPhamHoaDon>();
		chiTietSanPhamHoaDons.addAll(hoaDon.getChiTietSanPhamHoaDons());
		model.addAttribute("chiTietHoaDon", chiTietSanPhamHoaDons);
		model.addAttribute("tongHoaDon", hoaDon.getTongGiaHoaDonFormat());
		return "/admin/chi-tiet-hoa-don";
}
	
}
