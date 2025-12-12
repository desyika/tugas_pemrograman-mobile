import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String message;

  DetailPage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pesan dari Halaman Sebelumnya:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.arrow_back),
                label: Text('Kembali'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
