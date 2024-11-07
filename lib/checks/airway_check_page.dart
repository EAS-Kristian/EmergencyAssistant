import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../models/assessment_progress.dart';
import 'breathing_check_page.dart';

class AirwayCheckPage extends StatefulWidget {
  final AssessmentProgress progress;

  const AirwayCheckPage({
    super.key,
    required this.progress,
  });

  @override
  State<AirwayCheckPage> createState() => _AirwayCheckPageState();
}

class _AirwayCheckPageState extends State<AirwayCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: 'Airway Check'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.airline_seat_flat, color: Colors.blueAccent, size: 28),
                      SizedBox(width: 8),
                      Text(
                        'Check Airway Status',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    child: CheckboxListTile(
                      title: const Text('Airway Clear'),
                      subtitle: const Text('Check for any obvious obstructions'),
                      value: widget.progress.airwayChecks['Clear'],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.progress.airwayChecks['Clear'] = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFF00AC83),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    child: CheckboxListTile(
                      title: const Text('Head Tilt/Chin Lift'),
                      subtitle: const Text('Basic airway maneuver performed'),
                      value: widget.progress.airwayChecks['HeadTilt'],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.progress.airwayChecks['HeadTilt'] = value ?? false;
                          if (value == true) {
                            widget.progress.airwayChecks['JawThrust'] = false;
                          }
                        });
                      },
                      activeColor: const Color(0xFF00AC83),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    child: CheckboxListTile(
                      title: const Text('Jaw Thrust'),
                      subtitle: const Text('Used for suspected spinal injury'),
                      value: widget.progress.airwayChecks['JawThrust'],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.progress.airwayChecks['JawThrust'] = value ?? false;
                          if (value == true) {
                            widget.progress.airwayChecks['HeadTilt'] = false;
                          }
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
                            builder: (context) => BreathingCheckPage(
                              progress: widget.progress,
                            ),
                          ),
                        );
                      },
                      child: const Text('Next: Check Breathing'),
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