package com.www.repository;

import com.www.entity.VaiTro;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends CrudRepository<VaiTro, Integer> {
    VaiTro findByTenVaiTro(String tenVaiTro);
}
