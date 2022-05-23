package com.www.entity;

import java.util.Objects;

import javax.persistence.Embeddable;

import org.hibernate.annotations.Nationalized;

import com.www.Util.UtilClass;

@Embeddable
public class ChiTietSanPhamHoaDon {
	@Nationalized
	private String tenSanPham;
	
	private double donGia;
	
	@Nationalized
	private int soLuong;
	
	@Nationalized
	private String hinhAnh;
	
	@Nationalized
	private String mauSac;
	
	@Nationalized
	private String kichCo;
	
	private double donGiaDaCong;

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
	
	public String getDonGiaFormat() {
		return new UtilClass().formatVND(this.getDonGia());
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

	public String getMauSac() {
		return mauSac;
	}

	public void setMauSac(String mauSac) {
		this.mauSac = mauSac;
	}

	public String getKichCo() {
		return kichCo;
	}

	public void setKichCo(String kichCo) {
		this.kichCo = kichCo;
	}

	public ChiTietSanPhamHoaDon() {
	}

	public double getDonGiaDaCong() {
		return donGiaDaCong;
	}

	public void setDonGiaDaCong(double donGiaDaCong) {
		this.donGiaDaCong = donGiaDaCong;
	}
	
	public String getDonGiaDaCongFormat() {
		return new UtilClass().formatVND(this.getDonGiaDaCong());
	}

	@Override
	public int hashCode() {
		return Objects.hash(donGia, donGiaDaCong, hinhAnh, kichCo, mauSac, soLuong, tenSanPham);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChiTietSanPhamHoaDon other = (ChiTietSanPhamHoaDon) obj;
		return Double.doubleToLongBits(donGia) == Double.doubleToLongBits(other.donGia)
				&& Double.doubleToLongBits(donGiaDaCong) == Double.doubleToLongBits(other.donGiaDaCong)
				&& Objects.equals(hinhAnh, other.hinhAnh) && Objects.equals(kichCo, other.kichCo)
				&& Objects.equals(mauSac, other.mauSac) && soLuong == other.soLuong
				&& Objects.equals(tenSanPham, other.tenSanPham);
	}

	
	
}
