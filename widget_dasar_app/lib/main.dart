import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink[50], // Warna latar belakang
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 61, 103, 202),
          title: const Text("Aplikasi Biodata"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/DESY.jpg'),
              ),
              const SizedBox(height: 15),

              // Nama
              const Text(
                "Desy ika hariyani",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // NIM
              const Text(
                "NIM: 701230047",
                style: TextStyle(fontSize: 16),
              ),

              // Prodi
              const Text(
                "Mahasiswa Sistem Informasi",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Email
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Color.fromARGB(255, 61, 103, 202)),
                  SizedBox(width: 8),
                  Text("desyikahariani@gmail.com"),
                ],
              ),
              const SizedBox(height: 10),

              // Hobi
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, color: Color.fromARGB(255, 61, 103, 202)),
                  SizedBox(width: 8),
                  Text("Hobi: Memasak dan Travelling"),
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 61, 103, 202),
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  print("Profil ditekan");
                },
                child: const Text("Lihat Profil"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}