package com.www.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

@Entity
@Table(name = "cua_hang")
public class CuaHang {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cuaHangId;
	
	@Nationalized
	private String tenCuaHang;
	
	@OneToOne(mappedBy = "cuaHang")
    private NguoiDung nguoiDung;
	
	@OneToMany(mappedBy = "cuaHang", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<SanPham> sanPhams;

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

	public CuaHang(int cuaHangId, String tenCuaHang, NguoiDung nguoiDung, Set<SanPham> sanPhams) {
		super();
		this.cuaHangId = cuaHangId;
		this.tenCuaHang = tenCuaHang;
		this.nguoiDung = nguoiDung;
		this.sanPhams = sanPhams;
	}

	public CuaHang() {
		super();
	}

	public CuaHang(String tenCuaHang) {
		this.tenCuaHang = tenCuaHang;
	}
	
	
	
}
