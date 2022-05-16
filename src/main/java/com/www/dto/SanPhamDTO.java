package com.www.dto;

import java.util.List;

public class SanPhamDTO {
	private String tenSanPham;
	private double donGia;
	private int soLuong;
	private String hinhAnh;
	private String moTa;
	private String danhMuc;
	private List<String> mauSac;
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
	
	

}
