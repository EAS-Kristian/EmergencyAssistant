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
                  Row(
                    children: const [
                      Icon(Icons.healing, color: Colors.redAccent, size: 28),
                      SizedBox(width: 8),
                      Text(
                        'Check for Injuries',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...widget.progress.damageChecks.entries.map((region) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              region.key,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Divider(height: 1, thickness: 1),
                          ...region.value.entries.map((injury) {
                            return CheckboxListTile(
                              title: Text(
                                injury.key,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              value: injury.value,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.progress.damageChecks[region.key]![injury.key] = value ?? false;
                                });
                              },
                              activeColor: const Color(0xFF00AC83),
                              dense: true,
                              controlAffinity: ListTileControlAffinity.leading,
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
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
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
                      child: const Text(
                        'Next: Check Environment',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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