package com.example.demo.controller;

import com.example.demo.model.KhachHang;
import com.example.demo.model.SanPham;
import com.example.demo.repository.KhachHangInterface;
import com.example.demo.repository.SanPhamInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;

@Controller
public class KhachHangController {
    @Autowired
    KhachHangInterface khi;

    @GetMapping("/khach-hang")
    public String getAll(Model model,
                         @RequestParam(name="page",defaultValue = "0")int pageNo,
                         @RequestParam(name="limit",defaultValue = "5")int pageSize
    ){
        PageRequest p=PageRequest.of(pageNo,pageSize);
        model.addAttribute("ds",khi.findAll(p));
        return "khach-hang/Khach-Hang";
    }
    @PostMapping("/khach-hang/add")
    public String add(@ModelAttribute("ds") KhachHang kh, Model model){
        kh.setNgayTao(LocalDateTime.now());
        kh.setNgaySua(LocalDateTime.now());
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
        kh.setNgaySua(LocalDateTime.now());
        kh.setNgayTao(khi.getById(id).getNgayTao());
        khi.save(kh);
        return  "redirect:/khach-hang";
    }
    @GetMapping ("/khach-hang/detail")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("kh",khi.getOne(id));
        model.addAttribute("ds",khi.findAll());
        model.addAttribute("ds", khi.findAll(PageRequest.of(0, 3)));
        return "khach-hang/Khach-Hang";
    }
}
