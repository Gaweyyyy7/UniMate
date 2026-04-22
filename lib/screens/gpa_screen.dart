import 'package:flutter/material.dart';

class GpaScreen extends StatefulWidget {
  const GpaScreen({super.key});

  @override
  State<GpaScreen> createState() => _GpaScreenState();
}

class _GpaScreenState extends State<GpaScreen> {
  final subjectController = TextEditingController();
  final creditController = TextEditingController();

  String grade = 'A';
  double gpa = 0;

  List<Map<String, dynamic>> subjects = [];

  Map<String, double> points = {
    'A': 4,
    'B': 3,
    'C': 2,
    'D': 1,
    'F': 0,
  };

  void addSubject() {
    if (subjectController.text.isEmpty || creditController.text.isEmpty) return;

    setState(() {
      subjects.add({
        'name': subjectController.text,
        'grade': grade,
        'credit': double.parse(creditController.text),
      });

      subjectController.clear();
      creditController.clear();
    });
  }

  void calculateGPA() {
    double total = 0;
    double credits = 0;

    for (var s in subjects) {
      total += points[s['grade']]! * s['credit'];
      credits += s['credit'];
    }

    setState(() {
      gpa = credits == 0 ? 0 : total / credits;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPA Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: subjectController,
              decoration: const InputDecoration(labelText: 'Subject'),
            ),
            TextField(
              controller: creditController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Credits'),
            ),
            DropdownButton<String>(
              value: grade,
              items: points.keys.map((g) {
                return DropdownMenuItem(value: g, child: Text(g));
              }).toList(),
              onChanged: (v) => setState(() => grade = v!),
            ),
            ElevatedButton(onPressed: addSubject, child: const Text('Add')),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (_, i) {
                  var s = subjects[i];
                  return ListTile(
                    title: Text(s['name']),
                    subtitle: Text('${s['grade']} | ${s['credit']}'),
                  );
                },
              ),
            ),
            ElevatedButton(onPressed: calculateGPA, child: const Text('Calculate')),
            Text('GPA: ${gpa.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}