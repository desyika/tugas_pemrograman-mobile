import 'package:flutter/material.dart';
import '../models/dosen.dart';

class DosenDetailPage extends StatelessWidget {
  final Dosen dosen;

  const DosenDetailPage({required this.dosen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Dosen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                // Foto Dosen
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    dosen.foto,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),

                // Nama Dosen
                Text(
                  dosen.nama,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),

                // Keahlian
                Chip(
                  label: Text(
                    dosen.keahlian,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.indigo,
                ),
                SizedBox(height: 20),

                // Info detail
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _infoRow(Icons.badge, 'NIP', dosen.nip),
                        Divider(),
                        _infoRow(Icons.email, 'Email', dosen.email),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.indigo),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            '$label: $value',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
