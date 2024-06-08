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
@Table(name="hdct")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="so_luong_mua")
    private int soLuongMua;

    @Column(name="trang_thai")
    private String trangThai;

    @Column(name="tong_tien")
    private BigDecimal tongTien;

    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;

    @Column(name="ngay_sua")
    private LocalDateTime ngaySua;




    // Getter and Setter for soLuongMua
    public int getSoLuongMua() {
        return soLuongMua;
    }

    public void setSoLuongMua(int soLuongMua) {
        this.soLuongMua = soLuongMua;
    }

    @ManyToOne
    @JoinColumn(name="id_hoa_don")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name="id_ctsp")
    private SanPhamChiTiet sanPhamChiTiet;
}
