// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_crud/ip.dart';
import 'package:flutter_application_crud/nilai/updateNilai.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'insertNilai.dart';

class DataNilai extends StatefulWidget {
  const DataNilai({super.key});

  @override
  State<DataNilai> createState() => _DataNilaiState();
}

class _DataNilaiState extends State<DataNilai> {
  List<Map<String, dynamic>> namaMahasiswa = [];
  List<Map<String, dynamic>> namaMatakuliah = [];
  List listNilai = [];

  @override
  void initState() {
    allNilai();
    getMahasiswa();
    getMatakuliah();
    super.initState();
  }

  Future<void> getMahasiswa() async {
    String urlMahasiswa = "http://${ipAll}:9001/api/v1/mahasiswa";
    try {
      var response = await http.get(Uri.parse(urlMahasiswa));
      final List<dynamic> dataMhs = jsonDecode(response.body);
      setState(() {
        namaMahasiswa = List.from(dataMhs);
      });
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> getMatakuliah() async {
    String urlMatakuliah = "http://${ipAll}:9002/api/v1/matakuliah";
    try {
      var response = await http.get(Uri.parse(urlMatakuliah));
      final List<dynamic> dataMk = jsonDecode(response.body);
      setState(() {
        namaMatakuliah = List.from(dataMk);
      });
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> allNilai() async {
    String urlNilai = "http://${ipAll}:9003/api/v1/nilai";
    try {
      var response = await http.get(Uri.parse(urlNilai));
      listNilai = jsonDecode(response.body);
      setState(() {
        listNilai = jsonDecode(response.body);
      });
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> deleteNilai(int id) async {
    String urlNilai = "http://${ipAll}:9003/api/v1/nilai/${id}";
    try {
      await http.delete(Uri.parse(urlNilai));
      setState(() {
        allNilai();
      });
    } catch (exc) {
      print(exc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Nilai",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 10, 82, 21),
        actions: [
          IconButton(
              tooltip: "Tambah Data",
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InsertNilai()))
                    .then((value) {
                  allNilai();
                });
                ;
              },
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      body: listNilai.isEmpty
          ? Center(
              child: Text(
                'Tidak ada data',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: listNilai.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Icon(
                      Icons.pin_outlined,
                      color: Colors.green.shade500,
                      size: 24,
                    ),
                    title: Text(
                      "${namaMahasiswa.firstWhere((mahasiswa) => mahasiswa["id"] == listNilai[index]["idmahasiswa"], orElse: () => {})["nama"] ?? ""}",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Matakuliah: ${namaMatakuliah.firstWhere((matakuliah) => matakuliah["id"] == listNilai[index]["idmatakuliah"], orElse: () => {})["nama"] ?? ""}\nNilai: ${listNilai[index]["nilai"]}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            tooltip: "Hapus Data",
                            onPressed: () {
                              deleteNilai(listNilai[index]["id"]);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red.shade300,
                              size: 24,
                            )),
                        IconButton(
                            tooltip: "Edit Data",
                            onPressed: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateNilai(
                                              listNilai[index]["id"],
                                              listNilai[index]["idmahasiswa"],
                                              listNilai[index]["idmatakuliah"],
                                              listNilai[index]["nilai"])))
                                  .then((value) => allNilai());
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 24,
                            )),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
