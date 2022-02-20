package com.www.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

@Embeddable
public class ChiTietHoaDonPK implements Serializable {
	private int sanPhamId;
	private int hoaDonId;
	
	
	public int getSanPhamId() {
		return sanPhamId;
	}
	public void setSanPhamId(int sanPhamId) {
		this.sanPhamId = sanPhamId;
	}
	public int getHoaDonId() {
		return hoaDonId;
	}
	public void setHoaDonId(int hoaDonId) {
		this.hoaDonId = hoaDonId;
	}
	@Override
	public int hashCode() {
		return Objects.hash(hoaDonId, sanPhamId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChiTietHoaDonPK other = (ChiTietHoaDonPK) obj;
		return hoaDonId == other.hoaDonId && sanPhamId == other.sanPhamId;
	}
	
	
	
}
