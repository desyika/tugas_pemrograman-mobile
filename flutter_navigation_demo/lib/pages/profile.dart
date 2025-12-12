import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Profil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.deepPurple),
            SizedBox(height: 20),
            Text(
              'Nama: Desy Ika',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Peran: Mahasiswi Flutter Developer',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
