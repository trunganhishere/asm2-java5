package com.example.demo.controller;

import com.example.demo.model.KhachHang;
import com.example.demo.model.SanPham;
import com.example.demo.repository.KhachHangInterface;
import com.example.demo.repository.SanPhamInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.Date;

@Controller
public class KhachHangController {
    @Autowired
    KhachHangInterface khi;

    @GetMapping("/khach-hang")
    public String getAll(Model model){
        model.addAttribute("ds",khi.findAll());
        return "viewKhachHang";
    }
    @PostMapping("/khach-hang/add")
    public String add(@ModelAttribute("ds") KhachHang kh, Model model){
        kh.setNgayTao(new Date());
        kh.setNgaySua(new Date());
        khi.save(kh);
        return  "redirect:/khach-hang";
    }
    @GetMapping ("/khach-hang/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        khi.delete(khi.getById(id));
        return  "redirect:/khach-hang";
    }
    @PostMapping("/khach-hang/update")
    public String update(@ModelAttribute("ds") KhachHang kh, @RequestParam("id") Integer id){
        kh.setNgaySua(new Date());
        kh.setNgayTao(khi.getById(id).getNgayTao());
        khi.save(kh);
        return  "redirect:/khach-hang";
    }
    @GetMapping ("/khach-hang/detail")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("kh",khi.getOne(id));
        model.addAttribute("ds",khi.findAll());
        return "viewKhachHang";
    }
}
