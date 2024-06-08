package com.example.demo.repository;

import com.example.demo.model.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HoaDonInterface extends JpaRepository<HoaDon,Integer> {
    List<HoaDon> findByTrangThai(String trangThai);
}
