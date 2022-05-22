package com.www.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

@Entity
@Table(name = "don_vi_van_chuyen")
public class DonViVanChuyen {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int donViVanChuyenId;
	
	@Nationalized
	private String tenDonViVanChuyen;
	
	@OneToMany(mappedBy = "donViVanChuyen", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<CuaHang> cuaHangs;

	public int getDonViVanChuyenId() {
		return donViVanChuyenId;
	}

	public void setDonViVanChuyenId(int donViVanChuyenId) {
		this.donViVanChuyenId = donViVanChuyenId;
	}

	public String getTenDonViVanChuyen() {
		return tenDonViVanChuyen;
	}

	public void setTenDonViVanChuyen(String tenDonViVanChuyen) {
		this.tenDonViVanChuyen = tenDonViVanChuyen;
	}

	public Set<CuaHang> getCuaHangs() {
		return cuaHangs;
	}

	public void setCuaHangs(Set<CuaHang> cuaHangs) {
		this.cuaHangs = cuaHangs;
	}
	
	
}
