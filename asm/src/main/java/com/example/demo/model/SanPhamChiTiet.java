package com.example.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name="ctsp")
public class SanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;
    @Column(name="gia_ban")
    private BigDecimal giaBan;
    @Column(name="so_luong_ton")
    private int soLuong;
    @Column(name="trang_thai")
    private String trangThai;
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;
    @Column(name="ngay_sua")
    private LocalDateTime ngaySua;

    public BigDecimal getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(BigDecimal giaBan) {
        this.giaBan = giaBan;
    }

    //
//    public double getGiaBan() {
//        return giaBan;
//    }
//
//    public void setGiaBan(double giaBan) {
//        this.giaBan = giaBan;
//    }
//join Sản phẩm
    @ManyToOne
    @JoinColumn(name="id_sp")
    private SanPham sanPham;
    //join Màu sắc
    @ManyToOne
    @JoinColumn(name="id_mau_sac")
    private MauSac mauSac;
    // join size
    @ManyToOne
    @JoinColumn(name="id_size")
    private Size size;
}
