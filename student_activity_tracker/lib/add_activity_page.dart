import 'package:flutter/material.dart';
import 'model/activity_model.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String category = 'Belajar';
  double duration = 1;
  bool isDone = false;
  String notes = '';

  final List<String> categories = [
    'Belajar',
    'Ibadah',
    'Olahraga',
    'Hiburan',
    'Lainnya'
  ];

  void _saveActivity() {
    if (name.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Kesalahan'),
          content: const Text('Nama aktivitas tidak boleh kosong!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
      return;
    }

    final newActivity = Activity(
      name: name,
      category: category,
      duration: duration,
      isDone: isDone,
      notes: notes,
    );

    Navigator.pop(context, newActivity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Aktivitas'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nama Aktivitas'),
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField(
                value: category,
                decoration: const InputDecoration(labelText: 'Kategori Aktivitas'),
                items: categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (value) => setState(() => category = value!),
              ),
              const SizedBox(height: 12),
              Text('Durasi: ${duration.toStringAsFixed(0)} jam'),
              Slider(
                value: duration,
                min: 1,
                max: 8,
                divisions: 7,
                label: '${duration.toStringAsFixed(0)} jam',
                onChanged: (val) => setState(() => duration = val),
              ),
              SwitchListTile(
                title: const Text('Sudah Selesai'),
                value: isDone,
                onChanged: (val) => setState(() => isDone = val),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Catatan Tambahan',
                  hintText: 'Opsional',
                ),
                maxLines: 3,
                onChanged: (value) => notes = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _saveActivity,
                icon: const Icon(Icons.save),
                label: const Text('Simpan Aktivitas'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
