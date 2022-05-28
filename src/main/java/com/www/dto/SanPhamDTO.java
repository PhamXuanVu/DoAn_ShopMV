package com.www.dto;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.Min;

import org.hibernate.annotations.Check;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class SanPhamDTO {
	@NotEmpty(message = "Tên sản phẩm không được để trống")
	private String tenSanPham;
	
	@Min(message = "Đơn giá không được để trống, thấp nhất là 20000", value = 1000)
	private double donGia;
	
	@Min(message = "Số lượng không được để trống, thấp nhất là 1", value = 1)
	private int soLuong;
	
	@NotEmpty(message = "Hình ảnh không được để trống")
	private String hinhAnh;
	
	@NotEmpty(message = "Mô tả không được để trống")
	private String moTa;
	
	private String danhMuc;
	
	@NotEmpty(message = "Màu sắc không được để trống, nếu sản phẩm không có màu sắc hãy chọn NULL")
	private List<String> mauSac;
	
	@NotEmpty(message = "Kích cở không được để trống, nếu sản phẩm không có kích cở hãy chọn NULL")
	private List<String> kichCo;
	
	
	public List<String> getMauSac() {
		return mauSac;
	}
	public void setMauSac(List<String> mauSac) {
		this.mauSac = mauSac;
	}
	public List<String> getKichCo() {
		return kichCo;
	}
	public void setKichCo(List<String> kichCo) {
		this.kichCo = kichCo;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public double getDonGia() {
		return donGia;
	}
	public void setDonGia(double donGia) {
		this.donGia = donGia;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getDanhMuc() {
		return danhMuc;
	}
	public void setDanhMuc(String danhMuc) {
		this.danhMuc = danhMuc;
	}
	public SanPhamDTO() {
	}
	@Override
	public String toString() {
		return "SanPhamDTO [tenSanPham=" + tenSanPham + ", donGia=" + donGia + ", soLuong=" + soLuong + ", hinhAnh="
				+ hinhAnh + ", moTa=" + moTa + ", danhMuc=" + danhMuc + ", mauSac=" + mauSac + ", kichCo=" + kichCo
				+ "]";
	}
	
	
	
}
