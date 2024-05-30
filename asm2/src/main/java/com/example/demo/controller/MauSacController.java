package com.example.demo.controller;

import com.example.demo.model.DanhMuc;
import com.example.demo.model.MauSac;
import com.example.demo.repository.DanhMucInterface;
import com.example.demo.repository.MauSacInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;

@Controller
public class MauSacController {
    @Autowired
    MauSacInterface msrp;

    @GetMapping("/mau-sac")
    public String mauSac(Model model){
        model.addAttribute("ds",msrp.findAll());
        return "viewMauSac";
    }
    @PostMapping("/mau-sac/add")
    public String add(@ModelAttribute("ds") MauSac ms){
        ms.setNgayTao(LocalDateTime.now());
        ms.setNgaySua(LocalDateTime.now());
        msrp.save(ms);
        return  "redirect:/mau-sac";
    }
    @GetMapping ("/mau-sac/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        msrp.delete(msrp.getById(id));
        return  "redirect:/mau-sac";
    }
    @PostMapping("/mau-sac/update")
    public String update(@ModelAttribute("ds") MauSac ms, @RequestParam("id") Integer id){
        ms.setNgaySua(LocalDateTime.now());
        ms.setNgayTao(msrp.getById(id).getNgayTao());
        msrp.save(ms);
        return  "redirect:/mau-sac";
    }
    @GetMapping ("/mau-sac/detail")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("ms",msrp.getOne(id));
        model.addAttribute("ds",msrp.findAll());
        return "viewMauSac";
    }
}
