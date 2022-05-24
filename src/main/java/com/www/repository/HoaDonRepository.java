package com.www.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.HoaDon;

@Repository
public interface HoaDonRepository extends CrudRepository<HoaDon, Integer> {
	@Query(name = "select * from [dbo].[hoa_don] where [nguoiDungId] = ?1", nativeQuery = true)
	List<HoaDon> findHoaDonsByNguoiDungId(int id);
	
	@Query(name = "select * from [dbo].[hoa_don] h join [dbo].[chi_tiet_san_pham_hoa_don] c on c.hoa_don_san_pham_id= h.hoaDonId where c.cuaHangId =?1", nativeQuery = true)
	List<HoaDon> findHoaDonsByChiTietSanPhamHoaDons(int cuaHangId);
}
