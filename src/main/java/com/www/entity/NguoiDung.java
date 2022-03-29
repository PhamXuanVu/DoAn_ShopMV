package com.www.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

@Entity
@Table(name = "nguoi_dung")
public class NguoiDung implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1835758663980843147L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Nationalized
	private String hoTenDem;

	@Nationalized
	private String ten;

	@Nationalized
	private String soDienThoai;

	@Nationalized
	private String diaChi;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "tai_khoan_id", nullable = false)
	private TaiKhoan taiKhoan;

	@OneToMany(mappedBy = "nguoiDung", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<HoaDon> hoaDons;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "cuaHangId", referencedColumnName = "cuaHangId")
	private CuaHang cuaHang;
	
	

	public NguoiDung(int id, String hoTenDem, String ten, String soDienThoai, String diaChi, TaiKhoan taiKhoan,
			Set<HoaDon> hoaDons, CuaHang cuaHang) {
		super();
		this.id = id;
		this.hoTenDem = hoTenDem;
		this.ten = ten;
		this.soDienThoai = soDienThoai;
		this.diaChi = diaChi;
		this.taiKhoan = taiKhoan;
		this.hoaDons = hoaDons;
		this.cuaHang = cuaHang;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



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



	public String getDiaChi() {
		return diaChi;
	}



	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}



	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}



	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}



	public Set<HoaDon> getHoaDons() {
		return hoaDons;
	}



	public void setHoaDons(Set<HoaDon> hoaDons) {
		this.hoaDons = hoaDons;
	}



	public CuaHang getCuaHang() {
		return cuaHang;
	}



	public void setCuaHang(CuaHang cuaHang) {
		this.cuaHang = cuaHang;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public NguoiDung() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	


}
