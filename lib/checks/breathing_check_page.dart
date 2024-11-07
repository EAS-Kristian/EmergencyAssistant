import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../models/assessment_progress.dart';
import 'circulation_check_page.dart';

class BreathingCheckPage extends StatefulWidget {
  final AssessmentProgress progress;

  const BreathingCheckPage({
    super.key,
    required this.progress,
  });

  @override
  State<BreathingCheckPage> createState() => _BreathingCheckPageState();
}

class _BreathingCheckPageState extends State<BreathingCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: 'Breathing Check'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Check Breathing Rate',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildBreathingOption('Normal (12-20)'),
                  const SizedBox(height: 10),
                  _buildBreathingOption('Slow (<12)'),
                  const SizedBox(height: 10),
                  _buildBreathingOption('Fast (21-30)'),
                  const SizedBox(height: 10),
                  _buildBreathingOption('Not Breathing'),
                  
                  if (widget.progress.breathingRate == 'Not Breathing')
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.warning_rounded,
                            color: Colors.red,
                            size: 32,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Start CPR Immediately',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '30 compressions : 2 breaths',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ],
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
                      onPressed: widget.progress.breathingRate != null ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CirculationCheckPage(
                              progress: widget.progress,
                            ),
                          ),
                        );
                      } : null,
                      child: const Text('Next: Check Circulation'),
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

  Widget _buildBreathingOption(String rate) {
    return Card(
      elevation: 2,
      child: RadioListTile<String>(
        title: Text(rate),
        value: rate,
        groupValue: widget.progress.breathingRate,
        onChanged: (String? value) {
          setState(() {
            widget.progress.breathingRate = value;
          });
        },
        activeColor: const Color(0xFF00AC83),
      ),
    );
  }
} 