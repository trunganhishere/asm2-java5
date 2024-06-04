package com.example.demo.controller;

import com.example.demo.model.DanhMuc;
import com.example.demo.model.SanPham;
import com.example.demo.repository.DanhMucInterface;
import com.example.demo.repository.SanPhamInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class SanPhamController {
    @Autowired
    SanPhamInterface sprp;
    @Autowired
    DanhMucInterface dmrp;

    @GetMapping("/san-pham")
    public String sanPham(
            @RequestParam(name = "page", defaultValue = "0") int pageNo,
           @RequestParam(name = "limit", defaultValue = "5") int pageSize,
            Model model)
    {
        PageRequest p = PageRequest.of(pageNo, pageSize);
        Page<SanPham> ds = this.sprp.findAll(p);
        model.addAttribute("ds", ds);
        model.addAttribute("dm", dmrp.findAll());
        return "san-pham/San-Pham";
    }


    @PostMapping("/san-pham/add")
    public String add(@ModelAttribute("ds") SanPham sp) {
        sp.setNgayTao(LocalDateTime.now());
        sp.setNgaySua(LocalDateTime.now());
        sprp.save(sp);
        return "redirect:/san-pham?page=0";
    }

    @GetMapping("/san-pham/delete")
    public String delete(@RequestParam("id") Integer id) {
        sprp.deleteById(id);
        return "redirect:/san-pham?page=0";
    }

    @PostMapping("/san-pham/update")
    public String update(@ModelAttribute("ds") SanPham sp, @RequestParam("id") Integer id) {
        sp.setNgaySua(LocalDateTime.now());
        sp.setNgayTao(sprp.findById(id).orElseThrow().getNgayTao());
        sprp.save(sp);
        return "redirect:/san-pham";
    }

    @GetMapping("/san-pham/edit")
    public String edit(@RequestParam("id") Integer id, Model model) {
        SanPham sanPham = sprp.findById(id).orElseThrow();
        model.addAttribute("sp", sanPham);
        model.addAttribute("dm", dmrp.findAll());
        model.addAttribute("ds", sprp.findAll(PageRequest.of(0, 3)));

        return "san-pham/San-Pham";
    }
}
