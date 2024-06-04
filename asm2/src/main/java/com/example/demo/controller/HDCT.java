package com.example.demo.controller;

import com.example.demo.model.HoaDonChiTiet;
import com.example.demo.repository.HDChiTietInterface;
import com.example.demo.repository.HoaDonInterface;
import com.example.demo.repository.SanPhamCTInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Controller
public class HDCT {

    @Autowired
    private HoaDonInterface hdrp;

    @Autowired
    private SanPhamCTInterface spctrp;

    @Autowired
    private HDChiTietInterface hdctrp;

    @GetMapping("/hdchi-tiet")
    public String hdct(@RequestParam("idHoaDon") Integer idHoaDon,
                       @RequestParam(defaultValue = "0") int page,
                       Model model) {
        int pageSize = 5;
        Pageable pageable = PageRequest.of(page, pageSize);
        Page<HoaDonChiTiet> hdctPage = hdctrp.findByHoaDon_Id(idHoaDon, pageable);
        int totalPages = hdctPage.getTotalPages();

        model.addAttribute("listCTSP", spctrp.findAll());
        model.addAttribute("listHDCT", hdctPage.getContent());
        model.addAttribute("idHoaDon", idHoaDon);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "/hdchi-tiet/HDChi-Tiet";
    }

    @PostMapping("/hdchi-tiet/add")
    public String add(@ModelAttribute("hdct") HoaDonChiTiet hdct,
                      @RequestParam("idHoaDon") Integer idHoaDon,
                      @RequestParam("soLuongMua") Integer soLuongMua,
                      @RequestParam("giaBan") BigDecimal giaBan,
                      Model model) {
        hdct.setNgayTao(LocalDateTime.now());
        hdct.setNgaySua(LocalDateTime.now());
        hdct.setHoaDon(hdrp.getById(idHoaDon));
        hdct.setTongTien(giaBan.multiply(BigDecimal.valueOf(soLuongMua)));
        hdct.setSoLuongMua(soLuongMua);

        model.addAttribute("idHoaDon", idHoaDon);

        hdctrp.save(hdct);
        return "redirect:/hdchi-tiet?idHoaDon=" + idHoaDon;
    }

    @GetMapping("/hdchi-tiet/detail")
    public String detail(@RequestParam("idHoaDon") Integer idHoaDon,
                         @RequestParam("id") Integer id,
                         Model model) {
        model.addAttribute("hdct", hdctrp.findById(id).orElse(null));
        model.addAttribute("listCTSP", spctrp.findAll());
        model.addAttribute("idHoaDon", idHoaDon);
        return "/hdchi-tiet/HDChi-Tiet";
    }

    @GetMapping("/hdchi-tiet/delete")
    public String delete(@RequestParam("idHoaDon") Integer idHoaDon,
                         @RequestParam("id") Integer id,
                         Model model) {
        hdctrp.deleteById(id);
        model.addAttribute("idHoaDon", idHoaDon);
        return "redirect:/hdchi-tiet?idHoaDon=" + idHoaDon;
    }
}
