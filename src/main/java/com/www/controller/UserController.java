package com.www.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.RedirectView;

import com.www.dto.NguoiDungDTO;
import com.www.dto.SanPhamDTO;
import com.www.entity.ChiTietSanPham;
import com.www.entity.CuaHang;
import com.www.entity.DanhMuc;
import com.www.entity.KichCo;
import com.www.entity.MauSac;
import com.www.entity.NguoiDung;
import com.www.entity.SanPham;
import com.www.entity.TaiKhoan;
import com.www.entity.VaiTro;
import com.www.repository.ChiTietSanPhamRepository;
import com.www.repository.CuaHangRepository;
import com.www.repository.DanhMucRepository;
import com.www.repository.NguoiDungRepository;
import com.www.repository.RoleRepository;
import com.www.repository.SanPhamRepository;
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
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@Autowired
	private CuaHangRepository cuaHangRepository;
	
	@Autowired
	private DanhMucRepository danhMucRepository;
	
	@Autowired
	private ChiTietSanPhamRepository chiTietSanPhamRepository;
	
	@GetMapping("/login")
	public String login() {
	    return "login";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("nguoiDung",new NguoiDungDTO());
	    return "register";
	}
	
	@PostMapping(value = "/register", consumes = "application/x-www-form-urlencoded")
    public RedirectView postRegister(NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
        	System.out.println(bindingResult.hasErrors());
            return new RedirectView(request.getContextPath() + "/user/register");
        } else {
            if (userRepository.findByEmail(nguoiDungDTO.getEmail()) == null) {
                VaiTro vaiTro = roleRepository.findByTenVaiTro("ROLE_MEMBER");

                TaiKhoan taiKhoan = new TaiKhoan();
                Set<VaiTro> vaiTros = new HashSet<>();
                vaiTros.add(vaiTro);
                taiKhoan.setVaiTro(vaiTro);
                taiKhoan.setEmail(nguoiDungDTO.getEmail());
                taiKhoan.setMatKhau(passwordEncoder.encode(nguoiDungDTO.getMatKhau()));
         
                userRepository.save(taiKhoan);

                NguoiDung nguoiDung = new NguoiDung();
                nguoiDung.setTaiKhoan(taiKhoan);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                nguoiDungRepository.save(nguoiDung);

                return new RedirectView(request.getContextPath() + "/user/login?success=true");
            }

            return new RedirectView(request.getContextPath() + "/user/register?failure=true");
        }

    }
	@GetMapping("/cuahang/{id}")
	public String getCuaHang(@PathVariable int id,Model model) {
		model.addAttribute("userId",id);
	    return "/user/cua-hang";
	}
	
	@GetMapping("/form-tao-cua-hang/{id}")
	public String createCuaHang(@PathVariable int id) {	
	    return "/user/form-tao-cua-hang";
	}
	@PostMapping(value = "/form-tao-cua-hang/{id}", consumes = "application/x-www-form-urlencoded")
    public RedirectView postCreateCuaHang(@PathVariable int id,@ModelAttribute("cuaHang") CuaHang cuaHang, BindingResult bindingResult, Model model, HttpServletRequest request) {
        	NguoiDung nguoiDung = nguoiDungRepository.findById(id);
        	String email = nguoiDung.getTaiKhoan().getEmail();
        	String sdt = nguoiDung.getSoDienThoai();
        	CuaHang cuaHang2 = new CuaHang(cuaHang.getTenCuaHang(),cuaHang.getDiaChiLayHang(),email,sdt);
        	nguoiDung.setCuaHang(cuaHang2);
        	nguoiDungRepository.save(nguoiDung);
        	
            return new RedirectView(request.getContextPath() + "/user/cuahang/" + id);
        }
	
	@GetMapping("/sanphamcuahang/{id}")
	public String getSanPhamsByCuaHang(@PathVariable int id,HttpServletRequest request,ModelMap modelMap) {		
		PagedListHolder pagedListHolder = new PagedListHolder(sanPhamRepository.getSanPhamByCuaHangId(id));
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(8);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "/user/danh-sach-san-pham";
	}
	
	@GetMapping("/form-add-san-pham/{id}")
	public String addSanPham(@PathVariable int id,Model model) {
		model.addAttribute("danhMucSP", new SanPhamDTO());
	    return "/user/form-add-san-pham";
	}
	
	@RequestMapping(value = "/form-add-san-pham/{id}", consumes = "application/x-www-form-urlencoded")
	public RedirectView postAddSanPham(@PathVariable int id,@ModelAttribute("sanPham") SanPhamDTO sanPhamDTO, Model model, HttpServletRequest request) {

		SanPham sanPham = new SanPham();
		sanPham.setTenSanPham(sanPhamDTO.getTenSanPham());
		sanPham.setDonGia(sanPhamDTO.getDonGia());
		sanPham.setHinhAnh("/images/"+sanPhamDTO.getHinhAnh());
		sanPham.setMoTa(sanPhamDTO.getMoTa());
		sanPham.setSoLuong(sanPhamDTO.getSoLuong());
		NguoiDung nguoiDung = nguoiDungRepository.findById(id); 
		sanPham.setCuaHang(nguoiDung.getCuaHang());
		DanhMuc danhMuc = danhMucRepository.findByTenDanhMuc(sanPhamDTO.getDanhMuc());
		sanPham.setDanhMuc(danhMuc);
				
		Set<MauSac>mauSacs  = new HashSet<MauSac>();
		sanPhamDTO.getMauSac().forEach(m -> {
			MauSac mauSac = new MauSac();
			mauSac.setTenMau(m);
			mauSacs.add(mauSac);
		});
				
		Set<KichCo> kichCos = new HashSet<KichCo>();
		sanPhamDTO.getKichCo().forEach(k -> {
			KichCo kichCo = new KichCo();
			kichCo.setTenKichCo(k);
			kichCos.add(kichCo);
		});
				
		ChiTietSanPham chiTietSanPham = new ChiTietSanPham(mauSacs, kichCos);
		sanPham.setChiTietSanPham(chiTietSanPham);
 		sanPhamRepository.save(sanPham);
		int cuaHangId = nguoiDung.getCuaHang().getCuaHangId();

		return new RedirectView(request.getContextPath() + "/user/sanphamcuahang/" + cuaHangId+"?addSuccess=true");

	}
	
	
	@GetMapping("/form-update-san-pham/{id}")
	public String updateSanPham(@PathVariable int id,Model model) {
		SanPham sanPham = sanPhamRepository.findById(id).get();
		model.addAttribute("sanPham",sanPham);
	    return "/user/form-update-san-pham";
	}
	
	@RequestMapping(value="/form-update-san-pham/{id}",method = RequestMethod.POST)    
	public String saveUpdateSanPham(@PathVariable int id,@ModelAttribute("sanPham") SanPhamDTO sanPham){
		SanPham sanPham1 = sanPhamRepository.findById(id).get();
		sanPham1.setTenSanPham(sanPham.getTenSanPham());
		sanPham1.setDonGia(sanPham.getDonGia());
		sanPham1.setMoTa(sanPham.getMoTa());
		sanPham1.setSoLuong(sanPham.getSoLuong());
		sanPham1.setHinhAnh("/images/"+sanPham.getHinhAnh());
		Set<MauSac>mauSacs  = new HashSet<MauSac>();
		sanPham.getMauSac().forEach(m -> {
			MauSac mauSac = new MauSac();
			mauSac.setTenMau(m);
			mauSacs.add(mauSac);
		});
				
		Set<KichCo> kichCos = new HashSet<KichCo>();
		sanPham.getKichCo().forEach(k -> {
			KichCo kichCo = new KichCo();
			kichCo.setTenKichCo(k);
			kichCos.add(kichCo);
		});
		ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(sanPham1.getChiTietSanPham().getChiTietSanPhamId()).get();
		chiTietSanPham.setKichCos(kichCos);
		chiTietSanPham.setMauSacs(mauSacs);
		sanPham1.setChiTietSanPham(chiTietSanPham);
		sanPhamRepository.save(sanPham1);
		
		
		return "redirect:/user/sanphamcuahang/" + sanPham1.getCuaHang().getCuaHangId() +"?updateSuccess=true";
	}
	
	@GetMapping("/form-update-user/{id}")
	public String updateUser(@PathVariable int id) {	
	    return "/user/form-update-user";
	}
	
	@PostMapping(value = "/form-update-user/{id}", consumes = "application/x-www-form-urlencoded")
    public RedirectView postUpdatUser(@PathVariable int id,NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
				
                NguoiDung nguoiDung = nguoiDungRepository.findById(id);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                nguoiDungRepository.save(nguoiDung);
                return new RedirectView(request.getContextPath()+"?success=true");
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String deleteSanPham(@PathVariable int id) {
		SanPham sanPham1 = sanPhamRepository.findById(id).get();
		sanPhamRepository.delete(sanPham1);
		return "redirect:/user/sanphamcuahang/" + sanPham1.getCuaHang().getCuaHangId() +"?deleteSuccess=true";
	}
	
	@GetMapping("/nguoimua")
	public String getNguoiMua(HttpServletRequest request,ModelMap modelMap) {
		PagedListHolder pagedListHolder = new PagedListHolder(nguoiDungRepository.findByRoleMember());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(8);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "/admin/danh-sach-nguoi-mua";
	}
	
	@GetMapping("/nguoiban")
	public String getNguoiBan(HttpServletRequest request,ModelMap modelMap) {
		PagedListHolder pagedListHolder = new PagedListHolder(nguoiDungRepository.findByCuaHang());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(8);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "/admin/danh-sach-nguoi-ban";
	}
	
	@GetMapping("/form-update-cua-hang/{id}")
	public String updateCuaHang(@PathVariable int id,Model model) {
	    return "/user/form-update-cua-hang";
	}
	@PostMapping(value = "/form-update-cua-hang/{id}", consumes = "application/x-www-form-urlencoded")
    public RedirectView postUpdateCuaHang(@PathVariable int id,@ModelAttribute("cuaHang") CuaHang cuaHang, BindingResult bindingResult, Model model, HttpServletRequest request) {
        	CuaHang tempCuaHang = cuaHangRepository.findById(id).get();
        	tempCuaHang.setTenCuaHang(cuaHang.getTenCuaHang());
        	tempCuaHang.setDiaChiLayHang(cuaHang.getDiaChiLayHang());
        	cuaHangRepository.save(tempCuaHang);
        	
        	
            return new RedirectView(request.getContextPath() + "/user/cuahang/" + id+"?success=true");
        }
	
	@GetMapping("/form-add-nguoi-mua")
	public String formAddNguoiMua() {
	    return "/admin/form-add-nguoi-mua";
	}
	
	@PostMapping(value = "/form-add-nguoi-mua", consumes = "application/x-www-form-urlencoded")
    public RedirectView postAddNguoiMua(NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            System.out.println("Co loi xay ra " + bindingResult);

            return new RedirectView(request.getContextPath() + "/user/login");
        } else {
            if (userRepository.findByEmail(nguoiDungDTO.getEmail()) == null) {
                VaiTro vaiTro = roleRepository.findByTenVaiTro("ROLE_MEMBER");

                TaiKhoan taiKhoan = new TaiKhoan();
                taiKhoan.setVaiTro(vaiTro);
                taiKhoan.setEmail(nguoiDungDTO.getEmail());
                taiKhoan.setMatKhau(passwordEncoder.encode(nguoiDungDTO.getMatKhau()));
         
                userRepository.save(taiKhoan);

                NguoiDung nguoiDung = new NguoiDung();
                nguoiDung.setTaiKhoan(taiKhoan);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                nguoiDungRepository.save(nguoiDung);

                return new RedirectView(request.getContextPath() + "/user/nguoimua?addSuccess=true");
            }

            return new RedirectView(request.getContextPath() + "/user/form-add-nguoi-mua?failure=true");
        }

    }
	
	@GetMapping("/form-update-nguoi-mua/{id}")
	public String updateNguoiMua(@PathVariable int id,Model model) {
		model.addAttribute("nguoiMua",nguoiDungRepository.findById(id));
	    return "/admin/form-update-nguoi-mua";
	}
	
	@PostMapping(value = "/form-update-nguoi-mua/{id}", consumes = "application/x-www-form-urlencoded")
    public RedirectView postUpdateNguoiMua(@PathVariable int id,NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
				
                NguoiDung nguoiDung = nguoiDungRepository.findById(id);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                nguoiDungRepository.save(nguoiDung);
                return new RedirectView(request.getContextPath() + "/user/nguoimua?updateSuccess=true");
	}
	
	@RequestMapping(value = "deleteNguoiMua/{id}", method = RequestMethod.GET)
	public String deleteNguoiMua(@PathVariable int id) {
		nguoiDungRepository.delete(nguoiDungRepository.findById(id));
		return "redirect:/user/nguoimua?deleteSuccess=true";
	}
	
	@GetMapping("/form-add-nguoi-ban")
	public String formAddNguoiBan() {
	    return "/admin/form-add-nguoi-ban";
	}
	
	@PostMapping(value = "/form-add-nguoi-ban", consumes = "application/x-www-form-urlencoded")
    public RedirectView postAddNguoiBan(NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
            if (userRepository.findByEmail(nguoiDungDTO.getEmail()) == null) {
                VaiTro vaiTro = roleRepository.findByTenVaiTro("ROLE_MEMBER");

                TaiKhoan taiKhoan = new TaiKhoan();
                taiKhoan.setVaiTro(vaiTro);
                taiKhoan.setEmail(nguoiDungDTO.getEmail());
                taiKhoan.setMatKhau(passwordEncoder.encode(nguoiDungDTO.getMatKhau()));
         
                userRepository.save(taiKhoan);

                NguoiDung nguoiDung = new NguoiDung();
                nguoiDung.setTaiKhoan(taiKhoan);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                CuaHang cuaHang = new CuaHang(nguoiDungDTO.getTenCuaHang(), nguoiDungDTO.getDiaChiLayHang(),nguoiDungDTO.getEmail(), nguoiDungDTO.getSoDienThoai());
                nguoiDung.setCuaHang(cuaHang);
                nguoiDungRepository.save(nguoiDung);

                return new RedirectView(request.getContextPath() + "/user/nguoiban?addSuccess=true");
            }

            return new RedirectView(request.getContextPath() + "/user/form-add-nguoi-ban?failure=true");

    }
	
	@GetMapping("/form-update-nguoi-ban/{id}")
	public String updateNguoiBan(@PathVariable int id,Model model) {
		model.addAttribute("nguoiBan",nguoiDungRepository.findById(id));
	    return "/admin/form-update-nguoi-ban";
	}
	
	@PostMapping(value = "/form-update-nguoi-ban/{id}", consumes = "application/x-www-form-urlencoded")
    public RedirectView postUpdateNguoiBan(@PathVariable int id,NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
				
                NguoiDung nguoiDung = nguoiDungRepository.findById(id);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                CuaHang cuaHang = new CuaHang(nguoiDungDTO.getTenCuaHang(), nguoiDungDTO.getDiaChiLayHang(),nguoiDungDTO.getEmail(), nguoiDungDTO.getSoDienThoai());
                nguoiDung.setCuaHang(cuaHang);
                nguoiDungRepository.save(nguoiDung);
                return new RedirectView(request.getContextPath() + "/user/nguoiban?updateSuccess=true");
	}
	
	@RequestMapping(value = "deleteNguoiBan/{id}", method = RequestMethod.GET)
	public String deleteNguoiBan(@PathVariable int id) {
		nguoiDungRepository.delete(nguoiDungRepository.findById(id));
		return "redirect:/user/nguoiban?deleteSuccess=true";
	}
	
	
}
