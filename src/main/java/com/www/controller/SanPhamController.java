package com.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
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
	
	@GetMapping("/tat-ca-san-pham")
	public String getAllSanPham(ModelMap modelMap,HttpServletRequest request) {
		List<SanPham> products = (List<SanPham>) sanPhamRepository.findAll();
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(1);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "tat-ca-san-pham";
	}
	
	@GetMapping("/san-pham-cua-hang/{id}")
	public String getAllSanPhamByCuaHang(@PathVariable int id,ModelMap modelMap,HttpServletRequest request,Model model) {
		List<SanPham> products = (List<SanPham>) sanPhamRepository.getSanPhamByCuaHang(id);
		model.addAttribute("cuaHang",cuaHangRepository.findById(id).get());
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(1);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "san-pham-cua-hang";
	}
	
	@GetMapping("/{id}")
	public String getSanPhamsByDanhMuc(@PathVariable int id,Model model) {
		model.addAttribute("danhMucId",id);
		model.addAttribute("danhMucSP",sanPhamRepository.getSanPhamByDanhMucId(id));
		return "/danh-muc-san-pham";
	}
	
	@RequestMapping("/timkiem")
	public String timKiemSanPham(String tenSanPham,Model model) {
		model.addAttribute("sanPhamTimKiem",sanPhamRepository.getSanPhamByTenSanPham("%"+tenSanPham+"%"));
		return "/tim-kiem";
	}
}
