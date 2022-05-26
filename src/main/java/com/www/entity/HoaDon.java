package com.www.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.www.Util.UtilClass;

@Entity
@Table(name = "hoa_don")
public class HoaDon {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int hoaDonId;
	
	@OneToMany(mappedBy = "hoaDon", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<ChiTietHoaDon> sanPhams = new HashSet<ChiTietHoaDon>();
	
	@ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "nguoiDungId")
    private NguoiDung nguoiDung;
	
	private Date ngayMua;
	
	private double giamGia;
	
	private double tongGiaHoaDon;
	
	
	@ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "chi_tiet_san_pham_hoa_don", joinColumns = @JoinColumn(name = "hoa_don_san_pham_id"))
    private Set<ChiTietSanPhamHoaDon> chiTietSanPhamHoaDons;


	public double getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(double giamGia) {
		this.giamGia = giamGia;
	}
	
	public String getGiamGiaFormat() {
		return new UtilClass().formatVND(this.getGiamGia());
	}

	public Set<ChiTietSanPhamHoaDon> getChiTietSanPhamHoaDons() {
		return chiTietSanPhamHoaDons;
	}

	public void setChiTietSanPhamHoaDons(Set<ChiTietSanPhamHoaDon> chiTietSanPhamHoaDons) {
		this.chiTietSanPhamHoaDons = chiTietSanPhamHoaDons;
	}

	public double getTongGiaHoaDon() {
		return tongGiaHoaDon;
	}

	public void setTongGiaHoaDon(double tongGiaHoaDon) {
		this.tongGiaHoaDon = tongGiaHoaDon;
	}
	public String getTongGiaHoaDonFormat() {
		return new UtilClass().formatVND(this.getTongGiaHoaDon());
	}

	public Date getNgayMua() {
		return ngayMua;
	}

	public void setNgayMua(Date ngayMua) {
		this.ngayMua = ngayMua;
	}

	public int getHoaDonId() {
		return hoaDonId;
	}

	public void setHoaDonId(int hoaDonId) {
		this.hoaDonId = hoaDonId;
	}


	public Set<ChiTietHoaDon> getSanPhams() {
		return sanPhams;
	}

	public void setSanPhams(Set<ChiTietHoaDon> sanPhams) {
		this.sanPhams = sanPhams;
	}

	

	public NguoiDung getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(NguoiDung nguoiDung) {
		this.nguoiDung = nguoiDung;
	}

	public HoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}


	public double tinhTongTienTrongGioHang() {
        double sum = 0;
        for (ChiTietHoaDon chiTietHoaDon : this.getSanPhams()) {
            sum += chiTietHoaDon.tinhTienChiTietHoaDon();
        }
        return sum;
    }

    public String getTongTienChiTietHoaDonFormat() {
        return new UtilClass().formatVND(this.tinhTongTienTrongGioHang());
    }
}
