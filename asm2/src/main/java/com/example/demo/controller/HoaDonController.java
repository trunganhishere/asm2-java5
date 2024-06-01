package com.example.demo.controller;

import com.example.demo.model.HoaDon;
import com.example.demo.repository.HoaDonInterface;
import com.example.demo.repository.KhachHangInterface;
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
public class HoaDonController {
    @Autowired
    HoaDonInterface hdrp;

    @GetMapping("/hoa-don")
    public String hoaDon(Model model){
        model.addAttribute("ds",hdrp.findAll());
        return "viewHoaDon";
    }
    @PostMapping("/hoa-don/add")
    public String add(@ModelAttribute("ds") HoaDon hd){
        hd.setNgayTao(new Date());
        hd.setNgaySua(new Date());
        hdrp.save(hd);
        return  "redirect:/hoa-don";
    }
    @GetMapping ("/hoa-don/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        hdrp.delete(hdrp.getById(id));
        return  "redirect:/hoa-don";
    }
    @PostMapping("/hoa-don/update")
    public String update(@ModelAttribute("ds") HoaDon hd, @RequestParam("id") Integer id){
        hd.setNgaySua(new Date());
        hd.setNgayTao(hdrp.getById(id).getNgayTao());
        hdrp.save(hd);
        return  "redirect:/hoa-don";
    }
    @GetMapping ("/hoa-don/edit")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("dm",hdrp.getOne(id));
        model.addAttribute("ds",hdrp.findAll());
        return "viewHoaDon";
    }
}
