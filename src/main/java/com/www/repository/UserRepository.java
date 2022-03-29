package com.www.repository;


import com.www.entity.TaiKhoan;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<TaiKhoan, Integer> {
    TaiKhoan findByEmail(String email);
    
}
