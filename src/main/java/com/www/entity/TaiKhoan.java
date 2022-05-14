package com.www.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "tai_khoan")
public class TaiKhoan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2819375649538408669L;

	@Id
	@Column(name = "id", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "email", nullable = false, unique = true)
	private String email;

	@Column(name = "matKhau", nullable = false)
	private String matKhau;

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "vaiTroId")
	private VaiTro vaiTro;

	@OneToOne(mappedBy = "taiKhoan", fetch = FetchType.EAGER)
	private NguoiDung nguoiDung;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	

	public VaiTro getVaiTro() {
		return vaiTro;
	}

	public void setVaiTro(VaiTro vaiTro) {
		this.vaiTro = vaiTro;
	}

	public NguoiDung getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(NguoiDung nguoiDung) {
		this.nguoiDung = nguoiDung;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public TaiKhoan(int id, String email, String matKhau, VaiTro vaiTro, NguoiDung nguoiDung) {
		super();
		this.id = id;
		this.email = email;
		this.matKhau = matKhau;
		this.vaiTro = vaiTro;
		this.nguoiDung = nguoiDung;
	}

	public TaiKhoan() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
