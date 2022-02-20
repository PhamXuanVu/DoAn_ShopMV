package com.www.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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

	public CuaHang(int cuaHangId, String tenCuaHang, NguoiDung nguoiDung) {
		super();
		this.cuaHangId = cuaHangId;
		this.tenCuaHang = tenCuaHang;
		this.nguoiDung = nguoiDung;
	}

	public CuaHang() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "CuaHang [cuaHangId=" + cuaHangId + ", tenCuaHang=" + tenCuaHang + ", nguoiDung=" + nguoiDung + "]";
	}

	public CuaHang(String tenCuaHang) {
		this.tenCuaHang = tenCuaHang;
	}
	
	
}
