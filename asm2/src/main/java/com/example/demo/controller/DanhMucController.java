package com.example.demo.controller;

import com.example.demo.model.DanhMuc;
import com.example.demo.repository.DanhMucInterface;
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
public class DanhMucController {
    @Autowired
    DanhMucInterface dmi;

    @GetMapping("/danh-muc")
    public String getAll(Model model){
        model.addAttribute("dm",dmi.findAll());
        return "viewDanhMuc";
    }

    @PostMapping("/danh-muc/add")
    public String add(@ModelAttribute("dm") DanhMuc dm){
        dm.setNgayTao(new Date());
        dm.setNgaySua(new Date());
        dmi.save(dm);
        return  "redirect:/danh-muc";
    }
    @GetMapping ("/danh-muc/delete")
    public String delete(@RequestParam("id") Integer id){
        dmi.delete(dmi.getById(id));
        return  "redirect:/danh-muc";
    }
    @PostMapping("/danh-muc/update")
    public String update(@ModelAttribute("dm") DanhMuc dm, @RequestParam("id") Integer id){
        dm.setNgaySua(new Date());
        dm.setNgayTao(dmi.getById(id).getNgayTao());
        dmi.save(dm);
        return  "redirect:/danh-muc";
    }
    @GetMapping ("/danh-muc/detail")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("go",dmi.getOne(id));
        model.addAttribute("dm",dmi.findAll());
        return "viewDanhMuc";
    }

}
