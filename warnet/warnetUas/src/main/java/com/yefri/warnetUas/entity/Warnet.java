/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yefri.warnetUas.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class Warnet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String kode_pelanggan;
    private String jenis;
    private int lama;
    private int tarif;
    private int total;
    
    public Warnet() {
    }

    
    public Warnet(Long id, String kode_pelanggan, String jenis, int lama, int tarif, int total) {
        this.id = id;
        this.kode_pelanggan = kode_pelanggan;
        this.jenis = jenis;
        this.lama = lama;
        this.tarif = tarif;
        this.total = total;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getKode_pelanggan() {
        return kode_pelanggan;
    }

    public void setKode_pelanggan(String kode_pelanggan) {
        this.kode_pelanggan = kode_pelanggan;
    }

    public String getJenis() {
        return jenis;
    }

    public void setJenis(String jenis) {
        this.jenis = jenis;
    }

    public int getLama() {
        return lama;
    }

    public void setLama(int lama) {
        this.lama = lama;
    }

    public int getTarif() {
        return tarif;
    }

    public void setTarif(int tarif) {
        this.tarif = tarif;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
     
    @Override
    public String toString() {
        return "Warnet{" + "id=" + id + ", kode_pelanggan=" + kode_pelanggan + ", jenis=" + jenis + ", lama=" + lama + ", tarif=" + tarif + ", total=" + total + '}';
    }
    
}
