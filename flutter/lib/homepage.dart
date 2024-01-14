import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Beranda",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 10, 82, 21),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(text: 'Mahasiswa'),
                  SizedBox(width: 20),
                  CustomButton(text: 'Mata Kuliah'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(text: 'Nilai'),
                  SizedBox(width: 20)
                ],
              ),
            ],
          ),
        ),
      );
  }
}

class CustomButton extends StatelessWidget {
  final String text;

  CustomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}

Widget _buildCircle(String text, IconData icon, Color color) {
  return Column(
    children: [
      Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          icon,
          size: 40.0,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 8.0),
      Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
