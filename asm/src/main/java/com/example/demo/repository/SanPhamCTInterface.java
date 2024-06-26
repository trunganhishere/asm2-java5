package com.example.demo.repository;

import com.example.demo.model.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.ArrayList;
import java.util.List;

public interface SanPhamCTInterface extends JpaRepository<SanPhamChiTiet,Integer> {
    List<SanPhamChiTiet> findSanPhamChiTietByTrangThai(String trangThai);
}
