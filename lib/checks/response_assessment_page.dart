import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../models/assessment_progress.dart';
import 'catastrophic_bleed_page.dart';

class ResponseAssessmentPage extends StatefulWidget {
  final AssessmentProgress progress;

  const ResponseAssessmentPage({
    super.key,
    required this.progress,
  });

  @override
  State<ResponseAssessmentPage> createState() => _ResponseAssessmentPageState();
}

class _ResponseAssessmentPageState extends State<ResponseAssessmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: 'Response Assessment'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.hearing, color: Colors.blueAccent, size: 28),
                      SizedBox(width: 8),
                      Text(
                        'Check Response',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Check if the person responds to voice or touch',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...widget.progress.responseChecks.entries.map((entry) {
                    return Card(
                      elevation: 2,
                      child: RadioListTile<bool>(
                        title: Text(entry.key),
                        value: true,
                        groupValue: entry.value,
                        onChanged: (bool? value) {
                          setState(() {
                            widget.progress.responseChecks.updateAll((key, value) => false);
                            widget.progress.responseChecks[entry.key] = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFF00AC83),
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
                            builder: (context) => CatastrophicBleedPage(
                              progress: widget.progress,
                            ),
                          ),
                        );
                      },
                      child: const Text('Next: Check Catastrophic Bleeding'),
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