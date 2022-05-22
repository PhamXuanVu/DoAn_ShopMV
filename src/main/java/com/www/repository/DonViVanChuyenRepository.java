package com.www.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.DonViVanChuyen;

@Repository
public interface DonViVanChuyenRepository extends CrudRepository<DonViVanChuyen, Integer>{

}
