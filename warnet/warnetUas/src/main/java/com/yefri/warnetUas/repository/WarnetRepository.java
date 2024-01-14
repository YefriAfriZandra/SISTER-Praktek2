/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yefri.warnetUas.repository;

import com.yefri.warnetUas.entity.Warnet;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface WarnetRepository extends JpaRepository<Warnet, Long> {

    public Optional<Warnet> findWarnetByKodePelanggan(String kode_pelanggan);
    
}
