package com.www.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.HoaDon;

@Repository
public interface HoaDonRepository extends CrudRepository<HoaDon, Integer> {

}
