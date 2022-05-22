package com.www.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.www.Util.GooglePojo;
import com.www.Util.GoogleUtils;
import com.www.entity.SanPham;
import com.www.repository.DanhMucRepository;
import com.www.repository.SanPhamRepository;

@Controller
@Transactional
@EnableWebMvc
public class MainController {
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@Autowired
	private GoogleUtils googleUtils;
	
	
	@GetMapping("/")
	public String main(HttpServletRequest request,Model model,ModelMap modelMap) {
		model.addAttribute("sanPham", sanPhamRepository.findAll());
		model.addAttribute("sanPhamNoiBat", sanPhamRepository.getSanPhamNoiBat());
		model.addAttribute("sanPhamMoi", sanPhamRepository.getSanPhamMoi());
		List<SanPham> products = (List<SanPham>) sanPhamRepository.findAll();
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(10);
		modelMap.put("pagedListHolder", pagedListHolder);
	    return "index";
	}
	
	@GetMapping("/lien-he")
	public String lienHe() {	
	    return "lien-he";
	}
	
	@RequestMapping(value="/chiTietSP/{id}")   
	public String showProductDetail(@PathVariable int id, Model model){    
		SanPham sanPham = sanPhamRepository.findById(id).get();
		model.addAttribute("danhMucSP",sanPhamRepository.getSanPhamByDanhMucId(sanPham.getDanhMuc().getDanhMucId()));
		model.addAttribute("sanPham",sanPham);
		return "chi-tiet-sp";
	}
	
	@RequestMapping("/login-google")
	  public String loginGoogle(HttpServletRequest request) throws ClientProtocolException, IOException {
	    String code = request.getParameter("code");
	    
	    if (code == null || code.isEmpty()) {
	      return "redirect:/login?google=error";
	    }
	    String accessToken = googleUtils.getToken(code);
	    
	    GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);
	    UserDetails userDetail = googleUtils.buildUser(googlePojo);
	    UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
	        userDetail.getAuthorities());
	    authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
	    SecurityContextHolder.getContext().setAuthentication(authentication);
	    return "redirect:/";
	  }
}
