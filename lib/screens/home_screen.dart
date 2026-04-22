import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import 'gpa_screen.dart';
import 'assignment_screen.dart';
import 'timetable_screen.dart';
import 'exam_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void openScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniMate 🎓'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            DashboardCard(
              title: 'GPA',
              value: 'Tap',
              icon: Icons.school,
              color: Colors.blue,
              onTap: () => openScreen(context, const GpaScreen()),
            ),
            DashboardCard(
              title: 'Assignments',
              value: 'Tap',
              icon: Icons.assignment,
              color: Colors.orange,
              onTap: () => openScreen(context, const AssignmentScreen()),
            ),
            DashboardCard(
              title: 'Timetable',
              value: 'Tap',
              icon: Icons.calendar_today,
              color: Colors.green,
              onTap: () => openScreen(context, const TimetableScreen()),
            ),
            DashboardCard(
              title: 'Exams',
              value: 'Tap',
              icon: Icons.edit_note,
              color: Colors.red,
              onTap: () => openScreen(context, const ExamScreen()),
            ),
          ],
        ),
      ),
    );
  }
}