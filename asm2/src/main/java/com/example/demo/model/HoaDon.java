package com.example.demo.model;

import jakarta.persistence.*;
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

    @Column(name="trang_thai")
    private String trangThai;
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;
    @Column(name="ngay_sua")
    private LocalDateTime ngaySua;


    @ManyToOne
    @JoinColumn(name="id_khach_hang")

    private KhachHang khachHang;
}
