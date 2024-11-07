import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../providers/assessment_provider.dart';
import '../models/assessment_record.dart';
import '../models/assessment_progress.dart';

class EnvironmentCheckPage extends StatefulWidget {
  final AssessmentProgress progress;

  const EnvironmentCheckPage({
    super.key,
    required this.progress,
  });

  @override
  State<EnvironmentCheckPage> createState() => _EnvironmentCheckPageState();
}

class _EnvironmentCheckPageState extends State<EnvironmentCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: 'Environment Protection'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Environmental Protection',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...widget.progress.environmentChecks.entries.map((item) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          CheckboxListTile(
                            title: Row(
                              children: [
                                Icon(
                                  item.value['icon'] as IconData,
                                  color: const Color(0xFF00AC83),
                                ),
                                const SizedBox(width: 8),
                                Text(item.key),
                              ],
                            ),
                            subtitle: Text(item.value['description'] as String),
                            value: item.value['used'] as bool,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.progress.environmentChecks[item.key]!['used'] = value;
                                if (!value! && item.key == 'Heat Packs') {
                                  widget.progress.environmentChecks[item.key]!['count'] = 0;
                                }
                              });
                            },
                            activeColor: const Color(0xFF00AC83),
                          ),
                          if (item.key == 'Heat Packs' && item.value['used'])
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: Row(
                                children: [
                                  const Text('Number of heat packs used:'),
                                  const SizedBox(width: 16),
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline),
                                    onPressed: item.value['count'] > 0
                                        ? () {
                                            setState(() {
                                              widget.progress.environmentChecks[item.key]!['count']--;
                                            });
                                          }
                                        : null,
                                  ),
                                  Text(
                                    '${item.value['count']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      setState(() {
                                        widget.progress.environmentChecks[item.key]!['count']++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
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
                        final assessment = widget.progress.toRecord();
                        
                        Provider.of<AssessmentProvider>(context, listen: false)
                            .addAssessment(assessment);
                            
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: const Text('Complete Assessment'),
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