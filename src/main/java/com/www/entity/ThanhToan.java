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
@Table(name = "thanh_toan")
public class ThanhToan {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int thanhToanId;
	
	@Nationalized
	private String tenPhuongThuc;
	
	@OneToMany(mappedBy = "thanhToan", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<ChiTietHoaDon> hoaDons;
}
