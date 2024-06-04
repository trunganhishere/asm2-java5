package com.example.demo.repository;

import com.example.demo.model.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SanPhamCTInterface extends JpaRepository<SanPhamChiTiet,Integer> {
}
