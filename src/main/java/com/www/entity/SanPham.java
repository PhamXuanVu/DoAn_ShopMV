package com.www.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

import com.www.Util.UtilClass;


@Entity
@Table(name = "san_pham")
public class SanPham {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int sanPhamId;
	
	@Nationalized
	private String tenSanPham;
	
	private double donGia;
	
	@Nationalized
	private int soLuong;
	
	@Nationalized
	private String hinhAnh;
	
	@Nationalized
	private String moTa;
	
	@OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<ChiTietHoaDon> hoaDons;
	
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "danhMucId")
    private DanhMuc danhMuc;

	public SanPham() {
		super();
		// TODO Auto-generated constructor stub
	}



	public SanPham(int sanPhamId, String tenSanPham, double donGia, int soLuong, String hinhAnh, String moTa,
			Set<ChiTietHoaDon> hoaDons, DanhMuc danhMuc) {
		super();
		this.sanPhamId = sanPhamId;
		this.tenSanPham = tenSanPham;
		this.donGia = donGia;
		this.soLuong = soLuong;
		this.hinhAnh = hinhAnh;
		this.moTa = moTa;
		this.hoaDons = hoaDons;
		this.danhMuc = danhMuc;
	}

	public int getSanPhamId() {
		return sanPhamId;
	}



	public void setSanPhamId(int sanPhamId) {
		this.sanPhamId = sanPhamId;
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



	public Set<ChiTietHoaDon> getHoaDons() {
		return hoaDons;
	}



	public void setHoaDons(Set<ChiTietHoaDon> hoaDons) {
		this.hoaDons = hoaDons;
	}



	public DanhMuc getDanhMuc() {
		return danhMuc;
	}



	public void setDanhMuc(DanhMuc danhMuc) {
		this.danhMuc = danhMuc;
	}



	public String getGiaFormat() {
        UtilClass utilClass = new UtilClass();
        return utilClass.formatVND(this.getDonGia());
    }



	@Override
	public String toString() {
		return "SanPham [sanPhamId=" + sanPhamId + ", tenSanPham=" + tenSanPham + ", donGia=" + donGia + ", soLuong="
				+ soLuong + ", hinhAnh=" + hinhAnh + ", moTa=" + moTa + ", hoaDons=" + hoaDons + ", danhMuc=" + danhMuc
				+ "]";
	}
	
	

}
