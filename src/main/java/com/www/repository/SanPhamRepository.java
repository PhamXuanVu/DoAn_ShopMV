package com.www.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.SanPham;

@Repository
public interface SanPhamRepository extends CrudRepository<SanPham, Integer> {

}
