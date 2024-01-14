// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_crud/homepage.dart';
import 'package:flutter_application_crud/mahasiswa/mahasiswa.dart';
import 'package:flutter_application_crud/matakuliah/matakuliah.dart';
import 'package:flutter_application_crud/nilai/nilai.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Java Flutter Service GUI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Navbar(),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Home(),
    DataMahasiswa(),
    DataMatakuliah(),
    DataNilai(),
    DataMahasiswa()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        height: 55,
        index: _currentIndex,
        items: [
          Icon(Icons.home_rounded, size: 30),
          Icon(Icons.person_2_rounded, size: 30),
          Icon(Icons.book_rounded, size: 30),
          Icon(Icons.note_alt, size: 30,),
          Icon(Icons.abc_sharp, size: 30)
        ],
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
