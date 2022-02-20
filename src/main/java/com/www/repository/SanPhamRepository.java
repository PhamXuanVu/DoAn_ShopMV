package com.www.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.SanPham;

@Repository
public interface SanPhamRepository extends CrudRepository<SanPham, Integer> {
	@Query(value = "select * from [dbo].[san_pham] where [danhMucId]=?1",nativeQuery = true)
	List<SanPham> getSanPhamByDanhMucId(int id);
}
