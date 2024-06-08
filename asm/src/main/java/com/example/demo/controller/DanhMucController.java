package com.example.demo.controller;

import com.example.demo.model.DanhMuc;
import com.example.demo.repository.DanhMucInterface;
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
public class DanhMucController {
    @Autowired
    DanhMucInterface dmrp;

    @GetMapping("/danh-muc")
    public String danhMuc(Model model,
                          @RequestParam(name="page",defaultValue = "0")int pageNo,
                          @RequestParam(name="limit",defaultValue = "5")int pageSize
                          ){
        PageRequest p=PageRequest.of(pageNo,pageSize);
        model.addAttribute("ds",dmrp.findAll(p));
        return "Danh-Muc";
    }
    @PostMapping("/danh-muc/add")
    public String add(@ModelAttribute("ds") DanhMuc dm){
        dm.setNgayTao(LocalDateTime.now());
        dm.setNgaySua(LocalDateTime.now());
        dmrp.save(dm);
        return  "redirect:/danh-muc";
    }
    @GetMapping ("/danh-muc/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        dmrp.delete(dmrp.getById(id));
        return  "redirect:/danh-muc";
    }
    @PostMapping("/danh-muc/update")
    public String update(@ModelAttribute("ds") DanhMuc dm, @RequestParam("id") Integer id){
        dm.setNgaySua(LocalDateTime.now());
        dm.setNgayTao(dmrp.getById(id).getNgayTao());
        dmrp.save(dm);
        return  "redirect:/danh-muc";
    }
    @GetMapping ("/danh-muc/edit")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("dm",dmrp.getOne(id));
        model.addAttribute("ds",dmrp.findAll());
        model.addAttribute("ds", dmrp.findAll(PageRequest.of(0, 3)));

        return "Danh-Muc";
    }
}
