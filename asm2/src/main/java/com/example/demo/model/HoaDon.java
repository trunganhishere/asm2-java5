package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name="hoa_don")
public class HoaDon {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name="id")
        private Integer id;

        @ManyToOne
        @JoinColumn(name="id_khach_hang")
        private KhachHang khachHang;

        @Column(name="trang_thai")
        private String trangThai;

        @Column(name="ngay_tao")
        private LocalDateTime ngayTao;

        @Column(name="ngay_sua")
        private LocalDateTime ngaySua;

        @Column(name="dia_chi")
        private String diaChi;

        @Column(name="so_dien_thoai")
        private String sdt;

}
