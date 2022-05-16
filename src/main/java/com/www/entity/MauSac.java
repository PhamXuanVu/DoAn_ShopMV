package com.www.entity;

import java.util.Objects;

import javax.persistence.Embeddable;

import org.hibernate.annotations.Nationalized;

@Embeddable
public class MauSac {
	
	@Nationalized
	private String tenMau;

	public String getTenMau() {
		return tenMau;
	}

	public void setTenMau(String tenMau) {
		this.tenMau = tenMau;
	}

	public MauSac() {
	}

	@Override
	public int hashCode() {
		return Objects.hash(tenMau);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MauSac other = (MauSac) obj;
		return Objects.equals(tenMau, other.tenMau);
	}

	public MauSac(String tenMau) {
		super();
		this.tenMau = tenMau;
	}
	
	
	
}
