import 'package:flutter/material.dart';

void main() {
  runApp(FormFeedbackApp());
}

class FormFeedbackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Feedback App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: FeedbackFormPage(),
    );
  }
}

class FeedbackFormPage extends StatefulWidget {
  @override
  _FeedbackFormPageState createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _comment = '';
  int _rating = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulir Feedback')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Nama
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nama wajib diisi' : null,
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 10),

              // Input Komentar
              TextFormField(
                decoration: InputDecoration(labelText: 'Komentar'),
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'Komentar wajib diisi'
                    : null,
                onSaved: (value) => _comment = value!,
              ),
              SizedBox(height: 10),

              // Input Rating
              DropdownButtonFormField<int>(
                value: _rating,
                decoration: InputDecoration(labelText: 'Rating (1–5)'),
                items: List.generate(
                  5,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text('${index + 1}'),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _rating = value!;
                  });
                },
              ),
              SizedBox(height: 20),

              // Tombol Submit
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackResultPage(
                            name: _name,
                            comment: _comment,
                            rating: _rating,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Kirim Feedback'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackResultPage extends StatelessWidget {
  final String name;
  final String comment;
  final int rating;

  FeedbackResultPage({
    required this.name,
    required this.comment,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hasil Feedback')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(name),
            SizedBox(height: 10),
            Text('Komentar:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(comment),
            SizedBox(height: 10),
            Text('Rating:', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: List.generate(
                rating,
                (index) => Icon(Icons.star, color: Colors.amber),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali ke Form'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
