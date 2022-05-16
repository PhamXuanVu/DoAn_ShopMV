package com.www.entity;

import java.util.Objects;

import javax.persistence.Embeddable;

import org.hibernate.annotations.Nationalized;

@Embeddable
public class KichCo {
	
	@Nationalized
	private String tenKichCo;

	public String getTenKichCo() {
		return tenKichCo;
	}

	public void setTenKichCo(String tenKichCo) {
		this.tenKichCo = tenKichCo;
	}

	public KichCo() {
	}

	@Override
	public int hashCode() {
		return Objects.hash(tenKichCo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		KichCo other = (KichCo) obj;
		return Objects.equals(tenKichCo, other.tenKichCo);
	}

	public KichCo(String tenKichCo) {
		this.tenKichCo = tenKichCo;
	}
	
	
}
