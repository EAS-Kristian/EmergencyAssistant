import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../models/assessment_progress.dart';
import 'damage_check_page.dart';

class CirculationCheckPage extends StatefulWidget {
  final AssessmentProgress progress;

  const CirculationCheckPage({
    super.key,
    required this.progress,
  });

  @override
  State<CirculationCheckPage> createState() => _CirculationCheckPageState();
}

class _CirculationCheckPageState extends State<CirculationCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: 'Circulation Check'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.favorite, color: Colors.redAccent, size: 28),
                      SizedBox(width: 8),
                      Text(
                        'Check for Bleeding',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...widget.progress.circulationChecks.entries.map((entry) {
                    return Column(
                      children: [
                        Card(
                          elevation: 2,
                          child: CheckboxListTile(
                            title: Text(entry.key),
                            value: entry.value,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.progress.circulationChecks[entry.key] = value ?? false;
                              });
                            },
                            activeColor: const Color(0xFF00AC83),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  }).toList(),
                  
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00AC83),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DamageCheckPage(
                              progress: widget.progress,
                            ),
                          ),
                        );
                      },
                      child: const Text('Next: Check Damage'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 