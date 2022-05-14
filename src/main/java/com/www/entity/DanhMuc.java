package com.www.entity;

import java.util.List;

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
@Table(name = "danh_muc")
public class DanhMuc {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int danhMucId;
	
	@Nationalized
	private String tenDanhMuc;
	
	@OneToMany(mappedBy = "danhMuc", fetch = FetchType.EAGER)
    private List<SanPham> sanPhams;

	public int getDanhMucId() {
		return danhMucId;
	}

	public void setDanhMucId(int danhMucId) {
		this.danhMucId = danhMucId;
	}

	public String getTenDanhMuc() {
		return tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	public List<SanPham> getSanPhams() {
		return sanPhams;
	}

	public void setSanPhams(List<SanPham> sanPhams) {
		this.sanPhams = sanPhams;
	}

	public DanhMuc(int danhMucId, String tenDanhMuc, List<SanPham> sanPhams) {
		super();
		this.danhMucId = danhMucId;
		this.tenDanhMuc = tenDanhMuc;
		this.sanPhams = sanPhams;
	}
	
	

	public DanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	public DanhMuc() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
