package com.example.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
@Entity
@Table(name = "khach_hang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private String id;
    @Column(name="ho_ten")
    private String hoTen;
    @Column(name="dia_chi")
    private String diaChi;
    @Column(name="sdt")
    private String sdt;
    @Column(name="trang_thai")
    private String trangThai;
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;
    @Column(name="ngay_sua")
    private LocalDateTime  ngaySua;
}
