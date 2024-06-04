package com.example.demo.repository;

import com.example.demo.model.HoaDonChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HDChiTietInterface extends JpaRepository<HoaDonChiTiet, Integer> {
    Page<HoaDonChiTiet> findByHoaDon_Id(Integer hoaDonId, Pageable pageable);

    List<HoaDonChiTiet> findByHoaDon_Id(Integer hoaDonId);
}
