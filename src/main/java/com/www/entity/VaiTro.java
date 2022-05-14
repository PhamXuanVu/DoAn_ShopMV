package com.www.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "vai_tro")
public class VaiTro implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5897519446505320077L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "tenVaiTro", nullable = false)
	private String tenVaiTro;
	
	@OneToMany(mappedBy = "vaiTro", cascade = CascadeType.ALL)
	private Set<TaiKhoan> taiKhoans;

	

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getTenVaiTro() {
		return tenVaiTro;
	}



	public void setTenVaiTro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}



	public Set<TaiKhoan> getTaiKhoans() {
		return taiKhoans;
	}



	public void setTaiKhoans(Set<TaiKhoan> taiKhoans) {
		this.taiKhoans = taiKhoans;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public VaiTro() {
	}
}
