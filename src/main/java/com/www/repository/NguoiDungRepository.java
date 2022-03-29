package com.www.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.NguoiDung;
import com.www.entity.TaiKhoan;

@Repository
public interface NguoiDungRepository extends CrudRepository<NguoiDung, String> {
	NguoiDung findByTaiKhoan(TaiKhoan taiKhoan);
    List<NguoiDung> findByHoTenDem(String hoTenDem);
    List<NguoiDung> findAll();
    NguoiDung findById(int id);
    
}
