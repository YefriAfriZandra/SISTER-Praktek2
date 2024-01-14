/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veron.nilaimahasiswa.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 *
 * @author ASUS ID
 */

@Entity
@Table
public class NilaiMahasiswa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long idmahasiswa;
    private Long idmatakuliah;
    private double nilai;

    public NilaiMahasiswa() {
    }

    public NilaiMahasiswa(Long id, Long idmahasiswa, Long idmatakuliah, double nilai) {
        this.id = id;
        this.idmahasiswa = idmahasiswa;
        this.idmatakuliah = idmatakuliah;
        this.nilai = nilai;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdmahasiswa() {
        return idmahasiswa;
    }

    public void setIdmahasiswa(Long idmahasiswa) {
        this.idmahasiswa = idmahasiswa;
    }

    public Long getIdmatakuliah() {
        return idmatakuliah;
    }

    public void setIdmatakuliah(Long idmatakuliah) {
        this.idmatakuliah = idmatakuliah;
    }

    public double getNilai() {
        return nilai;
    }

    public void setNilai(double nilai) {
        this.nilai = nilai;
    }

    @Override
    public String toString() {
        return "NilaiMahasiswa{" + "id=" + id + ", idmahasiswa=" + idmahasiswa + ", idmatakuliah=" + idmatakuliah + ", nilai=" + nilai + '}';
    }
}
