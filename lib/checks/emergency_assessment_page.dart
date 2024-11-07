import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../models/assessment_progress.dart';
import 'response_assessment_page.dart';

class EmergencyAssessmentPage extends StatefulWidget {
  final AssessmentProgress progress;

  const EmergencyAssessmentPage({
    super.key,
    required this.progress,
  });

  @override
  State<EmergencyAssessmentPage> createState() => _EmergencyAssessmentPageState();
}

class _EmergencyAssessmentPageState extends State<EmergencyAssessmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: 'Emergency Assessment'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Is there any current Danger?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 2,
                    child: CheckboxListTile(
                      title: const Text('Safe?'),
                      value: widget.progress.dangerChecks['Safe'],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.progress.dangerChecks['Safe'] = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFF00AC83),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    child: CheckboxListTile(
                      title: const Text('PPE?'),
                      value: widget.progress.dangerChecks['PPE'],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.progress.dangerChecks['PPE'] = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFF00AC83),
                    ),
                  ),
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
                            builder: (context) => ResponseAssessmentPage(
                              progress: widget.progress,
                            ),
                          ),
                        );
                      },
                      child: const Text('Next: Check Response'),
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