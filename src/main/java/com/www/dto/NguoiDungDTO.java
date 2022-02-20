package com.www.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class NguoiDungDTO {
	
	@NotEmpty(message = "Họ tên đệm không được để trống")
	private String hoTenDem;
	
	@NotNull(message = "Tên không được để trống")
    private String ten;
	
	@NotEmpty(message = "Số điện thoại không được để trống")
	@Pattern(regexp="(^$|[0-9]{10})")
    private String soDienThoai;
	
	@NotEmpty(message = "Email không được để trống")
	@Email(message = "Email không đúng định dạng")
    private String email;
	
	@NotNull(message = "Địa không được để trống")
    private String diaChi;
	
	@NotEmpty(message = "Mật khẩu không được để trống")
	@Min(value = 6, message = "Mật khẩu phải từ 6 kí tự trở lên")
    private String matKhau;

	public String getHoTenDem() {
		return hoTenDem;
	}

	public void setHoTenDem(String hoTenDem) {
		this.hoTenDem = hoTenDem;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public NguoiDungDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
