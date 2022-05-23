package com.www.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.HoaDon;

@Repository
public interface HoaDonRepository extends CrudRepository<HoaDon, Integer> {

	@Query(name = "select * from [dbo].[hoa_don] h join [dbo].[chi_tiet_san_pham_hoa_don] c on h.hoaDonId = c.hoa_don_san_pham_id where h.hoaDonId = ?1",nativeQuery = true)
	List<HoaDon> findHoaDonsBychiTietSanPhamHoaDons(int id);

}
