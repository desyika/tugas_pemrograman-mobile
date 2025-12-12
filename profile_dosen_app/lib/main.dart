import 'package:flutter/material.dart';
import 'pages/dosen_list_page.dart';

void main() {
  runApp(ProfilDosenApp());
}

class ProfilDosenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Dosen App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: DosenListPage(),
    );
  }
}
