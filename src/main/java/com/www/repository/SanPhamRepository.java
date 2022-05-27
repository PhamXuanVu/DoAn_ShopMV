package com.www.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.SanPham;

@Repository
public interface SanPhamRepository extends CrudRepository<SanPham, Integer> {
	@Query(value = "select * from san_pham where danhMucId=?1",nativeQuery = true)
	List<SanPham> getSanPhamByDanhMucId(int id);
	
	@Query(value = "select * from san_pham where cuaHangId=?1",nativeQuery = true)
	List<SanPham> getSanPhamByCuaHangId(int id);
	
	@Query(value = "select * from san_pham s join cua_hang c on s.cuaHangId = c.cuaHangId where tenSanPham like ?1 or tenCuaHang like ?1",nativeQuery = true)
	List<SanPham> getSanPhamByTenSanPham(String tenSanPham);
	
	@Query(value = "select * from san_pham where soLuong <=5",nativeQuery = true)
	List<SanPham> getSanPhamNoiBat();
	
	@Query(value = "select * from san_pham order by sanPhamId desc limit 8",nativeQuery = true)
	List<SanPham> getSanPhamMoi();
	
	@Query(value = "select * from san_pham where danhMucId = ?1 and soLuong <=5 ",nativeQuery = true)
	List<SanPham> getSanPhamNoiBatByDanhMuc(int cuaHangId);
	
}
