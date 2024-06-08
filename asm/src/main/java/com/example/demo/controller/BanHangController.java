package com.example.demo.controller;

import com.example.demo.model.*;
import com.example.demo.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class BanHangController {

    @Autowired
    SanPhamCTInterface spctrp;
    @Autowired
    DanhMucInterface dmrp;
    @Autowired
    SanPhamInterface sprp;
    @Autowired
    MauSacInterface msrp;
    @Autowired
    SizeInterface srp;
    @Autowired
    HoaDonInterface hdrp;
    @Autowired
    HDChiTietInterface hdctrp;
    @Autowired
    KhachHangInterface khrp;

    @GetMapping("/ban-hang")
    public String showBanHang(Model model) {
        model.addAttribute("sp", sprp.findAll());
        model.addAttribute("ms", msrp.findAll());
        model.addAttribute("s", srp.findAll());
        model.addAttribute("kh", khrp.findAll());
        model.addAttribute("ds", spctrp.findAll());
        model.addAttribute("hd", hdrp.findByTrangThai("Pending"));

        return "trang-chu";
    }

    @PostMapping("/ban-hang/add")
    public String addHoaDonChiTiet(@RequestParam(name = "hoaDonId") Integer hoaDonId,
                                   @RequestParam(name = "sanPhamCTId") Integer sanPhamCTId,
                                   @RequestParam(name = "soLuong") int soLuong,Model model
    ) {

        HoaDon hoaDon = hdrp.findById(hoaDonId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid hoa don ID: " + hoaDonId));
        SanPhamChiTiet sanPhamCT = spctrp.findById(sanPhamCTId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid san pham chi tiet ID: " + sanPhamCTId));

        HoaDonChiTiet hdct = new HoaDonChiTiet();
        hdct.setHoaDon(hoaDon);
        hdct.setSanPhamChiTiet(sanPhamCT);
        hdct.setSoLuongMua(soLuong);
        model.addAttribute("sp", sprp.findAll());
        model.addAttribute("ms", msrp.findAll());
        model.addAttribute("s", srp.findAll());
        model.addAttribute("kh", khrp.findAll());
        model.addAttribute("ds", spctrp.findAll());
        model.addAttribute("hd", hdrp.findAll());
        hdctrp.save(hdct);

        return "redirect:/ban-hang";
    }

    @GetMapping("/ban-hang/hoa-don/delete")
    public String delete(@RequestParam("id") Integer id){
        HoaDon hd = hdrp.getReferenceById(id);
        hdctrp.findByHoaDon_Id(hd.getId());
        for (int i = 0 ; i < hdctrp.findByHoaDon_Id(hd.getId()).size(); i ++){
            for (int z = 0 ; z < spctrp.findAll().size() ; z ++){
                if (hdctrp.findByHoaDon_Id(hd.getId()).get(i).getSanPhamChiTiet().getId().equals(spctrp.findAll().get(z).getId())){
                    int soLuongMua = hdctrp.findByHoaDon_Id(hd.getId()).get(i).getSoLuongMua();
                    int soLuongMoi = spctrp.findAll().get(z).getSoLuong() + soLuongMua;
                    spctrp.findAll().get(z).setSoLuong(soLuongMoi);
                    spctrp.save(spctrp.findAll().get(z));
                }

            }

        }
        hdrp.delete(hdrp.getById(id));

        return "redirect:/ban-hang";
    }

@GetMapping("/ban-hang/detail")
public String detailCT(@RequestParam("idHoaDon") Integer idHoaDon, Model model) {
    HoaDon hoaDon = hdrp.findById(idHoaDon).orElse(null);
    List<HoaDonChiTiet> listHDCT = hdctrp.findByHoaDon_Id(idHoaDon);

    BigDecimal totalAmount = listHDCT.stream()
            .map(hdct -> hdct.getSanPhamChiTiet().getGiaBan().multiply(BigDecimal.valueOf(hdct.getSoLuongMua())))
            .reduce(BigDecimal.ZERO, BigDecimal::add);

    model.addAttribute("hoaDon", hoaDon);
    model.addAttribute("listHDCT", listHDCT);
    model.addAttribute("totalAmount", totalAmount);
    model.addAttribute("listCTSP", spctrp.findAll());
    model.addAttribute("listKhachHang", khrp.findAll());
    model.addAttribute("listHoaDon", hdrp.findAll());
    model.addAttribute("sp", sprp.findAll());
    model.addAttribute("ms", msrp.findAll());
    model.addAttribute("s", srp.findAll());
    model.addAttribute("kh", khrp.findAll());
    model.addAttribute("ds", spctrp.findAll());
    model.addAttribute("hdct", hdctrp.findAll());
    model.addAttribute("hd", hdrp.findByTrangThai("Pending"));
    return "trang-chu";
}

    @PostMapping("/ban-hang/addhd")
    public String add(@ModelAttribute("hd") HoaDon hd){
        hd.setNgayTao(LocalDateTime.now());
        hd.setNgaySua(LocalDateTime.now());
        hd.setTrangThai("Pending");
        hdrp.save(hd);
        return "redirect:/ban-hang";
    }
    @PostMapping("/ban-hang/addsp")
    public String addsp(Model model,
                        @RequestParam("idHoaDon")Integer idHoaDon,
                        @RequestParam("soLuong")Integer soLuong,
                        @RequestParam("idSanPhamCT")Integer idSanPhamCT,
                        @ModelAttribute("hdct")HoaDonChiTiet hdct

                        ){
        hdct.setHoaDon(hdrp.getById(idHoaDon));
        hdct.setSanPhamChiTiet(spctrp.getById(idSanPhamCT));
        hdct.setNgaySua(LocalDateTime.now());
        hdct.setNgayTao(LocalDateTime.now());
        hdct.setTrangThai("Active");
        hdct.setSoLuongMua(soLuong);
        SanPhamChiTiet ctsp=spctrp.getById(idSanPhamCT);
        ctsp.setSoLuong(ctsp.getSoLuong()-soLuong);
        spctrp.save(ctsp);
         ctsp.setGiaBan(spctrp.getById(idSanPhamCT).getGiaBan());
        hdct.setTongTien(BigDecimal.valueOf(soLuong).multiply(spctrp.getById(idSanPhamCT).getGiaBan()));
        hdctrp.save(hdct);

        return "redirect:/ban-hang/detail?idHoaDon="+idHoaDon;

    }

    @GetMapping("/ban-hang/delete")
    public String delete(@RequestParam("idHoaDon") Integer idHoaDon,
                         @RequestParam("id") Integer id,
                         Model model) {
        HoaDonChiTiet hdct = hdctrp.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid HoaDonChiTiet ID: " + id));

        SanPhamChiTiet sanPhamCT = hdct.getSanPhamChiTiet();

        int soLuongMua = hdct.getSoLuongMua();
        sanPhamCT.setSoLuong(sanPhamCT.getSoLuong() + soLuongMua);
        spctrp.save(sanPhamCT);

        hdctrp.deleteById(id);

        return "redirect:/ban-hang/detail?idHoaDon=" + idHoaDon;
    }
    @GetMapping("/ban-hang/edit")
    public String editForm(@RequestParam("id") Integer id,
                           @RequestParam("idHoaDon") Integer idHoaDon,
                           Model model) {
        HoaDonChiTiet hdct = hdctrp.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid HoaDonChiTiet ID: " + id));

        model.addAttribute("hdct", hdct);
        model.addAttribute("idHoaDon", idHoaDon);
        return "edit-form";
    }
    @PostMapping("/ban-hang/update-quantity")
    public String updateQuantity(@RequestParam("id") Integer id,
                                 @RequestParam("idHoaDon") Integer idHoaDon,
                                 @RequestParam("soLuong") int soLuong,
                                 Model model) {
        HoaDonChiTiet hdct = hdctrp.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid HoaDonChiTiet ID: " + id));

        SanPhamChiTiet sanPhamCT = hdct.getSanPhamChiTiet();

        int oldQuantity = hdct.getSoLuongMua();
        int quantityDifference = soLuong - oldQuantity;

        sanPhamCT.setSoLuong(sanPhamCT.getSoLuong() - quantityDifference);
        spctrp.save(sanPhamCT);

        hdct.setSoLuongMua(soLuong);
        hdct.setTongTien(BigDecimal.valueOf(soLuong).multiply(sanPhamCT.getGiaBan()));
        hdctrp.save(hdct);

        return "redirect:/ban-hang/detail?idHoaDon=" + idHoaDon;
    }

    @PostMapping("ban-hang/update")
    public String updateHoaDon(@RequestParam("idHoaDon") int idHoaDon,
                               @RequestParam("khachHangId") int khachHangId,
                               Model model) {
        HoaDon hoaDon = hdrp.getReferenceById(idHoaDon);
            if(hoaDon.getKhachHang().getId().isEmpty()){
                model.addAttribute("error","Vui lòng chọn khách hàng");
                return "trang-chu";
            }else if(hdctrp.findByHoaDon_Id(idHoaDon).size() == 0){
                model.addAttribute("error","Giỏ hàng rỗng");
                return "trang-chu";
            }else if(hdctrp.findByHoaDon_Id(idHoaDon).isEmpty()) {
                model.addAttribute("error","Hóa đơn rỗng");
                return "trang-chu";
            }else
            {
                for (int i = 0 ; i < hdctrp.findByHoaDon_Id(idHoaDon).size() ; i ++){
                    if(hdctrp.findByHoaDon_Id(idHoaDon).get(i).getSoLuongMua() == 0){
                        model.addAttribute("error","Giỏ hàng có sản phẩm rỗng");
                        return "trang-chu";
                    }
                }
            }
            hoaDon.setNgayTao(LocalDateTime.now());
            hoaDon.setTrangThai("Completed");
            hdrp.save(hoaDon);
        return "redirect:/ban-hang";
    }
    @GetMapping ("/ban-hang/detailllll")
    public String edit(@RequestParam("id") Integer id, Model model){
        model.addAttribute("hdct",hdctrp.getOne(id));
        model.addAttribute("hd",hdrp.getOne(id));
        model.addAttribute("spct",spctrp.getOne(id));

        return "trang-chu";
    }

}


