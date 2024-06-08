package com.example.demo.controller;

import com.example.demo.model.DanhMuc;
import com.example.demo.model.Size;
import com.example.demo.repository.DanhMucInterface;
import com.example.demo.repository.SanPhamInterface;
import com.example.demo.repository.SizeInterface;
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
public class SizeController {
    @Autowired
    SizeInterface srp;

    @GetMapping("/size")
    public String danhMuc(Model model,
                          @RequestParam(name="page",defaultValue = "0")int pageNo,
                          @RequestParam(name="limit",defaultValue = "5")int pageSize
                          ){
        PageRequest p=PageRequest.of(pageNo,pageSize);
        model.addAttribute("ds",srp.findAll(p));
        return "Size";
    }
    @PostMapping("/size/add")
    public String add(@ModelAttribute("ds") Size s){
        s.setNgayTao(LocalDateTime.now());
        s.setNgaySua(LocalDateTime.now());
        srp.save(s);
        return  "redirect:/size";
    }
    @GetMapping ("/size/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        srp.delete(srp.getById(id));
        return  "redirect:/size";
    }
    @PostMapping("/size/update")
    public String update(@ModelAttribute("ds") Size s, @RequestParam("id") Integer id){
        s.setNgaySua(LocalDateTime.now());
        s.setNgayTao(srp.getById(id).getNgayTao());
        srp.save(s);
        return  "redirect:/size";
    }
    @GetMapping ("/size/edit")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("s",srp.getOne(id));
        model.addAttribute("ds",srp.findAll());
        model.addAttribute("ds", srp.findAll(PageRequest.of(0, 3)));
        return "Size";
    }
}
