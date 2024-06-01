
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.Date;

@Controller
    public class SanPhamController {
        @Autowired
        SanPhamInterface spi;

        @Autowired
        DanhMucInterface dmi;

        @GetMapping("/san-pham")
        public String getAll(Model model ,@RequestParam("page") Integer page){
            Pageable pageable = PageRequest.of(page,5);
            Page<SanPham> list = spi.findAll(pageable);
            model.addAttribute("ds",list);
            model.addAttribute("dm",dmi.findAll());
            return "viewSanPham";
        }
        @PostMapping("/san-pham/add")
        public String add(@ModelAttribute("ds") SanPham sp){
            sp.setNgayTao(new Date());
            sp.setNgaySua(new Date());
            spi.save(sp);
            return  "redirect:/san-pham?page=0";
        }
        @GetMapping ("/san-pham/delete")
        public String delete(@RequestParam("id") Integer id, Model model){
            spi.delete(spi.getById(id));
            return  "redirect:/san-pham?page=0";
        }
        @PostMapping("/san-pham/update")
        public String update(@ModelAttribute("ds") SanPham sp, @RequestParam("id") Integer id){
            sp.setNgaySua(new Date());
            sp.setNgayTao(spi.getById(id).getNgayTao());
            spi.save(sp);
            return  "redirect:/san-pham?page=0";
        }
        @GetMapping ("/san-pham/detail")
        public String edit(@RequestParam("id") Integer id, Model model){
            model.addAttribute("sp",spi.getOne(id));
            model.addAttribute("ds",spi.findAll());
            model.addAttribute("dm",dmi.findAll());
            return "viewSanPham";
        }
    }
