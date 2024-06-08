package com.example.demo.controller;

import com.example.demo.model.DanhMuc;
import com.example.demo.model.HoaDon;
import com.example.demo.model.SanPham;
import com.example.demo.model.SanPhamChiTiet;
import com.example.demo.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;

@Controller
public class SPChiTietController {
    @Autowired
    SanPhamCTInterface spctrp;
    @Autowired
    SanPhamInterface sprp;
    @Autowired
    MauSacInterface msrp;
    @Autowired
    SizeInterface srp;

    @GetMapping("/spchi-tiet")
    public String hoaDon(Model model,
                         @RequestParam(name = "page", defaultValue = "0") int pageNo,
                         @RequestParam(name = "limit", defaultValue = "5") int pageSize
    ){
        PageRequest p = PageRequest.of(pageNo, pageSize);
        Page<SanPhamChiTiet> ds = this.spctrp.findAll(p);
        model.addAttribute("sp",sprp.findAll());
        model.addAttribute("ms",msrp.findAll());
        model.addAttribute("s",srp.findAll());
        model.addAttribute("ds",ds);
        return "SPChi-Tiet";
    }
    @PostMapping("/spchi-tiet/add")
    public String add(@ModelAttribute("s") SanPhamChiTiet spct){
        spct.setNgayTao(LocalDateTime.now());
        spct.setNgaySua(LocalDateTime.now());
        spctrp.save(spct);
        return  "redirect:/spchi-tiet";
    }
    @GetMapping ("/spchi-tiet/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        spctrp.delete(spctrp.getById(id));
        return  "redirect:/spchi-tiet";
    }
    @PostMapping("/spchi-tiet/update")
    public String update(@ModelAttribute("ds") SanPhamChiTiet spct, @RequestParam("id") Integer id){
        spct.setNgaySua(LocalDateTime.now());
        spct.setNgayTao(spctrp.getById(id).getNgayTao());
        spctrp.save(spct);
        return  "redirect:/spchi-tiet";
    }
    @GetMapping ("/spchi-tiet/edit")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("spct",spctrp.getOne(id));
        model.addAttribute("sp", sprp.findAll());
        model.addAttribute("ms", msrp.findAll());
        model.addAttribute("s", srp.findAll());
        model.addAttribute("ds", spctrp.findAll(PageRequest.of(0, 3)));
        return "SPChi-Tiet";
    }
}
