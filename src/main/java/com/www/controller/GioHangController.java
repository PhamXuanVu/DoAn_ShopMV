package com.www.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.www.Util.UtilClass;
import com.www.config.PaypalPaymentIntent;
import com.www.config.PaypalPaymentMethod;
import com.www.entity.ChiTietHoaDon;
import com.www.entity.ChiTietSanPham;
import com.www.entity.HoaDon;
import com.www.entity.KichCo;
import com.www.entity.MauSac;
import com.www.entity.NguoiDung;
import com.www.entity.SanPham;
import com.www.repository.ChiTietSanPhamRepository;
import com.www.repository.HoaDonRepository;
import com.www.repository.NguoiDungRepository;
import com.www.repository.SanPhamRepository;
import com.www.repository.UserRepository;
import com.www.service.PaypalService;

@Controller
@RequestMapping("/gioHang")
public class GioHangController {
	ObjectMapper objectMapper = new ObjectMapper();
	@Autowired
	private SanPhamRepository sanPhamRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private HoaDonRepository hoaDonRepository;

	@Autowired
	private NguoiDungRepository nguoiDungRepository;

	@Autowired
	private PaypalService paypalService;
	
	@Autowired
	private ChiTietSanPhamRepository chiTietSanPhamRepository;
	
	@RequestMapping(value = {"", "/"})
	public String getCart() {
		return "gio-hang";
	}

	@RequestMapping(value = {"/add"})
	public String postAddCart(@RequestParam(value = "id") int maSanPham, 
			@RequestParam(value = "soLuong") int soLuong, 
			@RequestParam(value = "kichCo") String kichCo,
			@RequestParam(value = "mauSac") String mauSac,HttpSession session) {

		SanPham sanPham = sanPhamRepository.findById(maSanPham).get();
		Set<KichCo> kichCos = new HashSet<KichCo>();
		KichCo kichCo1 = new KichCo(kichCo);
		kichCos.add(kichCo1);
		
		Set<MauSac> mauSacs = new HashSet<MauSac>();
		MauSac mauSac1 = new MauSac(mauSac);
		mauSacs.add(mauSac1);
		
		ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(sanPham.getChiTietSanPham().getChiTietSanPhamId()).get();
		chiTietSanPham.setKichCos(kichCos);
		chiTietSanPham.setMauSacs(mauSacs);
		sanPham.setChiTietSanPham(chiTietSanPham);
		
		if (session.getAttribute("cart") == null) {
			session.setAttribute("cart", new HoaDon());

			HoaDon hoaDon = (HoaDon) session.getAttribute("cart");

			Set<ChiTietHoaDon> chiTietHoaDons = new HashSet<>();
			ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
			chiTietHoaDon.setSoLuong(soLuong);
			chiTietHoaDon.setSanPham(sanPham);
			chiTietHoaDons.add(chiTietHoaDon);

			hoaDon.setSanPhams(chiTietHoaDons);
			session.setAttribute("cart", hoaDon);
		} else {
			HoaDon hoaDon = (HoaDon) session.getAttribute("cart");
			int flag = 0;
			for (ChiTietHoaDon chiTietHoaDon : hoaDon.getSanPhams()) {
				if ((chiTietHoaDon.getSanPham().getSanPhamId() == maSanPham)) {
					int soLuongHienTai = chiTietHoaDon.getSoLuong();
					hoaDon.getSanPhams().remove(chiTietHoaDon);
					ChiTietHoaDon chiTietHoaDon1 = new ChiTietHoaDon();
					chiTietHoaDon1.setSanPham(chiTietHoaDon.getSanPham());
					chiTietHoaDon1.setSoLuong(soLuongHienTai + soLuong);
					hoaDon.getSanPhams().add(chiTietHoaDon1);
					session.setAttribute("cart", hoaDon);
					break;
				}
				flag++;				
			}
			if (flag >= hoaDon.getSanPhams().size()) {
				ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
				chiTietHoaDon.setSoLuong(soLuong);
				chiTietHoaDon.setSanPham(sanPham);
				hoaDon.getSanPhams().add(chiTietHoaDon);
				session.setAttribute("cart", hoaDon);
			}
			
		}
		return "redirect:/gioHang";
	}

	@RequestMapping("/thanhToan")
	private String getPayment(HttpSession session, Model model) {
		if (session.getAttribute("cart") == null){
			return "redirect:/gioHang";
		}
		NguoiDung nguoiDung = (NguoiDung) model.getAttribute("nguoiDung");
		return "thanh-toan";
	}


	public static final String URL_PAYPAL_SUCCESS = "thanhToan?success=true";
	public static final String URL_PAYPAL_CANCEL = "thanhToan?failure=true";
	private Logger log = LoggerFactory.getLogger(getClass());

	@PostMapping("/pay")	
	public String pay(HttpServletRequest request,@RequestParam("price") double price, HttpSession session ){
		String cancelUrl = UtilClass.getBaseURL(request) + "/gioHang/" + URL_PAYPAL_CANCEL;
		String successUrl = UtilClass.getBaseURL(request) + "/gioHang/" + URL_PAYPAL_SUCCESS;
		try {
			Payment payment = paypalService.createPayment(
					price/23000,
					"USD",
					PaypalPaymentMethod.paypal,
					PaypalPaymentIntent.sale,
					"payment description",
					cancelUrl,
					successUrl);	
			for(Links links : payment.getLinks()){
				if(links.getRel().equals("approval_url")){
					return "redirect:" + links.getHref();
				}
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		return "redirect:/";
	}
}
