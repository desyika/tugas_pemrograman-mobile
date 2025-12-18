import 'package:flutter/material.dart';

void main() {
  runApp(const BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/* ================= MODEL ================= */
class BMIRecord {
  String name;
  String gender;
  double height;
  double weight;
  double bmi;
  String category;

  BMIRecord({
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.category,
  });
}

/* ================= HOME ================= */
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final List<BMIRecord> records = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0
          ? BMICalculator(records: records)
          : HistoryPage(records: records),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.teal,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "BMI",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Riwayat",
          ),
        ],
      ),
    );
  }
}

/* ================= BMI CALCULATOR ================= */
class BMICalculator extends StatefulWidget {
  final List<BMIRecord> records;
  const BMICalculator({super.key, required this.records});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final nameC = TextEditingController();
  final heightC = TextEditingController();
  final weightC = TextEditingController();

  String gender = "Perempuan";
  double? bmi;
  String category = "";

  void hitungBMI() {
    final h = double.tryParse(heightC.text);
    final w = double.tryParse(weightC.text);

    if (nameC.text.isEmpty || h == null || w == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Lengkapi semua data")),
      );
      return;
    }

    final result = w / ((h / 100) * (h / 100));

    if (result < 18.5) {
      category = "Kurus";
    } else if (result < 25) {
      category = "Normal";
    } else if (result < 30) {
      category = "Overweight";
    } else {
      category = "Obesitas";
    }

    setState(() => bmi = result);
  }

  void simpanData() {
    if (bmi == null) return;

    widget.records.add(
      BMIRecord(
        name: nameC.text,
        gender: gender,
        height: double.parse(heightC.text),
        weight: double.parse(weightC.text),
        bmi: bmi!,
        category: category,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Data tersimpan 💾")),
    );
  }

  InputDecoration deco(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget card({required Widget child, Color? color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "BMI Calculator ✨",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            card(
              child: Column(
                children: [
                  TextField(
                    controller: nameC,
                    decoration: deco("Nama", Icons.person),
                  ),
                  const SizedBox(height: 12),

                  DropdownButtonFormField(
                    value: gender,
                    decoration: deco("Jenis Kelamin", Icons.wc),
                    items: const [
                      DropdownMenuItem(
                          value: "Laki-laki", child: Text("Laki-laki")),
                      DropdownMenuItem(
                          value: "Perempuan", child: Text("Perempuan")),
                    ],
                    onChanged: (v) => setState(() => gender = v!),
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: heightC,
                    keyboardType: TextInputType.number,
                    decoration: deco("Tinggi (cm)", Icons.height),
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: weightC,
                    keyboardType: TextInputType.number,
                    decoration: deco("Berat (kg)", Icons.monitor_weight),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: hitungBMI,
                child: const Text("Hitung BMI"),
              ),
            ),

            if (bmi != null) ...[
              const SizedBox(height: 20),
              card(
                color: Colors.teal.shade50,
                child: Column(
                  children: [
                    Text(
                      bmi!.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(category),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: simpanData,
                      icon: const Icon(Icons.save),
                      label: const Text("Simpan ke Riwayat"),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/* ================= HISTORY + EDIT ================= */
class HistoryPage extends StatefulWidget {
  final List<BMIRecord> records;
  const HistoryPage({super.key, required this.records});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  void editData(int index) {
    final item = widget.records[index];

    final nameC = TextEditingController(text: item.name);
    final heightC = TextEditingController(text: item.height.toString());
    final weightC = TextEditingController(text: item.weight.toString());
    String gender = item.gender;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Data BMI"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameC, decoration: const InputDecoration(labelText: "Nama")),
            DropdownButtonFormField(
              value: gender,
              items: const [
                DropdownMenuItem(value: "Laki-laki", child: Text("Laki-laki")),
                DropdownMenuItem(value: "Perempuan", child: Text("Perempuan")),
              ],
              onChanged: (v) => gender = v!,
              decoration: const InputDecoration(labelText: "Jenis Kelamin"),
            ),
            TextField(controller: heightC, decoration: const InputDecoration(labelText: "Tinggi")),
            TextField(controller: weightC, decoration: const InputDecoration(labelText: "Berat")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Batal")),
          ElevatedButton(
            onPressed: () {
              final h = double.parse(heightC.text);
              final w = double.parse(weightC.text);
              final bmi = w / ((h / 100) * (h / 100));

              setState(() {
                widget.records[index] = BMIRecord(
                  name: nameC.text,
                  gender: gender,
                  height: h,
                  weight: w,
                  bmi: bmi,
                  category: bmi < 18.5
                      ? "Kurus"
                      : bmi < 25
                          ? "Normal"
                          : bmi < 30
                              ? "Overweight"
                              : "Obesitas",
                );
              });
              Navigator.pop(context);
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.records.isEmpty) {
      return const Center(child: Text("Belum ada data"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.records.length,
      itemBuilder: (_, i) {
        final r = widget.records[i];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            title: Text("${r.name} • ${r.bmi.toStringAsFixed(1)}"),
            subtitle: Text("${r.gender} • ${r.category}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.teal),
                  onPressed: () => editData(i),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() => widget.records.removeAt(i));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}