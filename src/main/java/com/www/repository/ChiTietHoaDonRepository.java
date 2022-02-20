package com.www.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.ChiTietHoaDon;

@Repository
public interface ChiTietHoaDonRepository extends CrudRepository<ChiTietHoaDon, Integer> {

}
