/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veron.nilaimahasiswa.vo;

import com.veron.nilaimahasiswa.entity.NilaiMahasiswa;

/**
 *
 * @author ASUS ID
 */
public class ResponseTemplate {
    private NilaiMahasiswa nilai;
    private Mahasiswa mahasiswa;
    private Matakuliah matakuliah;

    public ResponseTemplate() {
    }

    public ResponseTemplate(NilaiMahasiswa nilai, Mahasiswa mahasiswa, Matakuliah matakuliah) {
        this.nilai = nilai;
        this.mahasiswa = mahasiswa;
        this.matakuliah = matakuliah;
    }

    public NilaiMahasiswa getNilai() {
        return nilai;
    }

    public void setNilai(NilaiMahasiswa nilai) {
        this.nilai = nilai;
    }

    public Mahasiswa getMahasiswa() {
        return mahasiswa;
    }

    public void setMahasiswa(Mahasiswa mahasiswa) {
        this.mahasiswa = mahasiswa;
    }

    public Matakuliah getMatakuliah() {
        return matakuliah;
    }

    public void setMatakuliah(Matakuliah matakuliah) {
        this.matakuliah = matakuliah;
    }
}
