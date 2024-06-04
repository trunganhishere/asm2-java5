package com.example.demo.controller;

import com.example.demo.model.*;
import com.example.demo.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class BanHangController {

    @Autowired
    SanPhamCTInterface spctrp;
    @Autowired
    DanhMucInterface dmrp;
    @Autowired
    SanPhamInterface sprp;
    @Autowired
    MauSacInterface msrp;
    @Autowired
    SizeInterface srp;
    @Autowired
    HoaDonInterface hdrp;
    @Autowired
    HDChiTietInterface hdctrp;
    @Autowired
    KhachHangInterface khrp;

    @GetMapping("/ban-hang")
    public String showBanHang(Model model) {
        model.addAttribute("sp", sprp.findAll());
        model.addAttribute("ms", msrp.findAll());
        model.addAttribute("s", srp.findAll());
        model.addAttribute("kh", khrp.findAll());
        model.addAttribute("ds", spctrp.findAll());
        model.addAttribute("hd", hdrp.findAll());

        return "trang-chu/trang-chu";
    }

    @PostMapping("/ban-hang/add")
    public String addHoaDonChiTiet(@RequestParam(name = "hoaDonId") Integer hoaDonId,
                                   @RequestParam(name = "sanPhamCTId") Integer sanPhamCTId,
                                   @RequestParam(name = "soLuong") int soLuong,Model model
    ) {

        HoaDon hoaDon = hdrp.findById(hoaDonId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid hoa don ID: " + hoaDonId));
        SanPhamChiTiet sanPhamCT = spctrp.findById(sanPhamCTId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid san pham chi tiet ID: " + sanPhamCTId));

        HoaDonChiTiet hdct = new HoaDonChiTiet();
        hdct.setHoaDon(hoaDon);
        hdct.setSanPhamChiTiet(sanPhamCT);
        hdct.setSoLuongMua(soLuong);
        model.addAttribute("sp", sprp.findAll());
        model.addAttribute("ms", msrp.findAll());
        model.addAttribute("s", srp.findAll());
        model.addAttribute("kh", khrp.findAll());
        model.addAttribute("ds", spctrp.findAll());
        model.addAttribute("hd", hdrp.findAll());
        hdctrp.save(hdct);

        return "redirect:/ban-hang";
    }

    @GetMapping("/ban-hang/detail")
    public String detailCT(@RequestParam("idHoaDon") Integer idHoaDon,
//                           @RequestParam(defaultValue = "0") int page,
//                           @RequestParam(defaultValue = "5") int size,
                           Model model) {
//        Pageable pageable = PageRequest.of(page, size);

        List<HoaDonChiTiet> listHDCT = hdctrp.findByHoaDon_Id(idHoaDon);

        BigDecimal totalAmount = listHDCT.stream()
                .map(HoaDonChiTiet::getTongTien)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        model.addAttribute("listCTSP", spctrp.findAll());
        model.addAttribute("listKhachHang", khrp.findAll());
        model.addAttribute("listHoaDon", hdrp.findAll());
//        model.addAttribute("currentPage", page);
//        model.addAttribute("totalPages", hdrp.findAll());
        model.addAttribute("listHDCT", listHDCT);
        model.addAttribute("hoaDon", hdrp.getById(idHoaDon));
//        model.addAttribute("totalAmount", totalAmount);
        model.addAttribute("sp", sprp.findAll());
        model.addAttribute("ms", msrp.findAll());
        model.addAttribute("s", srp.findAll());
        model.addAttribute("kh", khrp.findAll());
        model.addAttribute("ds", spctrp.findAll());
        model.addAttribute("hd", hdrp.findAll());
//        model.addAttribute("listHDCT", hdctrp.findAll());

        return "trang-chu/trang-chu";
    }
    @PostMapping("/ban-hang/addhd")
    public String add(@ModelAttribute("hd") HoaDon hd){
        hd.setNgayTao(LocalDateTime.now());
        hd.setNgaySua(LocalDateTime.now());
        hdrp.save(hd);
        return "redirect:/ban-hang";
    }
}
