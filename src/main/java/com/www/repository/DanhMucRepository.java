package com.www.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.DanhMuc;

@Repository
public interface DanhMucRepository extends CrudRepository<DanhMuc, Integer>{
	@Query(value = "select * from [dbo].[danh_muc] where [tenDanhMuc] = ?1",nativeQuery = true)
	DanhMuc findByTenDanhMuc(String name);
}
