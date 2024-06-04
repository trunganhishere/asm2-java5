package com.example.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
@Entity
@Table(name="san_pham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;
    @Column(name="ma_san_pham")
    private String maSanPham;
    @Column(name="ten_san_pham")
    private String tenSanPham;
    @Column(name="trang_thai")
    private String trangThai;
    @Column(name="ngay_tao")
//    @Temporal(TemporalType.DATE)
    private LocalDateTime     ngayTao;
    @Column(name="ngay_sua")
//    @Temporal(TemporalType.DATE)
    private LocalDateTime ngaySua;
    @ManyToOne
    @JoinColumn(name="id_danh_muc")
    private DanhMuc danhMuc;
}
