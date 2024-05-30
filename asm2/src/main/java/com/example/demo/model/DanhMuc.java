package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name="danh_muc")
public class DanhMuc {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name="id")
        private Integer id;
        @Column(name="ma_danh_muc")
        private String maDanhMuc;
        @Column(name="ten_danh_muc")
        private String tenDanhMuc;
        @Column(name="trang_thai")
        private String trangThai;
        @Column(name="ngay_tao")
        private LocalDateTime ngayTao;
        @Column(name="ngay_sua")
        private LocalDateTime  ngaySua;
}
