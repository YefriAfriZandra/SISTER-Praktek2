/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veron.matakuliah.service;

import com.veron.matakuliah.entity.Matakuliah;
import com.veron.matakuliah.repository.MatakuliahRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS ID
 */
@Service
public class MatakuliahService {
    @Autowired
    private MatakuliahRepository matakuliahRepository;
    
    public void insert(Matakuliah matakuliah){
        Optional<Matakuliah> mhsOptional = matakuliahRepository.findMatakuliahByKode(matakuliah.getKode());
        if (mhsOptional.isPresent()) {
            throw new IllegalStateException("Matakuliah sudah ada");
        }
        matakuliahRepository.save(matakuliah);
    }
    
    public List<Matakuliah> getAll(){
        return matakuliahRepository.findAll();
    }
    
    public Matakuliah getMatakuliahById(Long id){
        return matakuliahRepository.findById(id).get();
    }
}
