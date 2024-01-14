/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.veron.nilaimahasiswa.repository;

import com.veron.nilaimahasiswa.entity.NilaiMahasiswa;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS ID
 */

@Repository
public interface NilaiMahasiswaRepository extends JpaRepository<NilaiMahasiswa, Long> {

    public Optional<NilaiMahasiswa> findNilaiById(Long id);
    
}
