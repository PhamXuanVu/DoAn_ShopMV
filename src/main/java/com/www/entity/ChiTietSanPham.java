package com.www.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "chi_tiet_san_pham")
public class ChiTietSanPham {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int chiTietSanPhamId;
	
    
	@OneToOne(mappedBy = "chiTietSanPham", cascade = CascadeType.ALL)
    private SanPham sanPham;

	
}
