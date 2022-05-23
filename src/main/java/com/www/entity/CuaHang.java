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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "cua_hang")
public class CuaHang {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cuaHangId;
	
	@Nationalized
	@NotBlank(message = "Tên cửa hàng không được để trống")
	private String tenCuaHang;
	
	@Nationalized
	@NotBlank(message = "Địa chỉ hàng không được để trống")
	private String diaChiLayHang;
	
	@Nationalized
	private String email;
	
	@Nationalized
	private String sdt;
	
	@OneToOne(mappedBy = "cuaHang", cascade = CascadeType.ALL)
    private NguoiDung nguoiDung;
	
	@OneToMany(mappedBy = "cuaHang", cascade = CascadeType.ALL)
    private Set<SanPham> sanPhams;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "donViVanChuyenId")
    private DonViVanChuyen donViVanChuyen;
	

	public int getCuaHangId() {
		return cuaHangId;
	}

	public void setCuaHangId(int cuaHangId) {
		this.cuaHangId = cuaHangId;
	}

	public String getTenCuaHang() {
		return tenCuaHang;
	}

	public void setTenCuaHang(String tenCuaHang) {
		this.tenCuaHang = tenCuaHang;
	}

	public NguoiDung getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(NguoiDung nguoiDung) {
		this.nguoiDung = nguoiDung;
	}

	public Set<SanPham> getSanPhams() {
		return sanPhams;
	}

	public void setSanPhams(Set<SanPham> sanPhams) {
		this.sanPhams = sanPhams;
	}
	
	
	public String getDiaChiLayHang() {
		return diaChiLayHang;
	}

	public void setDiaChiLayHang(String diaChiLayHang) {
		this.diaChiLayHang = diaChiLayHang;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public CuaHang() {
		super();
	}

	public CuaHang(String tenCuaHang) {
		this.tenCuaHang = tenCuaHang;
	}

	public CuaHang(int cuaHangId, String tenCuaHang, String diaChiLayHang, String email, String sdt,
			NguoiDung nguoiDung, Set<SanPham> sanPhams, DonViVanChuyen donViVanChuyen) {
		super();
		this.cuaHangId = cuaHangId;
		this.tenCuaHang = tenCuaHang;
		this.diaChiLayHang = diaChiLayHang;
		this.email = email;
		this.sdt = sdt;
		this.nguoiDung = nguoiDung;
		this.sanPhams = sanPhams;
		this.donViVanChuyen = donViVanChuyen;
	}

	public CuaHang(String tenCuaHang, String diaChiLayHang, String email, String sdt) {
		this.tenCuaHang = tenCuaHang;
		this.diaChiLayHang = diaChiLayHang;
		this.email = email;
		this.sdt = sdt;
	}

	
	
	
	
}
