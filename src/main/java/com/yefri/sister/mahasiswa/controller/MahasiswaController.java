
package com.yefri.sister.mahasiswa.controller;

import com.yefri.sister.mahasiswa.entity.Mahasiswa;
import com.yefri.sister.mahasiswa.service.MahasiswaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/mahasiswa")
public class MahasiswaController {
    @Autowired
    private MahasiswaService mahasiswaService;
    
    @GetMapping
    public List<Mahasiswa> getAll() {
        return mahasiswaService.getAll();
    }
    
    @PostMapping
    public void insert(@RequestBody Mahasiswa mahasiswa){
        mahasiswaService.insert(mahasiswa);
    } 
}
