package com.example.demo.repository;

import com.example.demo.model.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DanhMucInterface extends JpaRepository<DanhMuc, Integer> {
}
