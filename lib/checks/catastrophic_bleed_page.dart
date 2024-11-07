import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'airway_check_page.dart';
import '../models/assessment_progress.dart';

class CatastrophicBleedPage extends StatefulWidget {
  final AssessmentProgress progress;

  const CatastrophicBleedPage({
    super.key,
    required this.progress,
  });

  @override
  State<CatastrophicBleedPage> createState() => _CatastrophicBleedPageState();
}

class _CatastrophicBleedPageState extends State<CatastrophicBleedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: 'Catastrophic Bleed'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.bloodtype, color: Colors.redAccent, size: 28),
                      SizedBox(width: 8),
                      Text(
                        'Check for Catastrophic Bleeding',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 2,
                    child: CheckboxListTile(
                      title: const Text('Direct Pressure Applied'),
                      value: widget.progress.catastrophicBleedChecks['Pressure'],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.progress.catastrophicBleedChecks['Pressure'] = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFF00AC83),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    child: CheckboxListTile(
                      title: const Text('Wound Packed'),
                      value: widget.progress.catastrophicBleedChecks['Pack'],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.progress.catastrophicBleedChecks['Pack'] = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFF00AC83),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: const Text('Tourniquet Applied'),
                          value: widget.progress.catastrophicBleedChecks['Tourniquet'],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.progress.catastrophicBleedChecks['Tourniquet'] = value ?? false;
                              if (value == true) {
                                widget.progress.tourniquetTime = DateTime.now().toString();
                              } else {
                                widget.progress.tourniquetTime = null;
                              }
                            });
                          },
                          activeColor: const Color(0xFF00AC83),
                        ),
                        if (widget.progress.catastrophicBleedChecks['Tourniquet'] == true && 
                            widget.progress.tourniquetTime != null)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Icon(Icons.access_time, color: Colors.red),
                                const SizedBox(width: 8),
                                Text(
                                  'Applied at: ${_formatTime(widget.progress.tourniquetTime!)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AirwayCheckPage(
                              progress: widget.progress,
                            ),
                          ),
                        );
                      },
                      child: const Text('Next: Check Airway'),
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

  String _formatTime(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
} 