import 'package:flutter/material.dart';
import '../models/dosen.dart';
import 'dosen_detail_page.dart';

class DosenListPage extends StatelessWidget {
  final List<Dosen> daftarDosen = [
    Dosen(
      nama: 'Dr. Rina Kartika, M.Kom',
      nip: '198709102021112001',
      email: 'rina.kartika@univ.ac.id',
      foto: 'https://i.pravatar.cc/150?img=47',
      keahlian: 'Kecerdasan Buatan & Machine Learning',
    ),
    Dosen(
      nama: 'Budi Santoso, M.T',
      nip: '198503212015041001',
      email: 'budi.santoso@univ.ac.id',
      foto: 'https://i.pravatar.cc/150?img=48',
      keahlian: 'Pemrograman Mobile & Flutter',
    ),
    Dosen(
      nama: 'Dr. Nia Lestari, M.Kom',
      nip: '198201302010112003',
      email: 'nia.lestari@univ.ac.id',
      foto: 'https://i.pravatar.cc/150?img=49',
      keahlian: 'Sistem Informasi & Database',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Dosen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: daftarDosen.length,
          itemBuilder: (context, index) {
            final dosen = daftarDosen[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(dosen.foto),
                  radius: 30,
                ),
                title: Text(
                  dosen.nama,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(dosen.keahlian),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DosenDetailPage(dosen: dosen),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
