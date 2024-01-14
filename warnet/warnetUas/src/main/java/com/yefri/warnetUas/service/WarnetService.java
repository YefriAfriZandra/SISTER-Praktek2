/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yefri.warnetUas.service;
import com.yefri.warnetUas.entity.Warnet;
import com.yefri.warnetUas.repository.WarnetRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Admin
 */
public class WarnetService {
    @Autowired
    private WarnetRepository warnetRepository;
    
    public void insert (Warnet warnet){
        Optional<Warnet> netOptional = warnetRepository.findWarnetByKodePelanggan(warnet.getKode_pelanggan());
        if (netOptional.isPresent()) {
            throw new IllegalStateException("Kode sudah ada");
        }
        warnetRepository.save(warnet);
    }
    public List<Warnet> getAll(){
        return warnetRepository.findAll();
    }
    
    public Warnet getWarnetById(Long id){
        return warnetRepository.findById(id).get();
    }
    
    public void delete(Long id){
        warnetRepository.deleteById(id);
    }
}
