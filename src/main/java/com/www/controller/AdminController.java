package com.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.www.repository.HoaDonRepository;


@Controller
@Transactional
@EnableWebMvc
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	
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
}
