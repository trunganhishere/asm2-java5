package com.example.demo.repository;

import com.example.demo.model.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KhachHangInterface extends JpaRepository<KhachHang,Integer> {
}
