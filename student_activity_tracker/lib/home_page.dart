import 'package:flutter/material.dart';
import 'add_activity_page.dart';
import 'activity_detail_page.dart';
import 'model/activity_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity> activities = [];

  void _navigateAndAddActivity() async {
    final newActivity = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddActivityPage()),
    );

    if (newActivity != null && newActivity is Activity) {
      setState(() {
        activities.add(newActivity);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aktivitas berhasil ditambahkan!')),
      );
    }
  }

  void _deleteActivity(int index) {
    setState(() {
      activities.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Activity Tracker'),
        backgroundColor: Colors.blueAccent,
      ),
      body: activities.isEmpty
          ? const Center(child: Text('Belum ada aktivitas 😴'))
          : ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    title: Text(activity.name),
                    subtitle: Text(
                        '${activity.category} • ${activity.duration.toStringAsFixed(1)} jam'),
                    trailing: Icon(
                      activity.isDone ? Icons.check_circle : Icons.access_time,
                      color: activity.isDone ? Colors.green : Colors.orange,
                    ),
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivityDetailPage(
                            activity: activity,
                            index: index,
                          ),
                        ),
                      );

                      if (result == 'deleted') {
                        _deleteActivity(index);
                      }
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAndAddActivity,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
