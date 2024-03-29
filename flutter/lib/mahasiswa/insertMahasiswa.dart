// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_crud/ip.dart';
import 'package:http/http.dart' as http;

class InsertMahasiswa extends StatefulWidget {
  const InsertMahasiswa({super.key});

  @override
  State<InsertMahasiswa> createState() => _InsertMahasiswaState();
}

class _InsertMahasiswaState extends State<InsertMahasiswa> {
  final nama = TextEditingController();
  final email = TextEditingController();
  String namaMhs = "";
  String emailMhs = "";
  DateTime tgllahir = DateTime.now();

  Future<void> _pilihTgl(BuildContext context) async {
    final DateTime? kalender = await showDatePicker(
        context: context,
        initialDate: tgllahir,
        firstDate: DateTime(1950),
        lastDate: DateTime(2030));

    if (kalender != null && kalender != tgllahir) {
      setState(() {
        tgllahir = kalender;
      });
    }
  }

  Future<void> insertMahasiswa() async {
    String urlInsert = "http://${ipAll}:9001/api/v1/mahasiswa";
    final Map<String, dynamic> data = {
      "nama": namaMhs,
      "email": emailMhs,
      "tgllahir": '${tgllahir.toLocal()}'.split(' ')[0]
    };

    try {
      var response = await http.post(Uri.parse(urlInsert),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        Navigator.pop(context, "berhasil");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Data Mahasiswa"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
          width: 800,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Nama",
                  hintText: "Masukkan Nama",
                  prefixIcon: Icon(Icons.text_fields),
                  fillColor: Colors.deepPurple.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: nama,
              ),
              SizedBox(height: 10),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Masukkan Email",
                  prefixIcon: Icon(Icons.email_rounded),
                  fillColor: Colors.deepPurple.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Tanggal Lahir",
                  hintText: "Pilih Tanggal Lahir",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.deepPurple.shade200,
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _pilihTgl(context),
                controller: TextEditingController(
                  text: "${tgllahir.toLocal()}".split(" ")[0],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 200,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade400,
                  ),
                  onPressed: () {
                    setState(() {
                      namaMhs = nama.text;
                      emailMhs = email.text;
                    });
                    insertMahasiswa();
                  },
                  child: Text(
                    "SIMPAN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
