package com.www.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.ChiTietSanPham;
import com.www.entity.KichCo;

@Repository
public interface ChiTietSanPhamRepository extends CrudRepository<ChiTietSanPham, Integer> {
	
}
