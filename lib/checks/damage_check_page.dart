import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../models/assessment_progress.dart';
import 'environment_check_page.dart';

class DamageCheckPage extends StatefulWidget {
  final AssessmentProgress progress;

  const DamageCheckPage({
    super.key,
    required this.progress,
  });

  @override
  State<DamageCheckPage> createState() => _DamageCheckPageState();
}

class _DamageCheckPageState extends State<DamageCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: 'Damage Assessment'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Check for Injuries',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...widget.progress.damageChecks.entries.map((region) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              region.key,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Divider(height: 1),
                          ...region.value.entries.map((injury) {
                            return CheckboxListTile(
                              title: Text(injury.key),
                              value: injury.value,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.progress.damageChecks[region.key]![injury.key] = value ?? false;
                                });
                              },
                              activeColor: const Color(0xFF00AC83),
                              dense: true,
                            );
                          }).toList(),
                          const SizedBox(height: 8),
                        ],
                      ),
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
                            builder: (context) => EnvironmentCheckPage(
                              progress: widget.progress,
                            ),
                          ),
                        );
                      },
                      child: const Text('Next: Check Environment'),
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