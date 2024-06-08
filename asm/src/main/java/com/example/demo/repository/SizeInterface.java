package com.example.demo.repository;

import com.example.demo.model.Size;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SizeInterface extends JpaRepository<Size,Integer> {
}
