package com.www.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "chi_tiet_san_pham")
public class ChiTietSanPham implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int chiTietSanPhamId;
    
	@OneToOne(mappedBy = "chiTietSanPham", cascade = CascadeType.ALL)
    private SanPham sanPham;
	
	@ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "mau_sac", joinColumns = @JoinColumn(name = "chi_tiet_san_pham_id"))
    private Set<MauSac> mauSacs;
	
	@ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "kich_co", joinColumns = @JoinColumn(name = "chi_tiet_san_pham_id"))
    private Set<KichCo> kichCos;

	public int getChiTietSanPhamId() {
		return chiTietSanPhamId;
	}

	public void setChiTietSanPhamId(int chiTietSanPhamId) {
		this.chiTietSanPhamId = chiTietSanPhamId;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public Set<MauSac> getMauSacs() {
		return mauSacs;
	}

	public void setMauSacs(Set<MauSac> mauSacs) {
		this.mauSacs = mauSacs;
	}

	public Set<KichCo> getKichCos() {
		return kichCos;
	}

	public void setKichCos(Set<KichCo> kichCos) {
		this.kichCos = kichCos;
	}

	public ChiTietSanPham(int chiTietSanPhamId, SanPham sanPham, Set<MauSac> mauSacs, Set<KichCo> kichCos) {
		this.chiTietSanPhamId = chiTietSanPhamId;
		this.sanPham = sanPham;
		this.mauSacs = mauSacs;
		this.kichCos = kichCos;
	}

	public ChiTietSanPham(Set<MauSac> mauSacs, Set<KichCo> kichCos) {
		this.mauSacs = mauSacs;
		this.kichCos = kichCos;
	}

	public ChiTietSanPham() {
	}
	
	
	
	
}
