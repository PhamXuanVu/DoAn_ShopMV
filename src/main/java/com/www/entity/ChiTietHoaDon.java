package com.www.entity;

import java.util.Date;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.www.Util.UtilClass;

@Entity
@Table(name = "chi_tiet_hoa_don")
public class ChiTietHoaDon {
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@EmbeddedId
	private ChiTietHoaDonPK id;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @MapsId("sanPhamId")
    @JoinColumn(name = "sanPhamId")
    private SanPham sanPham;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @MapsId("hoaDonId")
    @JoinColumn(name = "hoaDonId")
    private HoaDon hoaDon;
	
	private int soLuong;
	
	
	
	
	public ChiTietHoaDonPK getId() {
		return id;
	}
	public void setId(ChiTietHoaDonPK id) {
		this.id = id;
	}
	public SanPham getSanPham() {
		return sanPham;
	}
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
	public HoaDon getHoaDon() {
		return hoaDon;
	}
	public void setHoaDon(HoaDon hoaDon) {
		this.hoaDon = hoaDon;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	@Column(name = "gia_ban", nullable = false)
    public double tinhGiaBan() {
        return this.getSanPham().getDonGia();
    }
    public String tinhGiaBanFormat() {
        return new UtilClass().formatVND(this.tinhGiaBan());
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ChiTietHoaDon)) return false;
        ChiTietHoaDon that = (ChiTietHoaDon) o;
        return getSoLuong() == that.getSoLuong() && Objects.equals(getSanPham(), that.getSanPham());
    }
    
    public double tinhTienChiTietHoaDon() {
        return tinhGiaBan() * this.getSoLuong();
    }

    public String getTongTien() {
        UtilClass utilClass = new UtilClass();
        return utilClass.formatVND(this.tinhTienChiTietHoaDon());
    }
	@Override
	public String toString() {
		return "ChiTietHoaDon [id=" + id + ", sanPham=" + sanPham + ", hoaDon=" + hoaDon + ", soLuong=" + soLuong
				+ ", ngayMua=" + "]";
	}
    
}
