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
@Table(name = "mau_sac")
public class MauSac {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;
    @Column(name="ma_mau")
    private String maMau;
    @Column(name="ten_mau")
    private String tenMau;
    @Column(name="trang_thai")
    private String trangThai;
    @Column(name="ngay_tao")
    @Temporal(TemporalType.DATE)
    private Date ngayTao;
    @Column(name="ngay_sua")
    @Temporal(TemporalType.DATE)
    private Date  ngaySua;
}
