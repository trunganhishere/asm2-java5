package com.example.demo.controller;

import com.example.demo.model.HoaDon;
import com.example.demo.model.KhachHang;
import com.example.demo.repository.HoaDonInterface;
import com.example.demo.repository.KhachHangInterface;
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
public class HoaDonController {
    @Autowired
    HoaDonInterface hdrp;
    @Autowired
    KhachHangInterface khrp;

    @GetMapping("/hoa-don")
    public String hoaDon(Model model,
                         @RequestParam(name = "page", defaultValue = "0") int pageNo,
                         @RequestParam(name = "limit", defaultValue = "5") int pageSize){
        PageRequest p = PageRequest.of(pageNo, pageSize);
        Page<HoaDon> ds = this.hdrp.findAll(p);
        model.addAttribute("kh", khrp.findAll());
        model.addAttribute("ds", ds);
        return "Hoa-Don";
    }

    @PostMapping("/hoa-don/add")
    public String add(@ModelAttribute("hd") HoaDon hd){
        hd.setNgayTao(LocalDateTime.now());
        hd.setNgaySua(LocalDateTime.now());
        hdrp.save(hd);
        return "redirect:/hoa-don";
    }

    @GetMapping("/hoa-don/delete")
    public String delete(@RequestParam("id") Integer id){
        hdrp.delete(hdrp.getById(id));
        return "redirect:/hoa-don";
    }

    @PostMapping("/hoa-don/update")
    public String update(@ModelAttribute("hd") HoaDon hd, @RequestParam("id") Integer id){
        HoaDon existingHd = hdrp.getById(id);
        hd.setNgaySua(LocalDateTime.now());
        hd.setNgayTao(existingHd.getNgayTao());
        hdrp.save(hd);
        return "redirect:/hoa-don";
    }

    @GetMapping("/hoa-don/edit")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("hd", hdrp.getOne(id));
        model.addAttribute("kh", khrp.findAll());
        model.addAttribute("ds", hdrp.findAll(PageRequest.of(0, 3)));
        return "Hoa-Don";
    }
}
