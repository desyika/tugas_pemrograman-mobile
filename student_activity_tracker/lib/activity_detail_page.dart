import 'package:flutter/material.dart';
import 'model/activity_model.dart';

class ActivityDetailPage extends StatelessWidget {
  final Activity activity;
  final int index;

  const ActivityDetailPage({super.key, required this.activity, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kategori: ${activity.category}', style: const TextStyle(fontSize: 18)),
            Text('Durasi: ${activity.duration.toStringAsFixed(1)} jam'),
            Text('Status: ${activity.isDone ? "Selesai" : "Belum"}'),
            const SizedBox(height: 12),
            Text('Catatan: ${activity.notes.isEmpty ? "-" : activity.notes}'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Hapus Aktivitas'),
                    content: const Text('Yakin ingin menghapus aktivitas ini?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context, 'deleted');
                        },
                        child: const Text('Hapus'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
              label: const Text('Hapus Aktivitas'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
