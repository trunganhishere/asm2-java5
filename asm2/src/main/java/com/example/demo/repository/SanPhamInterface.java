package com.example.demo.repository;

import com.example.demo.model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SanPhamInterface extends JpaRepository<SanPham,Integer> {

}
